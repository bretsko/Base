
public typealias Str = String
public typealias Substr = Substring
public typealias Char = Character
public typealias CharSet = CharacterSet
public typealias StrIdx = Str.Index

public extension Str {
    typealias CS = CharSet
    
    /// Double(self)
    var num: Double? {
        Double(self)
    }
    
    var chars: [Char] {
        Array(self)
    }
    var charSet: Set<Char> {
        Set(chars)
    }
    
    /// CharSet(charactersIn: self)
    var cs: CS {
        .init(charactersIn: self)
    }
    
    /// first?.s
    var char1: Str? {
        first?.s
    }
    
    
    //MARK: -
    
    /// all chars are lowercased, uses current Locale by default
    func isLowercased(with locale: Locale = .current) -> Bool {
        self == lowercased(with: locale)
    }
    
    /// all chars are uppercased, uses current Locale by default
    func isUppercased(with locale: Locale = .current) -> Bool {
        self == uppercased(with: locale)
    }
    
    
    /// uses current Locale by default
    func lowercase(with locale: Locale = .current) -> Str {
        lowercased(with: locale)
    }
    /// uses current Locale by default
    func uppercase(with locale: Locale = .current) -> Str {
        uppercased(with: locale)
    }
    
    
    //MARK: -

    
    /// all chars are letters
    var isAlpha: Bool {
        hasOnly(.letters)
    }
    
    /// all chars are alphanumeric
    var isAlphanumeric: Bool {
        hasOnly(.alphanumerics)
    }
    
    /// the first characters in all of the words in the str are uppercased
    var isCapitalized: Bool {
        self == capitalized
    }
    
    /// all chars are numbers
    var isNumeric: Bool {
        hasOnly(.decimalDigits)
    }
    
    /// has(.whitespaces)
    var hasSpaces: Bool {
        has(.whitespaces)
    }
    /// has(.whitespacesAndNewlines)
    var hasSpacesAndNewlines: Bool {
        has(.whitespacesAndNewlines)
    }
    
    //TODO: test
    /// decimalDigits
    var isAllDigits: Bool {
        self == components(separatedBy: CharSet.decimalDigits.inverted ).joined(separator: "")
    }
    
    // returns number of characters, taking into account emojis, that are represented by character sequences
    var countWithEmojis: Int {
        var r = 0
        enumerateSubstrings(in: startIndex ..< endIndex, options: .byComposedCharacterSequences) { _, _, _, _ in
            r += 1
        }
        return r
    }
    
    //MARK: -
    
    /// "This is a test (1 2 3)+.".keepingOnly(.alphanumerics)
    /// -> "Thisisatest123"
    func keepingOnly(_ charSet: CS) -> Str? {
        components(separatedBy: charSet.inverted)
            .filterSth{$0.isEmpty}?.joined(separator: "")
    }
        
    /// "    How are you?   ".trimmingSpaces
    /// -> "How are you?"
    var trimmingSpaces: Str {
        trimmingCharacters(in: .whitespaces)
    }
    
    var trimmingNewlines: Str {
        trimmingCharacters(in: .newlines)
    }
    
    /// "This is a test.".removingWhitespace
    /// -> "Thisisatest"
    var removingWhitespace: Str? {
       words?.filterSth{$0.isEmpty}?.joined(separator: "")
    }
    
    /// "    How are you?   ".trimmingSpacesAndNewlines
    /// -> "How are you?"
    var trimmingSpacesAndNewlines: Str {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Trims whitespaces and newlines
    /// "    How are you?   ".trimmed
    /// -> "How are you?"
    var trimmed: Str {
        trimmingSpacesAndNewlines
    }
    
    /// contains only whitespace or newline characters
    var isBlank: Bool {
        trimmingSpacesAndNewlines.isEmpty
    }
    
    //MARK: - URL
    
    /// "https://google.com".isValidUrl -> true
    var isValidUrl: Bool {
        URL(string: self) != nil
    }
    
    /// "file://Documents/file.txt".isValidFileUrl -> true
    var isValidFileUrl: Bool {
        URL(string: self)?.isFileURL ?? false
    }
    
    /// "http://google.com".isValidHttpUrl -> true
    var isValidHttpUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "http"
    }
    
    /// "https://google.com".isValidHttpsUrl -> true
    var isValidHttpsUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "https"
    }
    
    /// "https://google.com".isValidSchemedUrl -> true
    /// "google.com".isValidSchemedUrl -> false
    var isValidSchemedUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme != nil
    }
    
    
    //MARK: -
    
    /// "This    is    a    test.".collapsingWhitespace
    /// -> "This is a test"
    var collapsingWhitespace: Str? {
       words?.filterSth{$0.isEmpty}?.joinedWords
    }
    
    var capitalizingFirstLetter: Str {
        prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = capitalizingFirstLetter
    }
    
    
    //MARK: -
    
    /// filters all punctuation and lowercases (uses current locale by deafult)
    func preprocessed(with locale: Locale = .current) -> Str {
        filter { !"_-()\"'.:;,!?\n\t".contains($0) }
            .trimmingSpacesAndNewlines
            .lowercased(with: locale)
    }
    
    /// filters all punctuation and lowercases (using current locale! )
    var preprocessed: Str {
        preprocessed()
    }
    
    
    //MARK: - tokenizing
    
    /// newline separated string
    var lines: [Str]? {
        split(by: CS.newlines)
    }
    
    /// lines with trimmed spaces
    var nonEmptyLines: [Str]? {
        lines?.filterSth{ $0.trimmingSpaces.hasSth }
    }
    
    
    //MARK: - words

    ///  an array of all words in a string
    /// "Swift is amazing".words() -> ["Swift", "is", "amazing"]
    /// - Returns: The words contained in a string.
    var wordsSeparatedByCommas: [Str]? {
        // https://stackoverflow.com/questions/42822838
        let a = CS.whitespacesAndNewlines.union(.punctuationCharacters)
        return components(separatedBy: a).filterWords
    }
    
    
    ///  Count of words in a string.
    /// "Swift is amazing".wordsCount -> 3
    var wordCount: Int {
        words?.count{$0.hasSth} ?? 0
    }
    
    // Array of strs separated by given string.
    func splited(by separator: Char) -> [Str]? {
        split { $0 == separator }.map(Str.init).sth
    }
    
    // ? or CS.whitespacesAndNewlines.union(.punctuationCharacters)
    /// Returns words separated by space and newline
    /// split(by: CS.whitespacesAndNewlines)
    var words: [Str]? {
        split(by: CS.whitespacesAndNewlines)
    }

    /// words?.dropLast(num).joined
    func words(onlyWith charSet: CharSet) -> Str? {
        words?.drop(while: { word in
            word.hasOnly(charSet)
        }).joinedWords
    }
    

    /// words?.dropFirst(num).joined
    func wordsExceptFirst(_ num: Int) -> Str? {
        words?.dropFirst(num).joinedWords
    }
    
    /// words?.dropLast(num).joined
    func wordsExceptLast(_ num: Int) -> Str? {
        words?.dropLast(num).joinedWords
    }
    
    
    
    /// words?.dropFirst().joined
    var wordsExceptFirst: Str? {
        wordsExceptFirst(1)
    }
    
    /// words?.dropLast().joined
    var wordsExceptLast: Str? {
        wordsExceptLast(1)
    }
    
    
    //MARK: -
    
    var reversed: Str {
        Str(reversed())
    }
    
    mutating func reverse() {
        self = reversed
    }
    
    
    //MARK: - rand
    
    var shuffled: Str {
        var a = chars
        a.shuffle()
        return Str(a)
    }
    
    var randChar: Char? {
        randomElement()
    }
    
    /// returns nil - if the array is empty
    func randChars(num: Int) -> [Char]? {
        chars.randItems(num: num)
    }
    
    
    //MARK: -
    
    var data: Data? {
        data(using: .utf8)
    }
    
    /// Converts self to an unsigned byte array.
    var bytes: [UInt8] {
        utf8.map{$0}
    }
    
    /// returns unicodes for all chars in a string.
    var unicodeArray: [Int] {
        unicodeScalars.map { $0.hashValue }
    }
    
    // encode string for a url query parameter value
    var encodingForURLQueryValue: Str? {
        let charSet = NSMutableCharacterSet.alphanumeric()
        charSet.addCharacters(in: "-._~")
        return addingPercentEncoding(withAllowedCharacters: charSet as CS)
    }
    
    
    init?(utf8chars: [UInt8]) {
        var str = ""
        var generator = utf8chars.makeIterator()
        var utf8 = UTF8()
        var done = false
        
        while !done {
            let r = utf8.decode(&generator)
            
            switch r {
            case .emptyInput:
                done = true
            case let .scalarValue(val):
                str.append(Char(val))
            case .error:
                return nil
            }
        }
        self = str
    }
    
    
    //MARK: - Path
    
    /**
     Creates a new string with a path for the specified directories in the user's home directory.
     
     - parameter directory: The location of a variety of directories
     - note: The directory returned by this method may not exist. This method simply gives you the appropriate location for the requested directory. Depending on the application’s needs, it may be up to the developer to create the appropriate directory and any in between.
     - returns: The string with a path for the specified directories in the user's home directory or `nil` if a path cannot be found.
     */
    init?(path directory: FileManager.SearchPathDirectory) {
        guard let path = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true).first else { return nil }
        self = path
    }
    
    init(filepath: Str)  {
        let data = try! Data(filepath: filepath)
        self = Str(data: data, encoding: .utf8)!
    }
    
    var getPathNameExtension: Str {
        (self as NSString).pathExtension
    }
    
    ///  URL from string (if applicable).
    /// "https://google.com".url -> URL(string: "https://google.com")
    /// "not url".url -> nil
    var url: URL? {
        URL(string: self)
    }
}
extension Str: ReferenceConvertible {
    public typealias ReferenceType = NSString
}
