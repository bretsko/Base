
/// A structure to provide thread-safe access to some underlying object using reader-writer pattern.
//public class Synchronized<T> {
//    
//    /// Private value. Use `public` `value` computed property (or `reader` and `writer` methods)
//    /// for safe, thread-safe access to this underlying value.
//    private var _value: T
//
//    /// Private reader-write synchronization queue
//    private let queue = DispatchQueue(label: Bundle.main.bundleIdentifier! + ".synchronized", qos: .default, attributes: .concurrent)
//
//    /// Create `Synchronized` object
//    ///
//    /// - Parameter value: The initial value to be synchronized.
//    public init(_ value: T) {
//        _value = value
//    }
//
//    /// A threadsafe variable to set and get the underlying object
//    public var value: T {
//        get { return queue.sync { _value } }
//        set { queue.async(flags: .barrier) { self._value = newValue } }
//    }
//
//    /// A "reader" method to allow thread-safe, read-only concurrent access to the underlying object.
//    ///
//    /// - Warning: If the underlying object is a reference type, you are responsible for making sure you
//    ///            do not mutating anything. If you stick with value types (`struct` or primitive types),
//    ///            this will be enforced for you.
//    public func reader<U>(_ block: (T) throws -> U) rethrows -> U {
//        return try queue.sync { try block(_value) }
//    }
//
//    /// A "writer" method to allow thread-safe write with barrier to the underlying object
//    func writer(_ block: @escaping (inout T) -> Void) {
//        queue.async(flags: .barrier) {
//            block(&self._value)
//        }
//    }
//}


// Usage example
//public struct Person {
//    public let name: Str
//    public let phoneNumber: Str
//
//    public static func uniquePerson() -> Person {
//        return Person(name: UUID().uuidString, phoneNumber: UUID().uuidString)
//    }
//}
//
//public struct PhoneBook {
//
//    private var synchronizedPeople = Synchronized([Person]())
//
//    public func people(name: Str? = nil, phone: Str? = nil) -> [Person]? {
//        return synchronizedPeople.value.filter {
//            (name == nil || $0.name == name) && (phone == nil || $0.phoneNumber == phone)
//        }
//    }
//
//    public func append(_ person: Person) {
//        synchronizedPeople.writer { people in
//            people.append(person)
//        }
//    }
//
//    public var count: Int {
//        return synchronizedPeople.reader { $0.count }
//    }
//}
