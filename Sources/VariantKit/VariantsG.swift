
@_exported import Base


/// Selectable Variants
/// selectedIndex is ignored by both Hashable and Equatable
public struct VariantsG<T: Hashable>: Hashable {
    
    //TODO: consider making this private, and handle via funcs
    public var variants: [T]
    
    public var selectedIndex: Int?
}
public extension VariantsG {
   
    init(_ variants: [T],
         selectedIndex: Int? = nil) {
        self.variants = variants
        self.selectedIndex = selectedIndex
    }
    
    //MARK: -
    
    /// returns true if operation succeeded
    @discardableResult
    mutating func select(index: Int) -> Bool {
        guard isValid(index: index) else {
            return false
        }
        selectedIndex = index
        return true
    }
    
    /// returns true if operation succeeded, selects the first match in the list if there are many
    @discardableResult
    mutating func select(_ variant: T) -> Bool {
        if let i = variants.indexes(of: variant)?.first {
            return select(index: i)
        }
        return false
    }
    
    /// selectedIndex = nil
    mutating func deselect(_ idx: Int) {
        selectedIndex = nil
    }
    
    /// if correct index is set, returns variants[i]
    var selectedVar: T? {
        if let i = selectedIndex, isValid(index: i) {
            return variants[i]
        }
        return nil
    }
    
    /// contains
    func has(_ variant: T) -> Bool {
        return variants.contains(variant)
    }
    
    var isEmpty: Bool {
        return variants.isEmpty
    }
    var count: Int {
        return variants.count
    }
    
    //TODO: consider impl func to add variant
    

    //MARK: -

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.variants == rhs.variants
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(variants)
    }

    //MARK: -
    
    private func isValid(index: Int) -> Bool {
        return index >= 0 && index < variants.count
    }
}

