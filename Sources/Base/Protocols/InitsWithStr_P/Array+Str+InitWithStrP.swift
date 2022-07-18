

//@_exported import Base


public extension Array where Element == Str {
    
    /// Tries to parse given types (which can init with String)
    /// each line can have a list of comma separated objects (which can init with Str)
    /// Note: spaces are filtered
    func parseLines<T: InitsWithStr_P>(separatedBy charSet: CharSet = CharSet([","])) -> [T]? {
        compactMap {
            // splits by comma
            $0.trimmingSpacesAndNewlines
                .parseStrInitables(separatedBy: charSet)
        }.flatMap{$0}.sth
    }
}


public extension Set where Element == Str {
    
    /// Tries to parse given types (which can init with String)
    /// each line can have a list of comma separated objects, which can init with Str
    /// Note: spaces are filtered
    func parseLines<T: InitsWithStr_P>(separatedBy charSet: CharSet = CharSet([","])) -> [T]? {
        array.parseLines(separatedBy: charSet)
    }
}




