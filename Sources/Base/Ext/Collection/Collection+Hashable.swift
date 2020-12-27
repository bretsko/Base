

// SetType OR [E]
public extension Collection where Element: Hashable {
    typealias SetType = Set<E>
    
    var set: SetType {
        SetType(self)
    }
    
    //MARK: contains Set
    
    func contains(all units: SetType) -> Bool {
        set.isSuperset(of: units)
    }
    func contains(no units: SetType) -> Bool {
        set.isDisjoint(with: units)
    }
    /// some -> maybe all!
    func contains(some units: SetType) -> Bool {
        !contains(no: units)
    }
    
    /// contains all
    func has(all units: SetType) -> Bool {
        contains(all: units)
    }
    /// some -> maybe all!
    /// contains
    func has(some units: SetType) -> Bool {
        contains(some:units)
    }
    /// contains no
    func has(no units: SetType) -> Bool {
        contains(no: units)
    }
    
    //TODO: more Set funcs
    
    
    //MARK: group
    
    /// grouped into equal units
    var grouped: [Set<E>]? {
        var groups = [Set<E>]()
        //TODO: reduce
        forEach { unit1 in
            groups.enumerated().forEach { i,group in
                group.forEach { unit2 in
                    
                    if unit1 == unit2 {
                        groups[i].insert(unit1, unit2)
                    }
                }
            }
        }
        return groups.sth
    }
    
    //    var grouped: [[E]]? {
    //        grouped(with: { $0 == $1 })
    //    }
    
    //MARK: random
    
    /// returns nil - if the array is empty
    //    func randItems(num: Int) -> SetType? {
    //        if let a = randItem(num:num) {
    //            return SetType(a)
    //        }
    //        return nil
    //    }
    
}

////Array+Hashable
//public extension Array where Element: Hashable {








