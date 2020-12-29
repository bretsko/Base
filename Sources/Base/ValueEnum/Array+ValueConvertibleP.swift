

//MARK: -

public extension Array where Element: ValueConvertibleP {
    var values: [ValueEnum] {
         map{$0.value}
    }
    var valueSet: Set<ValueEnum> {
         values.set
    }
}
public extension Set where Element: ValueConvertibleP {
    var values: [ValueEnum] {
         map{$0.value}
    }
    var valueSet: Set<ValueEnum> {
         values.set
    }
}

