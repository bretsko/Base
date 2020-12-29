


public protocol CodableImpl: Codable {}
public extension CodableImpl {
    init(from decoder: Decoder) throws {
        fatalError()
    }
    func encode(to encoder: Encoder) throws {
        fatalError()
    }
}

//MARK: -


public extension Data {
    
    @inline(__always)
    func decode<T: Decodable>() -> T? {
        try? JSONDecoder().decode(T.self, from: self)
    }
}

public func encode<T: Encodable>(encodable: T) -> Data? {
    try? JSONEncoder().encode(encodable)
}

public extension Encodable {
    
    /// only for testing
    var _str: Str? {
        guard let data = _encode() else {
            return nil
        }
        guard let json = data._json() else {
            return nil
        }
        return Str(describing: json)
    }
    
    /// only for testing
    func _encode() -> Data? {
        guard let data = try? JSONEncoder().encode(self) else {
            print("JSONEncoder failed to encode")
            return nil
        }
        return data
    }
}

public typealias JSON = [Str : Any]


public extension Data {
    
    /// only for testing
    func _decode<T: Decodable>(type: T) -> T? {
        try? JSONDecoder().decode(T.self, from: self)
    }
    
    /// only for testing
    func _json() -> JSON? {
        guard let json = try? JSONSerialization.jsonObject(with: self, options: []) as? JSON else {
            print("JSONSerialization failed to encode")
            return nil
        }
        return json
    }
}

//MARK: -


public extension Encodable {
    
    //TODO: need optiona to say if overwrite should be done. Also check if duplicate func is already in SwiftShell
    
    /// overwrites if file already exists!
    func export(to location: Str) throws {
        
        let url = URL(fileURLWithPath: location)
        guard let data = self.encode2data() else {
            //print("failed to export db")
            return
        }
        
        //
        if FileManager.default.fileExists(atPath: url.path) {
            try FileManager.default.removeItem(at: url)
        }
        
        try data.write(to: url, options: Data.WritingOptions.atomic)
        //let fh = try! FileHandle(forReadingFrom: url)
        //fh.closeFile()
        //print("Succesfully exported db")
    }
    
    @inline(__always)
    func encode2data() -> Data? {
        Base.encode(encodable: self)
    } 
    
    //    @inline(__always)
    //    public func export(to location: Str)  {
    //        try! encode2data()!.export(to: location)
    //    }
}

public extension Decodable {
    
    init(filepath: Str) throws {
        self = try Data(filepath: filepath).decode()!
    }
}



//public extension Encodable where Self: HasDescrP {
//    var descr: Str {
//        return str()!
//    }
//}
