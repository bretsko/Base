

public extension StringProtocol where SubSequence == Substr {

    /// Scan this string for a single substring that appears between
    /// a set of identifiers and terminators, and return any found match.
    func firstSubstr(between identifiers: [Identifier],
                     and terminators: [Terminator]) -> Substr? {
        
        var match: Substr?
        scan(using:
                Matcher(identifiers, terminators,
                        allowMultipleMatches: false, { substr, _ in
                            match = substr
                        }
                ))
        return match
    }
 
    /// Scan this string for a single substring that appears between
    /// a single identifier and terminator, and return any found match.
    func firstSubstr(between identifier: Identifier,
                     and terminator: Terminator) -> Substr? {
         firstSubstr(between: [identifier],
                           and: [terminator])
    }
    
    
    /// Scan this string for substrings appearing between a set of
    /// identifiers and terminators, and return all matches.
    func substrings(between identifiers: [Identifier],
                    and terminators: [Terminator]) -> [Substr]? {
        
        var matches = [Substr]()
        scan(using: Matcher(identifiers, terminators, { match, _ in
            matches.append(match)
        }))
        return matches.sth
    }
    
    
    /// Scan this string for substrings appearing between a single
    /// identifier and terminator, and return all matches.
    func substrings(between identifier: Identifier,
                    and terminator: Terminator) -> [Substr]? {
         substrings(between: [identifier],
                          and: [terminator])
    }
    
    /// Scan this string using a custom array of matchers, defined using
    /// the `Matcher` type, which gets to handle all matched substrings.
    func scan(using matchers: [Matcher]) {
        
        var activeSessions = [(Matcher, Identifier, ClosedRange<Index>)]()
        var partialSessions = [(Matcher, ClosedRange<Index>)]()
        var idleMatchers = matchers
        
        for index in indices {
            let noSessionsRemain = (
                activeSessions.isEmpty &&
                    partialSessions.isEmpty &&
                    idleMatchers.isEmpty
            )
            
            guard !noSessionsRemain else {
                return
            }
            
            activeSessions = activeSessions.compactMap { matcher, identifier, rng in
                let rng = rng.lowerBound...index
                let match = self[rng]
                
                for terminator in matcher.terminators {
                    guard match.hasSuffix(terminator.string) else {
                        continue
                    }
                    
                    if terminator.isSuffix {
                        guard self.index(after: index) == endIndex else {
                            continue
                        }
                    }
                    
                    let endIndex = self.index(rng.upperBound,
                                              offsetBy: -terminator.string.count)
                    
                    if endIndex >= rng.lowerBound {
                        let match = self[rng.lowerBound...endIndex]
                        let identifierLength = identifier.string.count
                        let lowerBound = self.index(rng.lowerBound, offsetBy: -identifierLength)
                        matcher.handler(match, lowerBound...rng.upperBound)
                        
                        guard matcher.allowMultipleMatches else {
                            return nil
                        }
                    }
                    
                    idleMatchers.append(matcher)
                    return nil
                }
                
                return (matcher, identifier, rng)
            }
            
            partialSessions = partialSessions.compactMap { matcher, rng in
                let rng = rng.lowerBound...index
                let match = self[rng]
                
                for identifier in matcher.identifiers {
                    guard identifier.string.hasPrefix(match) else {
                        continue
                    }
                    
                    guard identifier.string == match else {
                        return (matcher, rng)
                    }
                    
                    let nextIndex = self.index(after: index)
                    let rng = nextIndex...nextIndex
                    activeSessions.append((matcher, identifier, rng))
                    return nil
                }
                
                idleMatchers.append(matcher)
                return nil
            }
            
            idleMatchers = idleMatchers.filter { matcher in
                for identifier in matcher.identifiers {
                    if identifier.isPrefix {
                        guard index == startIndex else {
                            continue
                        }
                        
                        guard !identifier.string.isEmpty else {
                            let rng = index...index
                            activeSessions.append((matcher, identifier, rng))
                            return false
                        }
                    }
                    
                    if identifier.string.first == self[index] {
                        if identifier.string.count == 1 {
                            let nextIndex = self.index(after: index)
                            let rng = nextIndex...nextIndex
                            activeSessions.append((matcher, identifier, rng))
                        } else {
                            partialSessions.append((matcher, index...index))
                        }
                        
                        return false
                    }
                }
                
                return true
            }
        }
    }
    
    /// Scan this string using the matcher which gets to handle all matched substrings.
    func scan(using matcher: Matcher) {
        scan(using: [matcher])
    }
}
