
@_exported import Algorithms


public protocol SingletonP {
    
    static var shared: Self { get }
}


/// - Parameters:
///   - create: create routine used the first time you are about to create the object in thread.
/// - Returns: instance of the object for caller's thread.
public func threadSingleton<T: AnyObject>(_ create: () -> T) -> T {
    let key = NSStringFromClass(T.self)
    
    if let cachedObj = Thread.current.threadDictionary[key] as? T {
        return cachedObj
    }
    let newObject = create()
    Thread.current.threadDictionary[key] = newObject
    return newObject
}
