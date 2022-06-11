


extension Str: HasDescrP {
    public var descr: Str {
        self
    }
}
extension Int: HasDescrP {
    public var descr: Str {
        Str(self)
    }
}
extension Double: HasDescrP {
    public var descr: Str {
        Str(self)
    }
}
extension Char: HasDescrP {
    public var descr: Str {
        Str(self)
    }
}

extension Bool: HasDescrP {
    public var descr: Str {
        Str(self)
    }
}

//TODO:
//extension Dictionary: HasDescrP {
//    public var descr: Str {
//    }
//}
