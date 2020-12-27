public extension L {
    
    /// Valid text colors to use in `L.Rainbow`.
    enum Color: UInt8, ModeCode {
        case black = 30
        case red
        case green
        case yellow
        case blue
        case magenta
        case cyan
        case white
        case `default` = 39
        case lightBlack = 90
        case lightRed
        case lightGreen
        case lightYellow
        case lightBlue
        case lightMagenta
        case lightCyan
        case lightWhite
    }
    
    
    /// Valid background colors to use in `L.Rainbow`.
    enum BackgroundColor: UInt8, ModeCode {
        case black = 40
        case red
        case green
        case yellow
        case blue
        case magenta
        case cyan
        case white
        case `default` = 49
    }
    
    
    /// Valid styles to use in `L.Rainbow`.
    enum Style: UInt8, ModeCode {
        case `default` = 0
        case bold = 1
        case dim = 2
        case italic = 3
        case underline = 4
        case blink = 5
        case swap = 7
    }
    
    
    struct ControlCode {
        static let ESC = "\u{001B}"
        static let CSI = "\(ESC)["
    }
}
