

// Freq table
public extension Collection where Element: Hashable {
    //typealias SetType = Set<E>
    
    func freqTable() -> [E : Int]? {
        var r = [E : Int]()
        uniqued().forEach { unit in
            
            r[unit] = count{$0 == unit}
            
            //            if r[$0] == nil {
            //                r[$0] = 1
            //            } else {
            //                r[$0]! += 1
            //            }
        }
        return r.sth
    }
    
    //    func indexTable() -> [E : [Int]]? {
    //        fatalError()
    //        //        var r = [E : [Int]]()
    //        //        uniqued().forEach { unit in
    //        //
    //        //            r[unit] = self.indices(where: {$0 == unit})
    //        //        }
    //        //        return r.sth
    //    }
}
