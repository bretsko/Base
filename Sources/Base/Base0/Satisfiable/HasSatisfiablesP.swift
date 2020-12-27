


public protocol HasSatisfiablesP: CanBeSatisfiedP {
    
    var satisfiables: [CanBeSatisfiedP] {get}
}

public extension HasSatisfiablesP {
    // CanBeSatisfiedP
    var isSatisfied: Bool {
        satisfiables.allSatisfy{$0.isSatisfied}
    }
    var numSatisfied: Int {
        satisfiables.count{$0.isSatisfied}
    }
    var numUnsatisfied: Int {
        satisfiables.count{!$0.isSatisfied}
    }
    
    var percentSatisfied: Double {
        numSatisfied.d / satisfiables.len.d
    }
}



