


public extension Array where Element == HasIDP {
    
    var ids: [ID] {
        map{$0.id}
    }
    var idSet: Set<ID> {
        ids.set
    }
    
    
    func allHave(_ id: ID) -> Bool {
        allSatisfy{$0.id == id}
    }
    func noneHave(_ id: ID) -> Bool {
        allSatisfy{$0.id != id}
    }
    /// all present
    func hasUnits(with ids: [ID]) -> Bool {
        allSatisfy{ids.contains($0.id)}
    }
    /// some -> maybe all!
    func hasSomeUnits(with ids: [ID]) -> Bool {
        has{ids.contains($0.id)}
    }
    
    func unit(with id: ID) -> E? {
        first(where: {$0.id == id})
    }
    
    /// returns all or nothing
    func units(with ids: [ID],
               allOrNothing: Bool = true) -> [E]? {
        if allOrNothing {
            guard hasUnits(with:ids) else {
                return nil
            }
        }
        return filter{ids.contains($0.id)}
    }
}


public extension Array where Element: HasIDP {
    
    var ids: [ID] {
        map{$0.id}
    }
    var idSet: Set<ID> {
        ids.set
    }
    
    
    func allHave(_ id: ID) -> Bool {
        allSatisfy{$0.id == id}
    }
    func noneHave(_ id: ID) -> Bool {
        allSatisfy{$0.id != id}
    }
    /// all present
    func hasUnits(with ids: [ID]) -> Bool {
        allSatisfy{ids.contains($0.id)}
    }
    /// some -> maybe all!
    func hasSomeUnits(with ids: [ID]) -> Bool {
        has{ids.contains($0.id)}
    }
    
    func unit(with id: ID) -> E? {
        first(where: {$0.id == id})
    }
    
    /// returns all or nothing
    func units(with ids: [ID],
               allOrNothing: Bool = true) -> [E]? {
        if allOrNothing {
            guard hasUnits(with:ids) else {
                return nil
            }
        }
        return filter{ids.contains($0.id)}
    }
}


public extension Set where Element: HasIDP {
    var ids: [ID] {
        map{$0.id}
    }
    var idSet: Set<ID> {
        ids.set
    }
    
    func allHave(_ id: ID) -> Bool {
        array.allHave(id)
    }
    func noneHave(_ id: ID) -> Bool {
        array.noneHave(id)
    }
    
    /// all present
    func hasUnits(with ids: [ID]) -> Bool {
        array.hasUnits(with: ids)
    }
    /// some -> maybe all!
    func hasSomeUnits(with ids: [ID]) -> Bool {
        array.hasSomeUnits(with: ids)
    }
    
    func unit(with id: ID) -> E? {
        array.unit(with: id)
    }
    
    /// returns all or nothing
    func units(with ids: [ID],
               allOrNothing: Bool = true) -> [E]? {
        array.units(with: ids,
                    allOrNothing: allOrNothing)
    }
    
    //TODO: set funcs
}


