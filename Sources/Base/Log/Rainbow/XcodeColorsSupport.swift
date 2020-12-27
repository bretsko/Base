
protocol XcodeColorsConvertible {
    var xcodeColorsDescr: Str { get }
    init?(xcodeColorsDescr string: Str)
}

// MARK: - XcodeColorsConvertible
// Supports XcodeColors format of mode string.
extension L.Color: XcodeColorsConvertible {
    var xcodeColorsDescr: Str {
        switch self {
        case .black: return "fg0,0,0"
        case .red: return "fg255,0,0"
        case .green: return "fg0,204,0"
        case .yellow: return "fg255,255,0"
        case .blue: return "fg0,0,255"
        case .magenta: return "fg255,0,255"
        case .cyan: return "fg0,255,255"
        case .white: return "fg204,204,204"
        case .default: return ""
        case .lightBlack: return "fg128,128,128"
        case .lightRed: return "fg255,102,102"
        case .lightGreen: return "fg102,255,102"
        case .lightYellow: return "fg255,255,102"
        case .lightBlue: return "fg102,102,255"
        case .lightMagenta: return "fg255,102,255"
        case .lightCyan: return "fg102,255,255"
        case .lightWhite: return "fg255,255,255"
        }
    }
    
    init?(xcodeColorsDescr string: Str) {
        switch string {
        case L.Color.black.xcodeColorsDescr: self = .black
        case L.Color.red.xcodeColorsDescr: self = .red
        case L.Color.green.xcodeColorsDescr: self = .green
        case L.Color.yellow.xcodeColorsDescr: self = .yellow
        case L.Color.blue.xcodeColorsDescr: self = .blue
        case L.Color.magenta.xcodeColorsDescr: self = .magenta
        case L.Color.cyan.xcodeColorsDescr: self = .cyan
        case L.Color.white.xcodeColorsDescr: self = .white
        case L.Color.lightBlack.xcodeColorsDescr: self = .lightBlack
        case L.Color.lightRed.xcodeColorsDescr: self = .lightRed
        case L.Color.lightGreen.xcodeColorsDescr: self = .lightGreen
        case L.Color.lightYellow.xcodeColorsDescr: self = .lightYellow
        case L.Color.lightBlue.xcodeColorsDescr: self = .lightBlue
        case L.Color.lightMagenta.xcodeColorsDescr: self = .lightMagenta
        case L.Color.lightCyan.xcodeColorsDescr: self = .lightCyan
        case L.Color.lightWhite.xcodeColorsDescr: self = .lightWhite
        default: return nil
        }
    }
}

extension L.BackgroundColor: XcodeColorsConvertible {
    var xcodeColorsDescr: Str {
        switch self {
        case .black: return "bg0,0,0"
        case .red: return "bg255,0,0"
        case .green: return "bg0,204,0"
        case .yellow: return "bg255,255,0"
        case .blue: return "bg0,0,255"
        case .magenta: return "bg255,0,255"
        case .cyan: return "bg0,255,255"
        case .white: return "bg204,204,204"
        case .default: return ""
        }
    }
    
    init?(xcodeColorsDescr string: Str) {
        switch string {
        case L.BackgroundColor.black.xcodeColorsDescr: self = .black
        case L.BackgroundColor.red.xcodeColorsDescr: self = .red
        case L.BackgroundColor.green.xcodeColorsDescr: self = .green
        case L.BackgroundColor.yellow.xcodeColorsDescr: self = .yellow
        case L.BackgroundColor.blue.xcodeColorsDescr: self = .blue
        case L.BackgroundColor.magenta.xcodeColorsDescr: self = .magenta
        case L.BackgroundColor.cyan.xcodeColorsDescr: self = .cyan
        case L.BackgroundColor.white.xcodeColorsDescr: self = .white
        default: return nil
        }
    }
}
