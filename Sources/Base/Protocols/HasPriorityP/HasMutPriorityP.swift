

public protocol HasMutPriorityP: HasPriorityP {
    /// 0.0 - 1.0
    var priority: Double {get set}
}

public extension HasMutPriorityP {
    
    /// returns false if already the highest
    @discardableResult
    mutating func setMaxPriority() -> Bool {
        guard !hasMaxPriority else {
            return false
        }
        priority = 1.0
        return true
    }
    
    /// returns false if already the lowest
    @discardableResult
    mutating func setMinPriority() -> Bool {
        guard !hasMinPriority else {
            return false
        }
        priority = 0.0
        return true
    }
    
    /// if other has max, changes other's priority by subtracting from it the provided step
    /// if other's priority was changed - returns it with new value
    /// if other already has higher priority - add step anyway!
    /// if this obj's priority is alrady max - no effect!
    /// Be careful using this with many unit, conflicts possible!
    @discardableResult
    mutating func prioritizeMore(than other: HasMutPriorityP,
                                 with step: Double = 0.1) -> HasMutPriorityP? {
        crashIfFalse(isValidPriority(step))
        
        if other.hasMaxPriority {
            var a = other
            a.decreasePriority(by:step)
            increasePriority(by:step)
            return a
            
        } else {
            increasePriority(by:step)
            return nil
        }
    }
    
    /// if other has min, changes other's priority by adding to it the provided step
    /// if other's priority was changed - returns it with new value
    /// if other already has higher priority - add step anyway!
    /// if this obj's priority is alrady minimal - no effect!
    /// Be careful using this with many unit, conflicts possible!
    @discardableResult
    mutating func prioritizeLess(than other: HasMutPriorityP,
                                 with step: Double = 0.1) -> HasMutPriorityP? {
        crashIfFalse(isValidPriority(step))
        
        if other.hasMinPriority {            
            var a = other
            a.increasePriority(by:step)
            decreasePriority(by:step)
            return a
            
        } else {
            decreasePriority(by:step)
            return nil
        }
    }
    
    /// returns false if cannot inrease anymore
    @discardableResult
    mutating func increasePriority(by step: Double = 0.1) -> Bool {
        crashIfFalse(isValidPriority(step))
        
        if step + priority > 1 { // cannot be > 1
            priority = 1
            return false
        }
        priority += step
        return true
    }
    
    /// returns false if cannot decrease anymore
    @discardableResult
    mutating func decreasePriority(by step: Double = 0.1) -> Bool {
        crashIfFalse(isValidPriority(step))
        
        if step > priority { // cannot be < 0
            priority = 0
            return false
        }
        priority -= step
        return true
    }
}
