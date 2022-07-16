


public extension URL {
    
    /// Creates a URL initialized to the given string value.
    init(stringLiteral value: StringLiteralType) {
        guard let url = URL(string: value) else {
            fatalError("Could not create URL from: \(value)")
        }
        self = url
    }
    
    /// Creates a URL initialized to the given value.
    init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        guard let url = URL(string: value) else {
            fatalError("Could not create URL from: \(value)")
        }
        self = url
    }
    
    /// Creates a URL initialized to the given value.
    init(unicodeScalarLiteral value: StringLiteralType) {
        guard let url = URL(string: value) else {
            fatalError("Could not create URL from: \(value)")
        }
        self = url
    }
    
    //MARK: -
    
    func fileLines() throws -> [Str]? {
        try Str(contentsOf: self).components(separatedBy: "\n")
    }
    
    ///  Dictionary of the URL's query parameters
    var queryParameters: [Str: Str]? {
        
        guard let comps = URLComponents(url: self,
                                        resolvingAgainstBaseURL: false),
              let queryItems = comps.queryItems else {
            return nil
        }
        
        var items: [Str: Str] = [:]
        
        queryItems.forEach { item in
            items[item.name] = item.value
        }
        
        return items
    }
    
    ///  URL with appending query parameters.
    /// - Parameter queryParameters: parameters dictionary.
    /// - Returns: URL with appending given query parameters.
    func appending(queryParameters params: [Str: Str]) -> URL {
        var urlComps = URLComponents(url: self,
                                     resolvingAgainstBaseURL: true)!
        var items = urlComps.queryItems ?? []
        items += params.map({ URLQueryItem(name: $0, value: $1) })
        urlComps.queryItems = items
        return urlComps.url!
    }
    
    ///  Append query parameters to URL.
    /// - Parameter queryParameters: parameters dictionary.
    mutating func append(queryParameters params: [Str: Str]) {
        self = appending(queryParameters: params)
    }
    
    var toHTTPS: URL {
        guard scheme != "https" else {
            return self
        }
        
        let str = absoluteString.replacingOccurrences(of: "http://", with: "https://")
        
        return URL(string: str)!
    }
}

public extension URL {
    var contents: AsyncStream<[String]?>? {
        guard let charPath = path.cString(using: .utf8) else {
            return nil
        }
        
        let descriptor = open(charPath, O_EVTONLY)
        guard descriptor != -1 else {
            return nil
        }
        
        return AsyncStream([String]?.self) { continuation in
            let eventSource = DispatchSource.makeFileSystemObjectSource(fileDescriptor: descriptor,
                                                                        eventMask: .all, queue: .main)
            eventSource.setCancelHandler {
                close(descriptor)
            }
            
            continuation.onTermination = { _ in
                eventSource.cancel()
            }
            
            func yieldContents() {
                continuation.yield(try? FileManager.default.contentsOfDirectory(atPath: path))
            }
            
            eventSource.setRegistrationHandler(handler: yieldContents)
            eventSource.setEventHandler(handler: yieldContents)
            eventSource.activate()
        }
    }
}

public extension Data {
    
    init(filepath: Str) throws {
        try self.init(contentsOf: URL(fileURLWithPath: filepath))
    }
}


// public extension Str {
//        func append(pathComponents components: Str ...) -> Str {
//            var ns = self as NSString
//            for component in components {
//                ns = ns.appendingPathComponent(component) as NSString
//            }
//            return ns as Str
//        }
// }

//public extension URL {
//
//    static var random: URL {
//        let urlList = ["http://www.google.com", "http://leagueoflegends.com/", "https://github.com/", "http://stackoverflow.com/", "https://medium.com/", "http://9gag.com/gag/6715049", "http://imgur.com/gallery/s9zoqs9", "https://www.youtube.com/watch?v=uelHwf8o7_U"]
//        return URL(string: urlList.randomElement()!)!
//    }
//}
