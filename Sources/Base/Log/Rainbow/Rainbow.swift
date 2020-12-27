

public protocol ModeCode {
    
    //A Mode code represnet a component for colorizing the string.
    //It could be a `Color`, a `BackgroundColor` or a `Style`
    var rawValue: UInt8 { get }
}

public extension L {
    
    struct Rainbow {
        
        /// Output target for `L.Rainbow`. `L.Rainbow` should detect correct target itself, so you rarely need to set it.
        /// However, if you want the colorized string to be different, or the detection is not correct, you can set it manually.
        public static var outputTarget = OutputTarget.current
        
        /// Enable `L.Rainbow` to colorize string or not. Default is `true`.
        public static var enabled = true
        
        public static func extractModes(for str: Str)
        -> (color: Color?, backgroundColor: BackgroundColor?,
            styles: [Style]?, text: Str)
        {
            if str.isConsoleStyle {
                let result = ConsoleModesExtractor().extract(str)
                let (color, backgroundColor, styles) = ConsoleCodesParser().parse(modeCodes: result.codes)
                return (color, backgroundColor, styles, result.text)
            } else if str.isXcodeColorsStyle {
                let result = XcodeColorsModesExtractor().extract(str)
                let (color, backgroundColor, _) = XcodeColorsCodesParser().parse(modeCodes: result.codes)
                return (color, backgroundColor, nil, result.text)
            }
            return (nil, nil, nil, str)
        }
        
        static func generateString(forColor color: Color?,
                                   backgroundColor: BackgroundColor?,
                                   styles: [Style]?,
                                   _ text: Str) -> Str {
            guard enabled else {
                return text
            }
            
            switch outputTarget {
            case .xcodeColors:
                return XcodeColorsStringGenerator()
                    .generate(withStringColor: color,
                              backgroundColor: backgroundColor,
                              styles: styles, text)
            case .console:
                return ConsoleStringGenerator()
                    .generate(withStringColor: color,
                              backgroundColor: backgroundColor,
                              styles: styles, text)
            case .unknown:
                return text
            }
        }
    }
}

private extension Str {
    var isConsoleStyle: Bool {
        let token = L.ControlCode.CSI
        return hasPrefix(token) && hasSuffix("\(token)0m")
    }
    
    var isXcodeColorsStyle: Bool {
        let token = L.ControlCode.CSI
        return hasPrefix(token) && hasSuffix("\(token);")
    }
}
