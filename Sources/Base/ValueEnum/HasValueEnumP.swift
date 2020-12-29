


public protocol HasValueEnumP {
    
    var value: ValueEnum {get}
}
//public extension HasValueEnumP {}


public protocol HasValueEnum_P {
    
    var _value: ValueEnum? {get}
}
public extension HasValueEnum_P {
    //TODO:
    //    case bool(Bool)
    //    case int(Int)
    //    case double(Double)
    //    case str(Str)
    //    case char(Char)
    //    case rng(Rng)
}
//TODO: consider impl HasMutValueEnum_P


public protocol HasMutValueEnumP: HasValueEnumP {
    
    var value: ValueEnum {get set}
}
//public extension HasValueEnumP {}

