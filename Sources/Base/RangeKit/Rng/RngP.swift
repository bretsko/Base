

/// Range
public protocol RngP: HasIdxSetP {
    
    /// from and to can be equal
    var from: Int {get}

    /// from and to can be equal
    var to: Int {get}
    
//    func getRange(withIndexesMoreThan idx: Int,
//                  includingIt: Bool) -> Rng?
//
//    func getRange(withIndexesLessThan idx: Int,
//                  includingIt: Bool) -> Rng?
//
//    func getRange(from idx1: Int,
//                  to idx2: Int,
//                  includingBoth: Bool) -> Rng?
//
//
//    func isInRange(_ rng: Rng,
//                   includingEnds: Bool) -> Bool
//
//    func isOutside(_ rng: Rng) -> Bool
  
    
    // == isInRange
//    func contains(_ rng: Rng,
//                  includingEnds: Bool) -> Bool
}

public extension RngP {
        
    /// to - from
    var indexLength: Int {
        to - from
    }
}



