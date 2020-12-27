

// between 2 obj states
public protocol LimitedIntervalT: IntervalT, HasLimitedTypeT {}

//TODO: consider impl IntervalG


public protocol ELimitedIntervalT: LimitedIntervalT, EIntervalT, HasELimitedTypeT {}
//public extension ELimitedIntervalT {}


public protocol HLimitedIntervalT: ELimitedIntervalT, HIntervalT, HasHLimitedTypeT {}
//public extension HLimitedIntervalT {}


