


public extension Collection where Element: Equatable, Index == Int {
    
    func firstIdx(of item: E) -> Index? {
        for (i, v) in lazy.enumerated() where v == item {
            return i
        }
        return nil
    }
    
    func lastIdx(of item: E) -> Index? {
        for (i, v) in lazy.enumerated().reversed() where v == item {
            return i
        }
        return nil
    }
}

public extension RandomAccessCollection where Element: Equatable {
    
    ///  Tries to find specified items equal to the given one, and returns all indices where it is true.
    ///        [1, 2, 2, 3, 4, 2, 5].indices(of 2) -> [1, 2, 5]
    ///        [1.2, 2.3, 4.5, 3.4, 4.5].indices(of 2.3) -> [1]
    ///        ["h", "e", "l", "l", "o"].indices(of "l") -> [2, 3]
    /// - Parameter item: item to check.
    /// - Returns: an array with all indices of the given item.
    func indices(of item: E) -> [Index]? {
        var indices: [Index] = []
        var idx = startIndex
        while idx < endIndex {
            if self[idx] == item {
                indices.append(idx)
            }
            formIndex(after: &idx)
        }
        return indices.sth
    }
}



