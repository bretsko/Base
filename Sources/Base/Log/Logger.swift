
//import Foundation

public struct L {}
public extension L {
    
    struct LogColor {
        static var trace = Color.lightBlue
        static var debug = Color.green
        static var info = Color.lightMagenta
        static var warning = Color.magenta
        static var error = Color.lightRed
    }
    
    enum LogLevel: Int {
        case trace
        case debug
        case info
        case warning
        case error
    }
    
    /// logger state.
    static var enabled = true
    
    static var logLevel: LogLevel = .trace
    
    static var useTerminalColors = true
    
    //TODO:
    static var logToFile = false
    
    static var logDestination: URL?
    
    
    /// heading is the first word describing message for [Error] for error level, used by default because alhough in terminal colors are seen, Xcode terminal doesn't show them
    static var printHeading: Bool = true
    
    
    static func trace(_ message: Str,
                      funcName: Str = #function,
                      fileName: Str = #file,
                      lineNumber: Int = #line) {
        
        guard enabled, logLevel.rawValue <= LogLevel.trace.rawValue else {
            return
        }
        
        if printHeading {
            if useTerminalColors {
                let str = ("\n[Trace] \(message)".applyingColor(LogColor.trace))
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            } else {
                let str = ("\n[Trace] \(message)")
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            }
            
        }  else {
            if useTerminalColors {
                let str = message.applyingColor(LogColor.trace)
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            } else {
                log(message, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            }
        }
    }
    
    
    static func debug(_ message: Str,
                      funcName: Str = #function,
                      fileName: Str = #file,
                      lineNumber: Int = #line) {
        
        guard enabled, logLevel.rawValue <= LogLevel.debug.rawValue else {
            return
        }
        
        if printHeading {
            if useTerminalColors {
                let str = "\n[Debug] \(message)".applyingColor(LogColor.debug)
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            } else {
                let str = ("\n[Debug] \(message)")
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            }
        } else {
            if useTerminalColors {
                let str = message.applyingColor(LogColor.debug)
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            } else {
                log(message, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            }
        }
    }
    
    static func info(_ message: Str,
                     funcName: Str = #function,
                     fileName: Str = #file,
                     lineNumber: Int = #line) {
        
        guard enabled, logLevel.rawValue <= LogLevel.info.rawValue else {
            return
        }
        
        if printHeading {
            if useTerminalColors {
                let str = "\n[Info] \(message)".applyingColor(LogColor.info)
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            } else {
                let str = "\n[Info] \(message)"
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            }
        } else {
            if useTerminalColors {
                let str = message.applyingColor(LogColor.info)
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            } else {
                log(message, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
                
            }
        }
    }
    
    static func warning(_ message: Str,
                        funcName: Str = #function,
                        fileName: Str = #file,
                        lineNumber: Int = #line) {
        
        guard enabled, logLevel.rawValue <= LogLevel.warning.rawValue else {
            return
        }
        
        if printHeading {
            if useTerminalColors {
                let str = "\n[Warning] \(message)".applyingColor(LogColor.warning)
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            } else {
                let str = "\n[Warning] \(message)"
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            }
        } else {
            if useTerminalColors {
                let str = message.applyingColor(LogColor.warning)
                
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            } else {
                log(message, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            }
        }
    }
    
    static func error(_ message: Str,
                      funcName: Str = #function,
                      fileName: Str = #file,
                      lineNumber: Int = #line) {
        
        guard enabled, logLevel.rawValue <= LogLevel.error.rawValue else {
            return
        }
        
        if printHeading {
            if useTerminalColors {
                let str = "\n[Error] \(message)".applyingColor(LogColor.error)
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            } else {
                let str = "\n[Error] \(message)"
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            }
        } else {
            if useTerminalColors {
                let str = message.applyingColor(LogColor.error)
                log(str, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            } else {
                log(message, funcName: funcName, fileName: fileName, lineNumber: lineNumber)
            }
        }
    }
    
    static func crash(_ message: Str,
                      funcName: Str = #function,
                      fileName: Str = #file,
                      lineNumber: Int = #line) -> Never {
        
        L.error(message, funcName:funcName, fileName:fileName, lineNumber:lineNumber)
        fatalError()
    }
    
    //MARK: private
    
    private static func log(_ object: Str,
                            funcName: Str,
                            fileName: Str,
                            lineNumber: Int) {
        
        //TODO: Linux compatible, use URL, or just take after the dot
        let className = URL(fileURLWithPath: fileName).deletingPathExtension().lastPathComponent
        print("\(object)\n\(lineNumber):\(className).\(funcName)")
    }
}


public extension L {
    
    enum LogError: Str {
        case fetchFailed = "Fetch failed"
        case notImpl = "Not impl"
        case unhandledError = "Unhandled error"
        case childObligation = "Should be impl by child"
    }
    
    static func crash(_ error: LogError,
                      funcName: Str = #function,
                      fileName: Str = #file,
                      lineNumber: Int = #line) -> Never {
        crash(error.rawValue, funcName:funcName, fileName:fileName, lineNumber:lineNumber)
    }
    
    static func fetchFailed(funcName: Str = #function,
                            fileName: Str = #file,
                            lineNumber: Int = #line) -> Never {
        crash(.fetchFailed, funcName:funcName, fileName:fileName, lineNumber:lineNumber)
    }
    
    static func notImpl(funcName: Str = #function,
                        fileName: Str = #file,
                        lineNumber: Int = #line) -> Never {
        crash(.notImpl, funcName:funcName, fileName:fileName, lineNumber:lineNumber)
    }
    
    static func unhandled(funcName: Str = #function,
                          fileName: Str = #file,
                          lineNumber: Int = #line) -> Never {
        crash(.unhandledError, funcName:funcName, fileName:fileName, lineNumber:lineNumber)
    }
    
    static func childObligation(funcName: Str = #function,
                                fileName: Str = #file,
                                lineNumber: Int = #line) -> Never {
        crash(.childObligation, funcName:funcName, fileName:fileName, lineNumber:lineNumber)
    }
}


