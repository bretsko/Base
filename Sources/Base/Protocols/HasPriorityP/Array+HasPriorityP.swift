

public extension Array where Element: HasPriorityP {
    
    var priorities: [Double] {
        map{$0.priority}
    }
    var sortedByPriority: Array {
        sorted(by: {$0.priority < $1.priority})
    }
    
    var totalPriority: Double? {
        priorities.sth?.sum
    }
    var avgPriority: Double? {
        priorities.average
    }
    var minPriority: Double? {
        priorities.first
    }
    var maxPriority: Double? {
        priorities.last
    }
    
    
    /// if not empty
    func probabilityOf(priority: Double) -> Double? {
        priorities.probability(of: priority)
    }
    /// if not empty
    func probabilityOf(priorities: [Double]) -> Double? {
        priorities.probability(of: priorities)
    }
    
    var withMinPriority: Array? {
        if let minPriority {
            return filterSth{$0.priority == minPriority}
        }
        return nil
    }
    var withMaxPriority: Array?  {
        if let maxPriority {
            return filterSth{$0.priority == maxPriority}
        }
        return nil
    }
    var withAvgPriority: Array? {
        if let avgPriority {
            return filterSth{$0.priority == avgPriority}
        }
        return nil
    }
}



public extension Set where Element: HasPriorityP {
    
    var priorities: Set<Double> {
        array.priorities.set
    }
    var sortedByPriority: Set<E> {
        array.sortedByPriority.set
    }
    
    var totalPriority: Double? {
        array.totalPriority
    }
    var avgPriority: Double? {
        array.avgPriority
    }
    var minPriority: Double? {
        array.minPriority
    }
    var maxPriority: Double? {
        array.maxPriority
    }
    
    
    var withMinPriority: Set? {
        array.withMinPriority?.set
    }
    var withMaxPriority: Set?  {
        array.withMaxPriority?.set
    }
    var withAvgPriority: Set? {
        array.withAvgPriority?.set
    }
    
    /// if not empty
    func probabilityOf(priority: Double) -> Double? {
        array.probabilityOf(priority:priority)
    }
    /// if not empty
    func probabilityOf(priorities: [Double]) -> Double? {
        array.probabilityOf(priorities:priorities)
    }
}


//MARK: -

//?
//public extension Array where Element: HasPriorityP {
//
//    /// filter {$0.str == str}
//    func filterWithPriority(over priority: Double) -> Array {
//        filter {$0.priority > priority}
//    }
//    /// filter {$0.str != str}
//    func filterWithPriority(above prob: Double) -> Array {
//        filter {$0.priority < priority}
//    }
//}




//MARK: - HasMutPriorityP

//public extension Array where Element: HasMutPriorityP {

//TODO: use priorities of all

//    /// returns false if already the highest
//    @discardableResult
//    mutating func setMaxPriority() -> Bool {
//        guard !hasMaxPriority else {
//            return false
//        }
//        priority = 1.0
//        return true
//    }
//
//    /// returns false if already the lowest
//    @discardableResult
//    mutating func setMinPriority() -> Bool {
//        guard !hasMinPriority else {
//            return false
//        }
//        priority = 0.0
//        return true
//    }
//
//    /// if other has max, changes other's priority by subtracting from it the provided step
//    /// if other's priority was changed - returns it with new value
//    /// if other already has higher priority - add step anyway!
//    /// if this obj's priority is alrady max - no effect!
//    /// Be careful using this with many unit, conflicts possible!
//    @discardableResult
//    mutating func prioritizeMore(than other: HasMutPriorityP,
//                                 with step: Double = 0.1) -> HasMutPriorityP? {
//        crashIfFalse(isValidPriority(step))
//
//        if other.hasMaxPriority {
//            var a = other
//            a.decreasePriority(step)
//            increasePriority(step)
//            return a
//
//        } else {
//            increasePriority(step)
//            return nil
//        }
//    }
//
//    /// if other has min, changes other's priority by adding to it the provided step
//    /// if other's priority was changed - returns it with new value
//    /// if other already has higher priority - add step anyway!
//    /// if this obj's priority is alrady minimal - no effect!
//    /// Be careful using this with many unit, conflicts possible!
//    @discardableResult
//    mutating func prioritizeLess(than other: HasMutPriorityP,
//                                 with step: Double = 0.1) -> HasMutPriorityP? {
//        crashIfFalse(isValidPriority(step))
//
//        if other.hasMinPriority {
//            var a = other
//            a.increasePriority(step)
//            decreasePriority(step)
//            return a
//
//        } else {
//            decreasePriority(step)
//            return nil
//        }
//    }
//
//    /// returns false if cannot inrease anymore
//    @discardableResult
//    mutating func increasePriority(_ step: Double = 0.1) -> Bool {
//        crashIfFalse(isValidPriority(step))
//
//        if step + priority > 1 { // cannot be > 1
//            priority = 1
//            return false
//        }
//        priority += step
//        return true
//    }
//
//    /// returns false if cannot decrease anymore
//    @discardableResult
//    mutating func decreasePriority(_ step: Double = 0.1) -> Bool {
//        crashIfFalse(isValidPriority(step))
//
//        if step > priority { // cannot be < 0
//            priority = 0
//            return false
//        }
//        priority -= step
//        return true
//    }
//}
