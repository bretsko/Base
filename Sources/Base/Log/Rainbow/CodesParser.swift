

typealias ParseResult = (color: L.Color?, backgroundColor: L.BackgroundColor?, styles: [L.Style]?)

protocol CodesParser {
    associatedtype SourceType
    func parse(modeCodes codes: [SourceType]) -> ParseResult
}

struct ConsoleCodesParser: CodesParser {
    func parse(modeCodes codes: [UInt8]) -> ParseResult {
        var color: L.Color? = nil
        var backgroundColor: L.BackgroundColor? = nil
        var styles: [L.Style]? = nil
        
        for code in codes {
            if let c = L.Color(rawValue: code) {
                color = c
            } else if let bg = L.BackgroundColor(rawValue: code) {
                backgroundColor = bg
            } else if let style = L.Style(rawValue: code) {
                if styles == nil {
                    styles = []
                }
                styles!.append(style)
            }
        }
        
        return (color, backgroundColor, styles)
    }
}

struct XcodeColorsCodesParser: CodesParser {

    func parse(modeCodes codes: [Str]) -> ParseResult {
        var color: L.Color? = nil
        var backgroundColor: L.BackgroundColor? = nil
        
        for code in codes {
            if let c = L.Color(xcodeColorsDescr: code) {
                color = c
            } else if let bg = L.BackgroundColor(xcodeColorsDescr: code) {
                backgroundColor = bg
            }
        }
        
        return (color, backgroundColor, nil)
    }
}
