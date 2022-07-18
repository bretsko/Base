

//@_exported import Base


public extension Str  {
    
    //TODO: try add args and make more generic, reusable
    
    /// splits string using given chars, trims spaces and tries to init given type
    /// For ex ["Cat, Dog"] -> [Animal]
    func parseStrInitables<T: InitsWithStr_P>(
        separatedBy charSet: CharSet = .init([","])
    ) -> [T]? {
        trimmingSpacesAndNewlines
            .split(by: charSet)?
            .compactMap { T($0) }.sth
    }
    
    // ??
    //    /// tries to find the suffix at the given distance (in spaces)
    //    /// if such suffix is present - it is returned with the rest of the String
    //    /// Note: each String is trimmed of spaces of newlines - beforehand
    //    func find(suffix: Str, in str: Str,
    //                    maxSpacesDistance: Int) -> (Str,Str)? {
    //
    //        let str1 = str.trimmingSpacesAndNewlines
    //
    //    }
    //
    //    /// tries to find the suffix at the given distance (in spaces)
    //    /// if such suffix is present - it is returned with the rest of the String
    //    /// Note: each String is trimmed of spaces of newlines - beforehand
    //    func find(prefix: Str,
    //              in str: Str,
    //              maxSpacesDistance: Int) -> (Str,Str)? {
    //
    //        let str1 = str.trimmingSpacesAndNewlines
    //        if let restStr = str1.removing(prefix: prefix) {
    //            return
    //        }
    //    }
    
    
    // ???
    //    /// tries to find the type's Str in the suffix at the given distance (in spaces)
    //    /// if such suffix is present - it is returned with the rest of the String
    //    /// Note: each String is trimmed of spaces of newlines - beforehand
    //    func extractPrefix<T>(in str: Str) -> (T, Str)? {
    //        fatalError()
    //    }
    //
    //    /// tries to find the suffix at the given distance (in spaces)
    //    /// if such suffix is present - it is returned with the rest of the String
    //    /// Note: each String is trimmed of spaces of newlines - beforehand
    //    func extractSuffix<T>(in str: Str) -> (T) {
    //        fatalError()
    //        //        guard let mod = allCases.first(where: { caseStr in
    //        //            str.hasPrefix(caseStr)
    //        //        }) else {
    //        //            return nil
    //        //        }
    //        //        let restStr = str.removing(prefix: mod.s)!
    //        //        return (restStr, mod)
    //    }
}
