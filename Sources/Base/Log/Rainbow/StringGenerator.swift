
protocol StringGenerator {
    
    func generate(withStringColor stringColor: L.Color?,
                  backgroundColor: L.BackgroundColor?,
                  styles: [L.Style]?,
                  _ text: Str) -> Str
}

struct ConsoleStringGenerator: StringGenerator {
    
    func generate(withStringColor stringColor: L.Color? = nil,
                  backgroundColor: L.BackgroundColor? = nil,
                  styles: [L.Style]? = nil,
                  _ text: Str) -> Str {
        var codes: [UInt8] = []
        if let stringColor {
            codes.append(stringColor.rawValue)
        }
        if let backgroundColor {
            codes.append(backgroundColor.rawValue)
        }
        if let styles {
            codes += styles.map{$0.rawValue}
        }
        
        if codes.isEmpty {
            return text
        }
        return "\(L.ControlCode.CSI)\(codes.map{Str($0)}.joined(separator: ";"))m\(text)\(L.ControlCode.CSI)0m"
    }
}

struct XcodeColorsStringGenerator: StringGenerator {
    
    func generate(withStringColor stringColor: L.Color? = nil,
                  backgroundColor: L.BackgroundColor? = nil,
                  styles: [L.Style]? = nil,
                  _ text: Str) -> Str {
        
        var result = ""
        var added = false
        
        if let color = stringColor, color != .default {
            result += "\(L.ControlCode.CSI)\(color.xcodeColorsDescr);"
            added = true
        }
        
        if let backgroundColor = backgroundColor, backgroundColor != .default {
            result += "\(L.ControlCode.CSI)\(backgroundColor.xcodeColorsDescr);"
            added = true
        }
        
        result += text
        
        if added {
            result += "\(L.ControlCode.CSI);"
        }

        return result
    }
}
