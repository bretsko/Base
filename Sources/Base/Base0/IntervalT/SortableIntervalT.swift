

// between 2 obj states
public protocol SortableIntervalT: IntervalT, HasSortableTypeT {}

public extension SortableIntervalT {
    
    func isInside(_ other: Self) -> Bool {
        start.follows(other.start) && other.end.follows(end)
    }
    
    func hasInside(_ other: Self) -> Bool {
        other.start.follows(start) && end.follows(other.end)
    }
    
    //after
    func follows(_ other: Self) -> Bool {
        start.follows(other.start) && start.follows(other.end)
    }
    
    //before
    func precedes(_ other: Self) -> Bool {
        other.start.follows(start) && other.start.follows(end)
    }
    
    //TODO: check if it works
    func intersects(_ other: Self) -> Bool {
        (other.start.follows(start) && end.follows(other.start)) || (start.follows(other.start) && other.end.follows(start))
    }
    
    func isOutside(_ other: Self) -> Bool {
        !intersects(other)
    }
}



