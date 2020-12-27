
//@_exported import Base



public class ForgivingSearchFilter<T> {
    
    private var pattern: Regex?
    
    private var property: KeyPath<T, Str>
    
    
    public var searchString: Str? {
        didSet {
            guard let str = searchString,
                  let str1 = normalize(searchString: str) else {
                pattern = nil // ??
                return
            }
            pattern = Regex(strPattern: str1)
        }
    }
    
    public init(by property: KeyPath<T, Str>) {
        self.property = property
    }
}
public extension ForgivingSearchFilter {
    
    func filter(_ items: [T]) -> [T] {
        if let pattern = pattern {
            return items.filter(by: property,
                                matching: pattern)
        }
        return items
    }
    
    //MARK: - private
    
    private func normalize(searchString: Str) -> Str? {
         searchString.trimmingCharacters(in: .whitespaces).sth?.lowercased()
    }
}

private extension Regex {
    
    init?(strPattern: Str) {
        let pattern = strPattern.reduce(".*") { "\($0)\(Str($1)).*" }
        self.init(pattern, [.caseInsensitive])
    }
}


private extension Sequence {
    
    func filter<T>(by keyPath: KeyPath<Element, T>,
                   where cond: (T) -> Bool) -> [Element] {
        filter { unit in
            cond( unit[keyPath: keyPath] )
        }
    }
    
    func filter(by keyPath: KeyPath<Element, Str>,
                matching regex: Regex) -> [Element] {
        filter(by: keyPath, where: { regex.isMatch($0) })
    }
}
