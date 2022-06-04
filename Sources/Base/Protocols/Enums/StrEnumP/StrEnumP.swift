
//TODO: consider isolating StrRawValueInitableP and HasStrRawValueP into RawStrEnumP

/// for enums which have type String or don't
public protocol StrEnumP: StrRawValueInitableP, HasStrRawValueP, HasStaticStringsP {}

public extension StrEnumP where Self: HasDescrP {
    /// "Self.rawValue"
    var descr: Str {
        Str(describing: type(of:self)) + ".\(rawValue)"
    }
}
public extension StrEnumP where Self: CaseIterableT  {
    //TODO: consider moving to StrEnumT
    
    // HasStaticStringsP
    static var strs: Set<Str> {
        allCases.map{$0.s}.set
    }
}


//MARK: -

/// for enums which have type String
public protocol StrEnumT: StrEnumP, HasDescr, CaseIterable, Comparable, HasAllFormsT {}
public extension StrEnumT {
    /// "Self.rawValue"
    var descr: Str {
        Str(describing: type(of:self)) + ".\(rawValue)"
    }
}

public typealias HasAllStrFormsT = StrEnumP & HasAllFormsT


// or ?
//public protocol HasAllStrFormsT: StrEnumP, HasAllFormsT {}
//public extension HasAllStrFormsT {

/// for enums which are not of type String but still provide var str
public extension HasAllFormsT where Self: StrRawValueInitableP & HasStrP {
    
    /// uses first match from allForms
    init?(rawValue: Str) {
        if let a = Self.allForms.first(where: {
            $0.s == rawValue
        }) {
            self = a
        } else {
            return nil
        }
    }
}


//MARK: -

public protocol HasStrAndDescrP: HasStrP, HasDescrP {}
public extension HasStrAndDescrP {
    var descr: Str {
        Str(describing: self) + ": " + str
    }
}

public protocol HasStrArrayAndDescrP: HasStrArrayP, HasDescrP {}
public extension HasStrArrayAndDescrP {
    var descr: Str {
        Str(describing: self) + ": " + strings.joinedWords
    }
}

public protocol HasStrSetAndDescrP: HasStrSetP, HasDescrP {}
public extension HasStrSetAndDescrP {
    var descr: Str {
        Str(describing: self) + ": " + strs.array.joinedWords // set !
    }
}


//MARK: -


public extension Array where Element: StrEnumP {
    var strs: [Str] {
        map{$0.s}
    }
}

public extension Set where Element: StrEnumP {
    var strs: Set<Str> {
        map{$0.s}.set
    }
}


//TODO: try make based on init?(caseName: Str) {
//public extension StrEnumT  {
//    var caseName: Str {
//
//    }
//}
