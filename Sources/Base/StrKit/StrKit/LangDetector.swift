//
//  LangDetector.swift
//  Base
//
//  Created by Oleksandr Bretsko on 16.07.2022.
//

import NaturalLanguage

//Don't use an instance of NLLanguageRecognizer from more than one thread simultaneously.



//make small service for lang detection, POS parsing,  String extensions
// consider making an actor - to solve access from multiple threads


//let languageRecognizer = NLLanguageRecognizer()
//languageRecognizer.processString(string)
//
//// static !
////NLLanguageRecognizer.dominantLanguage(for: string)
//// -> make String ext
//
//
//// Identify the dominant language.
//if let language = recognizer.dominantLanguage {
//    preturn language
//}


//// Generate up to two language hypotheses.
//let hypotheses = recognizer.languageHypotheses(withMaximum: 2)
////print(hypotheses)
//
//
//// Specify constraints for language identification.
//recognizer.languageConstraints = [.french, .english, .german,
//                                  .italian, .spanish, .portuguese]
//
//
//recognizer.languageHints = [.french: 0.5,
//                            .english: 0.9,
//                            .german: 0.8,
//                            .italian: 0.6,
//                            .spanish: 0.3,
//                            .portuguese: 0.2]
//
//let languageProbabilities = languageRecognizer.languageHypotheses(withMaximum: 3)
//
//for (language, probability) in languageProbabilities {
//    print("Detected \(language.rawValue.uppercased()), probability \(probability)")
//}
//
//
//
//
//let string = "Natural language detection"
//
//if let language = NLLanguageRecognizer.dominantLanguage(for: string) {
//    print("Detected \(language.rawValue.uppercased()) as dominant language for: \n\"\(string)\"")
//} else {
//    print("Could not recognize language for \(string)")
//}
//
//
//languageRecognizer.reset()




//TODO:  better have static shared and reset ?
// Reset the recognizer to its initial state.
//recognizer.reset()


// Process additional strings for language identification.
//recognizer.processString("Este es un idioma diferente.")

// see https://developer.apple.com/documentation/naturallanguage/identifying_the_language_in_text
