


public protocol HasDoubleP {
    
    var value: Double {get}
}
public protocol HasMutDoubleP: HasDoubleP {
    
    var value: Double {get set}
}

public protocol InitsWithDoubleP {

    init(_ value: Double)
}

public typealias DoubleConvertibleP = HasDoubleP & InitsWithDoubleP

public typealias DoubleConvertibleT = DoubleConvertibleP & Hashable


//TODO: Array + Set ext, average, other statistical funcs



//TODO:
public extension Array where Element: HasDoubleP {

    /// filter {$0.value == value}
    func filter(with value: Double) -> Array {
        filter {$0.value == value}
    }
    /// filter {$0.value != value}
    func filter(without value: Double) -> Array {
        filter {$0.value != value}
    }
}


public extension Set where Element: HasDoubleP {

    /// filter {$0.value == value}
    func filter(with value: Double) -> Set {
        filter {$0.value == value}.set
    }
    /// filter {$0.value != value}
    func filter(without value: Double) -> Set {
        filter {$0.value != value}
    }
}



