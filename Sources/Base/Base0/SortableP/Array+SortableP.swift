


public extension Array where Element: SortableP {
    
    var sorted: Array {
        //TODO: or vice versa ?
        sorted(by: {$0.follows($1)} )
    }
    
    var max: E? {
        sorted.last
    }
    var min: E? {
        sorted.first
    }
    
    func filterFollowers(of unit: E) -> Array? {
         filter{$0.follows(unit)}.sth
    }
    func filterPreceders(of unit: E) -> Array? {
         filter{unit.follows($0)}.sth
    }
    func countFollowers(of unit: E) -> Int? {
        filterFollowers(of: unit)?.len
    }
    func countPreceders(of unit: E) -> Int? {
        filterPreceders(of: unit)?.len
    }
    
    func hasFollowers(of unit: E) -> Bool {
        filterFollowers(of: unit) != nil
    }
    func hasPreceders(of unit: E) -> Bool {
        filterPreceders(of: unit) != nil
    }
}

public extension Set where Element: SortableP {
    
    var max: E? {
        array.max
    }
    var min: E? {
        array.min
    }
    
    func filterFollowers(of unit: E) -> Set? {
        array.filterFollowers(of: unit)?.set
    }
    func filterPreceders(of unit: E) -> Set? {
        array.filterPreceders(of: unit)?.set
    }
    func countFollowers(of unit: E) -> Int? {
        filterFollowers(of: unit)?.len
    }
    func countPreceders(of unit: E) -> Int? {
        filterPreceders(of: unit)?.len
    }
    
    func hasFollowers(of unit: E) -> Bool {
        array.hasFollowers(of: unit)
    }
    func hasPreceders(of unit: E) -> Bool {
        array.hasPreceders(of: unit)
    }
}
