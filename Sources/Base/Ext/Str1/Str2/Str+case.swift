

public typealias CS = CharSet


//Case Operations
public extension Str {
    
    /// Returns a capitalized version of the str.
    ///
    /// - Warning: This method is a modified implementation of Swift stdlib's `capitalized` computer variabled.
    ///
    ///     let str = "hello World"
    ///     print(str.capitalized())
    ///     // Prints "Hello World"
    var capitalized: Str {
        
        var newStr = self
        Regx(.firstChar).match(self).forEach { rng in
            let char = index(rng.lowerBound, offsetBy: 0)
            let uppercasedChar = Str(self[char]).uppercased()
            newStr = newStr.replacingCharacters(in: rng,
                                                with: uppercasedChar)
        }
        return newStr
    }
    
    /// Returns a decapitalized version of the str.
    ///
    ///     let str = "Hello World"
    ///     print(str.decapitalized())
    ///     // Prints "hello world"
    var decapitalized: Str {
        
        var newStr = self
        Regx(.firstChar).match(self).forEach { rng in
            let char = self[rng.lowerBound]
            let lowercasedChar = Str(char).lowercased()
            newStr = newStr.replacingCharacters(in: rng,
                                                with: lowercasedChar)
        }
        return newStr
    }
    
    /// the first characters in all of the words in the str are lowercased
    var isDecapitalized: Bool {
        self == decapitalized
    }
    
    /// Returns the kebab cased (a.k.a. slug) version of the str.
    ///
    ///     let str = "Hello World"
    ///     print(str.kebabCased())
    ///     // Prints "hello-world"
    var kebabCased: Str {
        Regx.sanitize(str: self)
            .splitWordsByCase
            .replacingOccurrences(of: " ", with: "-")
            .lowercased()
    }
    
    /// Returns a pascal cased version of the str.
    ///
    ///     let str = "HELLO WORLD"
    ///     print(str.pascalCased())
    ///     // Prints "HelloWorld"
    var pascalCased: Str {
        Regx.sanitize(str: self)
            .splitWordsByCase
            .capitalized
            .components(separatedBy: .whitespaces).joined()
    }
    
    /// Returns a camel cased version of the str.
    ///
    ///     let str = "HelloWorld"
    ///     print(str.camelCased())
    ///     // Prints "helloWorld"
    var camelCased: Str {
        pascalCased.decapitalized
    }
    // can be done with regex
    //    var camelCased: Str {
    //        let source = lowercased()
    //        let first = source[..<source.index(after: source.startIndex)]
    //        if source.contains(" ") {
    //            let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
    //            let camel = connected.replacingOccurrences(of: "\n", with: "")
    //            let rest = Str(camel.dropFirst())
    //            return first + rest
    //        }
    //        let rest = Str(source.dropFirst())
    //        return first + rest
    //    }
    
    
    /// Returns the snake cased version of the str.
    ///
    ///     let str = "Hello World"
    ///     print(str.snakeCased())
    ///     // Prints "hello_world"
    var snakeCased: Str {
        Regx.sanitize(str: self)
            .splitWordsByCase
            .replacingOccurrences(of: " ", with: "_")
            .lowercased()
    }
    
    /// Splits a str into mutliple words, delimited by uppercase letters.
    ///
    ///     let str = "HelloWorld"
    ///     print(str.splitWordsByCase())
    ///     // Prints "Hello World"
    var splitWordsByCase: Str {
        
        var r = [Str]()
        Regx.sanitize(str: self).forEach { char in
            
            if Str(char) == Str(char).uppercased() {
                r.append(" ")
            }
            r.append(Str(char))
        }
        
        return r.joined()
            .trimmingSpacesAndNewlines
            .components(separatedBy: .whitespaces)
            .filter({ !$0.isEmpty })
            .joined(separator: " ")
    }
}
