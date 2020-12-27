

//TODO: consider making a struct if too much func-ty ?
public typealias ICSet = Set<IChar>


//TODO: try bridge via array
public extension Set where Element == ICSet {
    
    var ichars: [IChar] {
        array.ichars
    }
    
    var chars: [IChar] {
        array.chars
    }
    
    /// currently used to refer to parts of Phrase
    var range: Rng {
        array.range
    }
    
    // all index vars are impl-d in Array+hasIdxP
    
    // done in Set+HasIdxP ?
    //    var indexes: [Int] {
    //         array.indexes
    //    }
    
    //TODO:
    // compare with icset
    
    // merge with icset
    
    // diff with icset
    
    // str + range
    
}


