

protocol ModesExtractor {
    associatedtype ResultType
    func extract(_ string: Str) -> (codes: [ResultType], text: Str)
}

struct ConsoleModesExtractor: ModesExtractor {
    func extract(_ string: Str) -> (codes: [UInt8], text: Str) {
        let token = L.ControlCode.CSI
        
        var index = string.index(string.startIndex, offsetBy: token.count)
        var codesString = ""
        while string[index] != "m" {
            codesString.append(string[index])
            index = string.index(after: index)
        }
        let codes = codesString.split(separator: ";", omittingEmptySubsequences: false)
            .compactMap { UInt8($0) }
        let startIndex = string.index(after: index)
        let endIndex = string.index(string.endIndex, offsetBy: -"\(token)0m".count)
        let text = Str(string[startIndex ..< endIndex])
        
        return (codes, text)
    }
}

struct XcodeColorsModesExtractor: ModesExtractor {
    func extract(_ string: Str) -> (codes: [Str], text: Str) {
        let token = L.ControlCode.CSI
        var index = string.startIndex
        
        var codes = [Str]()
        
        var outer = Str(string[index]) //Start index should be the ESC control code
        while outer == L.ControlCode.ESC {
            var codesString = ""
            index = string.index(index, offsetBy: token.count)
            
            while string[index] != ";" {
                codesString.append(string[index])
                index = string.index(after: index)
            }
            
            codes.append(codesString)
            index = string.index(after: index)
            outer = Str(string[index])
        }
        
        let startIndex = index
        let endIndex = string.index(string.endIndex, offsetBy: -"\(token);".count)
        let text = Str(string[startIndex ..< endIndex])
        
        return (codes, text)
    }
}
