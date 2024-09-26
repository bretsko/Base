

#if os(Linux) || CYGWIN
import Glibc
#else
import Darwin.C
#endif

private func getEnvValue(_ key: Str) -> Str? {
    guard let value = getenv(key) else {
        return nil
    }
    return Str(cString: value)
}


public extension L {
    
    ///
    /**
     Output target of L.Rainbow.
     
     - Unknown: Unknown target.
     - Console: A valid console is detected connected.
     - XcodeColors: Used in Xcode with XcodeColors enabled.
     */
    enum OutputTarget: Sendable {
        case unknown
        case console
        case xcodeColors
        
        /// Detected output target by current envrionment.
        static let current: OutputTarget = {
            // Check if Xcode Colors is installed and enabled.
            let xcodeColorsEnabled = (getEnvValue("XcodeColors") == "YES")
            if xcodeColorsEnabled {
                return .xcodeColors
            }
            
            // Check if we are in any term env and the output is a tty.
            let termType = getEnvValue("TERM")
            if let t = termType, t.lowercased() != "dumb" && isatty(fileno(stdout)) != 0 {
                return .console
            }
            
            return .unknown
        }()
    }
}
