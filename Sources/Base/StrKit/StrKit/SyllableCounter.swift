


public extension Str {
    
    //TODO: check rules with https://www.howmanysyllables.com/english_grammar/?s=syllable_rules
    
    
    /// Counts the number of vowels (A, E, I, O, U) in the word.
    /// Adds 1 every time the letter 'y' makes the sound of a vowel (A, E, I, O, U).
    /// Subtracts 1 for each silent vowel (like the silent 'e' at the end of a word).
    /// Subtracts 1 for each diphthong or triphthong in the word.
    /// Diphthong: when 2 vowels make only 1 sound (au, oy, oo)
    /// Triphthong: when 3 vowels make only 1 sound (iou)
    /// Does the word end with "le" or "les?" Add 1 only if the letter before the "le" is a consonant.
    /// The number you get is the number of syllables in your word.
    var numSyllables: Int {
        SyllableCounter.shared.countSyllables(in: self)
    }
}



//  SyllableCounter.swift
//
//  Created by Warren Freitag on 2/14/16.
//  Copyright © 2016 Warren Freitag. All rights reserved.
//  Licensed under the Apache 2.0 License.
//
//  Adapted from a Java implementation created by Hugo "m09" Mougard.
//  https://github.com/m09/syllable-counter


fileprivate class SyllableCounter {
    
    // MARK: - Shared instance
    
    static let shared = SyllableCounter()
    
    // MARK: -  properties
    
    var exceptions: [Str: Int] = [
        "brutes": 1,
        "chummed": 1,
        "flapped": 1,
        "foamed": 1,
        "gaped": 1,
        "h'm": 1,
        "lb": 1,
        "mimes": 1,
        "ms": 1,
        "peeped": 1,
        "sheered": 1,
        "st": 1,
        "queue": 1,
        "none": 1,
        "leaves": 1,
        "awesome": 2,
        "60": 2,
        "capered": 2,
        "caressed": 2,
        "clattered": 2,
        "deafened": 2,
        "dr": 2,
        "effaced": 2,
        "effaces": 2,
        "fringed": 2,
        "greyish": 2,
        "jr": 2,
        "mangroves": 2,
        "messieurs": 2,
        "motioned": 2,
        "moustaches": 2,
        "mr": 2,
        "mrs": 2,
        "pencilled": 2,
        "poleman": 2,
        "quivered": 2,
        "reclined": 2,
        "shivered": 2,
        "sidespring": 2,
        "slandered": 2,
        "sombre": 2,
        "sr": 2,
        "stammered": 2,
        "suavely": 2,
        "tottered": 2,
        "trespassed": 2,
        "truckle": 2,
        "unstained": 2,
        "therefore": 2,
        "businesses": 3,
        "bottleful": 3,
        "discoloured": 3,
        "disinterred": 3,
        "hemispheres": 3,
        "manoeuvred": 3,
        "sepulchre": 3,
        "shamefully": 3,
        "unexpressed": 3,
        "veriest": 3,
        "wyoming": 3,
        "etc": 4,
        "sailmaker": 4,
        "satiated": 4,
        "sententiously": 4,
        "particularized": 5,
        "unostentatious": 5,
        "propitiatory": 6,
    ]
    
    var addSyllables: [NSRegularExpression]!
    var subSyllables: [NSRegularExpression]!
    
    let vowels: Set<Character> = ["a", "e", "i", "o", "u", "y"]
    
    // MARK: - Error enum
    
    enum SyllableCounterError: Error {
        case badRegex(Str)
        case badExceptionsData(Str)
    }
    
    // MARK: - Constructors
    
    public init() {
        do {
            try populateAddSyllables()
            try populateSubSyllables()
        }
        catch SyllableCounterError.badRegex(let pattern) {
            print("Bad Regex pattern: \(pattern)")
        }
        catch SyllableCounterError.badExceptionsData(let info) {
            print("Problem parsing exceptions dataset: \(info)")
        }
        catch {
            print("An unexpected error occured while initializing the syllable counter.")
        }
    }
    
    // MARK: - Setup
    
    func populateAddSyllables() throws {
        try addSyllables = buildRegexes(forPatterns: [
            "ia", "riet", "dien", "iu", "io", "ii",
            "[aeiouy]bl$", "mbl$", "tl$", "sl$", "[aeiou]{3}",
            "^mc", "ism$", "(.)(?!\\1)([aeiouy])\\2l$", "[^l]llien", "^coad.",
            "^coag.", "^coal.", "^coax.", "(.)(?!\\1)[gq]ua(.)(?!\\2)[aeiou]", "dnt$",
            "thm$", "ier$", "iest$", "[^aeiou][aeiouy]ing$"])
    }
    
    func populateSubSyllables() throws {
        try subSyllables = buildRegexes(forPatterns: [
            "cial", "cian", "tia", "cius", "cious",
            "gui", "ion", "iou", "sia$", ".ely$",
            "ves$", "geous$", "gious$", "[^aeiou]eful$", ".red$"])
    }
    
    func buildRegexes(forPatterns patterns: [Str]) throws -> [NSRegularExpression] {
        try patterns.map { pattern -> NSRegularExpression in
            do {
                let regex = try NSRegularExpression(pattern: pattern, options: [.caseInsensitive, .anchorsMatchLines])
                return regex
            }
            catch {
                throw SyllableCounterError.badRegex(pattern)
            }
        }
    }
    
    // MARK: - Public methods
    
    func countSyllables(in word: Str) -> Int {
        if word.count <= 1 {
            return word.count
        }
        
        var mutatedWord = word.lowercased(with: Locale(identifier: "en_US")).trimmingCharacters(in: .punctuationCharacters)
        
        if let exceptionValue = exceptions[mutatedWord] {
            return exceptionValue
        }
        
        if mutatedWord.last == "e" {
            mutatedWord = Str(mutatedWord.dropLast())
        }
        
        var count = 0
        var previousIsVowel = false
        
        for character in mutatedWord {
            let isVowel = vowels.contains(character)
            if isVowel && !previousIsVowel {
                count += 1
            }
            previousIsVowel = isVowel
        }
        
        for pattern in addSyllables {
            let matches = pattern.matches(in: mutatedWord, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: mutatedWord.count))
            if !matches.isEmpty {
                count += 1
            }
        }
        
        for pattern in subSyllables {
            let matches = pattern.matches(in: mutatedWord, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: mutatedWord.count))
            if !matches.isEmpty {
                count -= 1
            }
        }
        
        return (count > 0) ? count : 1
    }
}

//MARK: - Solution 2

//
//
//
//public extension Str {
//
//    //TODO: check rules with https://www.howmanysyllables.com/english_grammar/?s=syllable_rules
//
//
//    /// Counts the number of vowels (A, E, I, O, U) in the word.
//    /// Adds 1 every time the letter 'y' makes the sound of a vowel (A, E, I, O, U).
//    /// Subtracts 1 for each silent vowel (like the silent 'e' at the end of a word).
//    /// Subtracts 1 for each diphthong or triphthong in the word.
//    /// Diphthong: when 2 vowels make only 1 sound (au, oy, oo)
//    /// Triphthong: when 3 vowels make only 1 sound (iou)
//    /// Does the word end with "le" or "les?" Add 1 only if the letter before the "le" is a consonant.
//    /// The number you get is the number of syllables in your word.
//    var numSyllables: Int {
//        return Heuristic.countSyllables(in: self)
//    }
//}
//
//
//fileprivate struct Heuristic {
//
//    static func countSyllables(in word: Str) -> Int {
//
//        let str = word.lowercased()
//        var numSyllables = 0
//        var numDiscardedSyllables = 0
//
//        let numDoubleVowels = applyRegex(str,
//                                         pattern: "[eaoui][eaoui]")
//
//        // (1) if str.len < 3, return 1
//        if str.len < 3 {
//            return str.len > 0 ? 1 : 0
//        }
//
//        // (2) if letters don't end with ["ted", "tes", "ses", "ied", "ies"], then
//        //     discard "es" and "ed" at the end.
//        let last2CharsSubstr = substringToIdx(str, idx: -2)
//        let last3CharsSubstr = substringToIdx(str, idx: -3)
//
//        if let last2CharsSubstr = substringToIdx(str, idx: -2),
//           last2CharsSubstr == "es" ||
//            last2CharsSubstr == "ed" {
//
//            // Check # of vowels.
//            // If there is only 1 vowel or 1 set of consecutive
//            // vowels, then discard.
//            let numConsecutiveVowels = applyRegex(str,
//                                                  pattern: "[eaoui][^eaoui]")
//
//            if numDoubleVowels > 1 ||
//                numConsecutiveVowels > 1,
//               let substr = last3CharsSubstr {
//
//                let discardedEndings = ["ted", "tes", "ses", "ied", "ies"]
//                numDiscardedSyllables += discardedEndings.contains(substr) ? 0 : 1;
//            }
//        }
//
//        // (3) Discard trailing "e", except where ending is "le"
//        guard let lastChar = str.last else { return 0 }
//
//        if lastChar == "e",
//           last2CharsSubstr != "le" {
//            numDiscardedSyllables += 1
//
//        } else if leEndings.contains(str) {
//            numDiscardedSyllables += 1
//        }
//
//        // (4) Check if consecutive vowels exists (triplets or pairs) and len them as one.
//        let numTripleVowels = applyRegex(str,
//                                         pattern: "[eaoui][eaoui][eaoui]")
//        numDiscardedSyllables += numDoubleVowels + numTripleVowels
//
//
//        // (5) Count remaining vowels in word
//        let totalNumVowels = applyRegex(str,
//                                        pattern: "[eaoui]")
//
//        // (6) Add one if starts with "mc"
//        let first2Substr = substringToIdx(str, idx: 2)
//        if first2Substr == "mc" { numSyllables += 1 }
//
//        // (7) Add one if ends with "y" but is not surrounded by vowel
//        if lastChar == "y",
//           let last2CharsIdx = rangeForIdx(str, idx: -2) {
//
//            numSyllables += str[last2CharsIdx].isVowel ? 0 : 1
//        }
//
//        // (8) Add one if "y" is surrounded by non-vowels and is not in the last word.
//        for i in 1..<(str.len-1) { //? str.indices
//
//            guard let checkIdx = rangeForIdx(str, idx: i) else {
//                break
//            }
//            if !str[checkIdx].isVowel { continue }
//
//            let nextIdx = str.index(checkIdx, offsetBy: 1)
//
//            if str[nextIdx] == "y" {
//                // Check following idx
//                if nextIdx.utf16Offset(in: str) == str.len - 1 {
//                    break
//                }
//                //WAS
//                // if nextIdx.encodedOffset == stringLength - 1 {
//                // break
//                // }
//                let finalIdx = str.index(nextIdx, offsetBy: 1)
//                numSyllables += str[finalIdx].isVowel ? 1 : 0
//            }
//        }
//
//        // (9) If starts with "tri-" or "bi-" and is followed by a vowel, add one.
//        guard let first2CharsIdx = rangeForIdx(str, idx: 1) else {
//            return 1 }
//        guard let first2CharsSubstr = substringToIdx(str, idx: 2) else { return 1 }
//
//        let first3CharsIdx = str.index(first2CharsIdx, offsetBy: 1)
//
//        //WAS first3CharsIdx != nil &&
//        if first2CharsSubstr == "bi" ||
//            str.substr(to: first3CharsIdx,
//                       includingIt: false) == "tri" {
//            numSyllables += str[first3CharsIdx].isVowel ? 1 : 0
//        }
//
//        // (10) If ends with "-ian", should be counted as two syllables, except for "-tian" and "-cian"
//        if last3CharsSubstr == "ian",
//           str.len >= 4,
//           let idx = rangeForIdx(str, idx: -4) {
//
//            let fourthLastChar = str[idx]
//            numSyllables += (fourthLastChar == "c" || fourthLastChar == "t") ? 0 : 1
//        }
//
//        // (11) If starts with "co-" and is followed by a vowel,
//        //      check if exists in the double syllable dictionary.
//        //      If not, check if in single dictionary and act accordingly.
//        if first2CharsSubstr == "co",
//           let first3CharsIdx = rangeForIdx(str, idx: 2),
//           str[first3CharsIdx].isVowel,
//           let first6CharsSubstr = substringToIdx(str, idx: 6) {
//
//            numSyllables += first6CharsSubstr == "preach" ? 0 : 1
//        }
//
//        // (13) check for "-n't" and cross match with dictionary to add syllable.
//        if last3CharsSubstr == "n't", negativeWords.contains(str) {
//            numSyllables += 1
//        }
//
//        // (14) Handling the exceptional words.
//        if deleteSyllables.contains(str) {
//            numDiscardedSyllables += 1
//        }
//        if addSyllables.contains(str) {
//            numSyllables += 1
//        }
//
//        let result = totalNumVowels - numDiscardedSyllables + numSyllables
//
//        return result > 0 ? result : 1  // Return at least one syllable
//    }
//
//
//    // try replace with my own
//    //MARK: - helper funcs
//
//    //TODO: try! impl not using
//    static func applyRegex(_ string: Str,
//                           pattern: Str) -> Int {
//        let regex = try! NSRegularExpression(pattern: pattern,
//                                             options: [.caseInsensitive])
//        return regex.numberOfMatches(in: string,
//                                     options: NSRegularExpression.MatchingOptions.reportCompletion,
//                                     range: NSMakeRange(0, string.len))
//    }
//
//    static func rangeForIdx(_ string: Str,
//                            idx: Int) -> Str.Index? {
//        if abs(idx) >= string.len {
//            return nil
//        }
//        var beginIdx = string.startIndex
//        if idx < 0 {
//            beginIdx = string.endIndex
//        }
//        return string.index(beginIdx, offsetBy: idx)
//    }
//
//    static func substringToIdx(_ string: Str,
//                               idx: Int) -> Str? {
//        if abs(idx) >= string.len {
//            return nil
//        }
//        if let idx = rangeForIdx(string, idx: idx) {
//            return string.substr(to: idx,
//                                 includingIt: false)
//        }
//        return nil
//    }
//
//
//    //MARK: - words
//
//
//    static let addSyllables = ["serious", "crucial", "brilliant"]
//    static let deleteSyllables = ["fortunately", "unfortunately"]
//
//    static let coPrefixSingleSyllables = [
//        "cool", "coach", "coat", "coal",
//        "len", "coin", "coarse", "coup",
//        "coif", "cook", "coign", "coiffe",
//        "coof", "court"]
//
//    static let coPrefixDoubleSyllables = ["coapt",
//                                          "coed",
//                                          "coinci"]
//
//    static let prePrefixSingleSyllables = ["preach"]
//
//    static let leEndings = ["whole", "mobile", "pole", "male",
//                            "female", "hale", "pale", "tale",
//                            "sale", "aisle", "whale", "while"]
//
//    static let negativeWords = ["doesn't",
//                                "isn't",
//                                "shouldn't",
//                                "couldn't",
//                                "wouldn't"]
//}

