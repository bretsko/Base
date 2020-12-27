


public extension Array where Element: HasRngP {
    
    var ranges: [Rng] {
        map{$0.rng}
    }
    
    func allHave(_ rng: Rng) -> Bool {
        allSatisfy{$0.rng == rng}
    }
    func noneHave(_ rng: Rng) -> Bool {
        allSatisfy{$0.rng != rng}
    }
    /// some -> maybe all!
    func someHave(_ rng: Rng) -> Bool {
        has{$0.rng == rng}
    }
    /// some -> maybe all!
    func someDontHave(_ rng: Rng) -> Bool {
        has{$0.rng != rng}
    }
    
    //TODO: getRanges
    //    func getRanges(withIndexesMoreThan idx: Int,
    //                  includingIt: Bool) -> [Rng]? {
    //         filter {
    //            getRanges(withIndexesMoreThan: idx, includingIt: includingIt)
    //        }
    //    }
    //
    //    func getRange(withIndexesLessThan idx: Int,
    //                  includingIt: Bool) -> [Rng]?{
    //         rng.getRange(withIndexesLessThan: idx,
    //                              includingIt: includingIt)
    //    }
    //
    //    func getRange(from idx1: Int,
    //                  to idx2: Int,
    //                  includingBoth: Bool) -> [Rng]?{
    //         rng.getRange(from: idx1,
    //                              to: idx2,
    //                              includingBoth: includingBoth)
    //    }
    
    
    //    func contain(_ rng: Rng,
    //                  includingEnds: Bool) -> Bool{
    //         rng.contains(rng,
    //                              includingEnds: includingEnds)
    //    }
    //    func isInRange(_ rng: Rng,
    //                   includingEnds: Bool) -> Bool{
    //         rng.isInRange(rng,
    //                               includingEnds: includingEnds)
    //    }
    //
    //    func isOutside(_ rng: Rng) -> Bool{
    //         rng.isOutside(rng)
    //    }
    
}



//TODO: try bridge via array
public extension Set where Element: HasRngP {
    
    var ranges: [Rng] {
        array.ranges
    }
    
    func allHave(_ rng: Rng) -> Bool {
        array.allHave(rng)
    }
    func noneHave(_ rng: Rng) -> Bool {
        array.noneHave(rng)
    }
    /// some -> maybe all!
    func someHave(_ rng: Rng) -> Bool {
        array.someHave(rng)
    }
    /// some -> maybe all!
    func someDontHave(_ rng: Rng) -> Bool {
        array.someDontHave(rng)
    }
}

//TODO: try bridge via array
//public extension Set where Element: HasRngP {
//
//    /// contains all
//    /// rng of this array
//    func contains(_ items: Array,
//                  in rng: Rng) -> Bool {
//         units(in: rng)?.contains(items) == true
//    }
//    /// rng of this array
//    func contains(some items: Array,
//                      in rng: Rng) -> Bool {
//         units(in: rng)?.contains(some:items) == true
//    }
//    /// rng of this array
//    func contains(no items: Array,
//                      in rng: Rng) -> Bool {
//         !containsSome(items, in: rng)
//    }
////TODO: add conv has()

//    //MARK: removeDuplicates
//
//    /// s true if any were removed
//    @discardableResult
//    mutating func removeDuplicates(in rng: Rng) -> Bool {
//        if let a = removingDuplicates(in: rng) {
//            self = a
//            return true
//        }
//        return false
//    }
//
//    /// s new array if any were removed
//    /// (if empty array was given it is ed)
//    func removingDuplicates(in rng: Rng) -> Array? {
//         units(in: rng)?.removingDuplicates
//    }
//
//    func containsDuplicates(in rng: Rng) -> Bool {
//         removingDuplicates(in: rng) != nil
//    }
//
//    //MARK: indexes
//
//    /// uses Equatable to check
//
//    func indexes(of item: E, in rng: Rng) -> [Int]? {
//         units(in: rng)?.indexes(of: item)
//    }
//
//    //MARK: unique
//
//    /// empty array can be ed
//    func uniqued(in rng: Rng) -> Array? {
//         units(in: rng)?.uniqued
//    }
//
//    /// shifts indices
//    /// s false if some were not added
//    @discardableResult
//    mutating func insertUnique(_ items: Array,
//                               at index: Int) -> Bool {
//        L.notImpl()
//        //        guard !items.isEmpty else {
//        //             false
//        //        }
//        //        var added = true
//        //        for item in items {
//        //            if !contains(item) {
//        //                self.append(item)
//        //            } else {
//        //                added = false
//        //            }
//        //        }
//        //        return added
//    }
//}

