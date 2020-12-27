


public extension Data {
    
    ///  Returns data as an array of bytes.
    var bytes: [UInt8] {
        // http://stackoverflow.com/questions/38097710/swift-3-changes-for-getbytes-method
        [UInt8](self)
    }
    
    /// Returns a formatted device token string
    var formattedDeviceToken: Str {
        map { Str(format: "%02.2hhx", $0) }.joined()
    }
    
    var toUtf8: Str? {
        Str(data: self, encoding: Str.Encoding.utf8)
    }
    
    /// Returns a hexadecimal encoded Str.
    var hexadecimalString: Str {
        map { Str(format: "%02x", $0) }.joined(separator: "")
    }
    
    /**
     Initialize a `Data` from the hexadecimal string representation.
     
     Sample usage:
     
     let hexString = "48656c6c6f"
     let data = Data(hexadecimalString: hexString)
     // data is now <48656c6c6f>
     
     - parameter string: The hexadecimal string representation.
     - note: If the string has any non-hexadecimal characters, those are ignored and only hexadecimal characters are processed.
     - returns: The data represented by the hexadecimal string or `nil` if a data cannot be created.
     */
    init?(hexadecimalString string: Str) {
        var data = Data(capacity: string.len / 2)
        
        let regex = try? NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex?.enumerateMatches(in: string, options: [], range: NSMakeRange(0, string.len)) { match, _, _ in
            let byteString = (string as NSString).substring(with: match!.range)
            var num = UInt8(byteString, radix: 16)!
            data.append(&num, count: 1)
        }
        
        guard data.hasSth else { return nil }
        
        self = data
    }
    
    ///  Str by encoding Data using the given encoding (if applicable).
    /// - Parameter encoding: encoding.
    /// - Returns: Str by encoding Data using the given encoding (if applicable).
    func string(encoding: Str.Encoding) -> Str? {
        Str(data: self, encoding: encoding)
    }
}

// NSAttributedString from Data (if applicable).
//     var attributedString: NSAttributedString? {
//        // http://stackoverflow.com/questions/39248092/nsattributedstring- extension-in-swift-3
//        do {
//            return try! NSAttributedString(data: self, options: [
//                .documentType: NSAttributedString.DocumentType.html,
//                .characterEncoding: Str.Encoding.utf8.rawValue,
//            ], documentAttributes: nil)
//        } catch _ {
//            return nil
//        }
//    }
//}
