


public extension Array where Element == ICSet {
    
    var ichars: [IChar] {
        L.notImpl()
        // map{$0.char}
    }
    
    var chars: [IChar] {
        L.notImpl()
        // map{$0.char}
    }
    
    var range: Rng {
        L.notImpl()
    }
    
    // done in Set+HasIdxP ?
    //    var indexes: [Int] {
    //        L.notImpl()
    //        // map{$0.idx}
    //    }
    
    //    var strs: [Str] {
    //         map{$0.char}
    //    }
    //    var icsetSet: Set<ICSet> {
    //         Set(self)
    //    }
    
    //MARK: contain
    
    //TODO:
//    func allContain(_ str: ICSet) -> Bool {
//         allSatisfy{$0.contains(str)}
//    }
//    func noneContain(_ str: ICSet) -> Bool {
//         allSatisfy{!$0.contains(str)}
//    }
//    func someContain(_ str: ICSet) -> Bool {
//         has{$0.contains(str)})
//    }
//
//    
//    func allContain(_ str: Str) -> Bool {
//         allSatisfy{$0.contains(str)}
//    }
//    func noneContain(_ str: Str) -> Bool {
//         allSatisfy{!$0.contains(str)}
//    }
//    func someContain(_ str: Str) -> Bool {
//         has{$0.contains(str)})
//    }
}




