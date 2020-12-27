

//Array+transform
public extension Array {
    typealias TransformBlock = (E) -> E?

    //consider renaming to
    //func apply(_ transform: VoidBlock, while any/all/)
    
    
    //MARK: transform + cond
    
    /// if cond is true and the block returns anything - old units are replaced with units from the block
    func transforming(_ block: TransformBlock,
                      while cond: BoolCond) -> Array? {
        if isEmpty {
            return nil
        }
        var new = self
        var changed = false
        
        indices.forEach { i in
            if cond(self[i]),
                let newUnit = block(self[i]) {
                
                new[i] = newUnit
                changed = true
            }
        }
        return changed ? new : nil
    }
    
    /// if cond is true and the block returns anything - old units are replaced with units from the block
    @discardableResult
    mutating func transform(_ block: TransformBlock,
                            while cond: BoolCond) -> Array? {
        if let a = transforming(block, while: cond) {
            return a
        }
        return nil
    }
    
    //MARK: transform + all conds
    
    /// if cond is true and the block returns anything - old units are replaced with units from the block
    func transforming(_ block: TransformBlock,
                      whileAllAreTrue conds: [BoolCond]) -> Array? {
        if isEmpty {
            return nil
        }
        var new = self
        var changed = false
        
        indices.forEach { i in
            if conds.allSatisfy({ $0(self[i]) }),
                let newUnit = block(self[i]) {
                
                new[i] = newUnit
                changed = true
            }
        }
        return changed ? new : nil
    }
    
    /// if cond is true and the block returns anything - old units are replaced with units from the block
    @discardableResult
    mutating func transform(_ block: TransformBlock,
                            whileAllAreTrue conds: [BoolCond]) -> Bool {
        if let a = transforming(block, whileAllAreTrue: conds) {
            self = a
            return true
        }
        return false
    }
    
    //MARK: transform + some conds
    
    /// if cond is true and the block returns anything - old units are replaced with units from the block
    /// some -> maybe all!
    func transforming(_ block: TransformBlock,
                      whileSomeAreTrue conds: [BoolCond]) -> Array? {
        if isEmpty {
            return nil
        }
        var new = self
        var changed = false
        
        indices.forEach { i in
            if conds.has({ $0(self[i]) }),
                let newUnit = block(self[i]) {
                
                new[i] = newUnit
                changed = true
            }
        }
        return changed ? new : nil
    }
    
    /// if cond is true and the block returns anything - old units are replaced with units from the block
    /// some -> maybe all!
    @discardableResult
    mutating func transform(_ block: TransformBlock,
                            whileSomeAreTrue conds: [BoolCond]) -> Bool {
        if let a = transforming(block, whileSomeAreTrue: conds) {
            self = a
            return true
        }
        return false
    }
    
    //MARK: transform + none conds
    
    /// if cond is true and the block returns anything - old units are replaced with units from the block
    func transforming(_ block: TransformBlock,
                      whileNoneAreTrue conds: [BoolCond]) -> Array? {
        if isEmpty {
            return nil
        }
        var new = self
        var changed = false
        
        indices.forEach { i in
            if conds.allSatisfy({ $0(self[i]) == false }),
                let newUnit = block(self[i]) {
                
                new[i] = newUnit
                changed = true
            }
        }
        return changed ? new : nil
    }
    
    /// if cond is true and the block returns anything - old units are replaced with units from the block
    @discardableResult
    mutating func transform(_ block: TransformBlock,
                            whileNoneAreTrue conds: [BoolCond]) -> Bool {
        if let a = transforming(block, whileNoneAreTrue: conds) {
            self = a
            return true
        }
        return false
    }
    
    //TODO: many - all/some/none
    
    /// maybe bad -> too many effects
    //func transform(_ blocks: [VoidBlock], while cond/any/all/)
    

}
