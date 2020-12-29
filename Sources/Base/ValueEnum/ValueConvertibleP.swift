


// or HasValue
public protocol ValueConvertibleP {
    var value: ValueEnum {get}
}


//MARK: -

extension Str: ValueConvertibleP {}
public extension Str {
    var value: ValueEnum {
         .str(self)
    }
}

extension Int: ValueConvertibleP {}
public extension Int {
    var value: ValueEnum {
         .int(self)
    }
}

extension Bool: ValueConvertibleP {}
public extension Bool {
    var value: ValueEnum {
         .bool(self)
    }
}


extension Double: ValueConvertibleP {}
public extension Double {
    var value: ValueEnum {
         .double(self)
    }
}

