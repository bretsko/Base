

public protocol InitsWithStr_P {
    
    init?(_ str: Str)
}
public extension InitsWithStr_P {
    
    /// if preprocess is true - will lowercase and filter the string from all illegal characters
    init?(_ str: Str,
          preprocess: Bool) {
        let str1 = preprocess ? str.preprocessed : str
        self.init(str1)
    }
}

/// can init with string and be represented with it
public protocol StrConvertibleP: InitsWithStr_P, HasStrAndDescrP {} //HasStrSetP


//MARK: - InitsWithStrs_P

public protocol InitsWithStrs_P: InitsWithStr_P {
    
    init?(_ strs: [Str])
}
public extension InitsWithStrs_P {
    
    /// if preprocess is true - will lowercase and filter the string from all illegal characters
    init?(_ strs: [Str],
          preprocess: Bool) {
        
        let strs1 = preprocess ? strs.map{$0.preprocessed} : strs
        self.init(strs1)
    }
    
    init?(_ str: Str) {
        self.init([str])
    }
}

/// can init with strings and be represented with them
public protocol StrsConvertibleP: InitsWithStrs_P, HasStrSetAndDescrP {} //HasStrSetP

