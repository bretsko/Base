
//TODO: impl check for duplicates between cases, stored str, strs - to detect errors
public extension VStr {
    
    init(_ strs: Set<Str>) {
        self = .strs(strs)
    }    
    init(_ strs: [Str]) {
        self.init(Set(strs))
    }
    init(_ str: Str) {
        self.init([str])
    }

    //MARK: Case variants
    
    /// all varinats for current case
    var caseVariants: Set<Str> {
        switch self {
        case .strs(let strs):
            return strs
        default:
            return child!.allVariants
        }
    }
    
    // conv
    /// caseVariants
    var strSet: Set<Str> {
        return caseVariants
    }
    
    /// random variant for current case (not from allVariants!)
    var randCaseVariant: Str! {
        // can use child.randVariant
        return caseVariants.randItem
    }

    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .strs(let strs):
            hasher.combine(strs)
        default:
            hasher.combine(child!.skey)
        }
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        //??
        //return lhs.skey == lhs.skey
        switch (lhs, rhs) {
        case (.strs(let strs1), .strs(let strs2)):
            return strs1 == strs2
        case (.person, .person):
            return true
        default:
            //try impl check here - to detect any other cases, and add them to existing cases if they can be combined
            
            //try impl without intersection of Sets, even crash if found intersection
            
            //add check - to find cases where Sets intersect, or subSet, superSet of other
            //this is bug -> they should be combined into single

            //impl Equatable - true if any is (strict ?)superSet of other

            
            // case (.strs(let strs1), .person(let person)):
            // return strs1 == person.allVariants) || Set(strs1).isSuperset(of: Set(strs2)) || Set(strs2).isSuperset(of: Set(strs1))
            
            return false
        }
    }
    
    private var child: VStrEnumP? {
        switch self {
        case .person(let a):
            return a
        case .strs:
            return nil
        }
    }
    
    
    //MARK: Static
   
    // all skeys from all cases (except strs !)
    static var allSKeys: Set<Str> {
        return allChildVStrTypes.map{$0.skey}.set
    }
    
    // all variants from all cases (except strs !), can use for detecting duplicates
    static var allVariants: Set<Str> {
        return allChildVStrTypes.map{$0.allVariants}.flatMap{$0}.set
    }
    
    // all skeys from all cases, except strs
    private static var allChildVStrTypes: [VStrEnumP.Type] {
        return [SVPerson.self]
    }
    
    //MARK: -
    
    var descr: Str {
        return "VStr." //+ skey
    }
}
