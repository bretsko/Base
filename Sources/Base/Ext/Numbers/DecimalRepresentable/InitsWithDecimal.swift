

public protocol InitsWithDecimalP {
        
    init(_ value: Decimal)
}

public extension InitsWithDecimalP {

    init(_ value: Int8) {
        self.init(Decimal(value))
    }
    
    init(_ value: Int16) {
        self.init(Decimal(value))
    }
    
    init(_ value: Int32) {
        self.init(Decimal(value))
    }
    
    init(_ value: Int64) {
        self.init(Decimal(value))
    }
    
    init(_ value: UInt8) {
        self.init(Decimal(value))
    }
    
    init(_ value: UInt16) {
        self.init(Decimal(value))
    }
    
    init(_ value: UInt32) {
        self.init(Decimal(value))
    }
    
    init(_ value: UInt64) {
        self.init(Decimal(value))
    }
    
    init(_ value: Int) {
        self.init(Decimal(value))
    }
    
    init(_ value: UInt) {
        self.init(Decimal(value))
    }
}
