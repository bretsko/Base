

public protocol DecimalRepresentableP: InitsWithDecimalP, HasDecimalValueP {}

public protocol ExpressibleByDecimalP: DecimalRepresentableP, ExpressibleByFloatLiteral {}

public extension ExpressibleByDecimalP {
    
    //MARK: ExpressibleByFloatLiteral
    
    init(floatLiteral value: Double) {
        self.init(Decimal(floatLiteral: value))
    }

    init(integerLiteral value: Int) {
        self.init(Decimal(integerLiteral: value))
    }

    init?<T>(exactly source: T) where T : BinaryInteger {
        guard let _decimal = Decimal(exactly: source) else { return nil }
        self.init(_decimal)
    }
}
