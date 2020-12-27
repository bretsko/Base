

// MARK: - Worker methods

extension Str {
    
    /**
     Apply a text color to current string.
     
     - parameter color: The color to apply.
     
     - returns: The colorized string based on current content.
     */
    func applyingColor(_ color: L.Color) -> Str {
        applyingCodes(color)
    }
    
    /**
     Remove a color from current string.
     
     - Note: This method will return the string itself if there is no color component in it.
     Otherwise, a string without color component will be returned and other components will remain untouched..
     
     - returns: A string without color.
     */
    func removingColor() -> Str {
        guard let _ = L.Rainbow.extractModes(for: self).color else {
            return self
        }
        return applyingColor(.default)
    }
    
    /**
     Apply a background color to current string.
     
     - parameter color: The background color to apply.
     
     - returns: The background colorized string based on current content.
     */
    func applyingBackgroundColor(_ color: L.BackgroundColor) -> Str {
        applyingCodes(color)
    }
    
    /**
     Remove a background color from current string.
     
     - Note: This method will return the string itself if there is no background color component in it.
     Otherwise, a string without background color component will be returned and other components will remain untouched.
     
     - returns: A string without color.
     */
    func removingBackgroundColor() -> Str {
        guard let _ = L.Rainbow.extractModes(for: self).backgroundColor else {
            return self
        }
        
        return applyingBackgroundColor(.default)
    }
    
    /**
     Apply a style to current string.
     
     - parameter style: The style to apply.
     
     - returns: A string with specified style applied.
     */
    func applyingStyle(_ style: L.Style) -> Str {
        applyingCodes(style)
    }
    
    /**
     Remove a style from current string.
     
     - parameter style: The style to remove.
     
     - returns: A string with specified style removed.
     */
    func removingStyle(_ style: L.Style) -> Str {
        
        guard L.Rainbow.enabled else {
            return self
        }
        
        let current = L.Rainbow.extractModes(for: self)
        if var styles = current.styles {
            styles.removeAll { $0 == style }
            return L.Rainbow.generateString(
                forColor: current.color,
                backgroundColor: current.backgroundColor,
                styles: styles, current.text
            )
        }
        return self
    }
    
    /**
     Remove all styles from current string.
     
     - Note: This method will return the string itself if there is no style components in it.
     Otherwise, a string without stlye components will be returned and other color components will remain untouched.
     
     - returns: A string without style components.
     */
    func removingAllStyles() -> Str {
        
        guard L.Rainbow.enabled else {
            return self
        }
        
        let current = L.Rainbow.extractModes(for: self)
        return L.Rainbow.generateString(forColor: current.color,
                                        backgroundColor: current.backgroundColor,
                                        styles: nil, current.text
        )
    }
    
    /**
     Apply a series of modes to the string.
     
     - parameter codes: Component mode code to apply to the string.
     
     - returns: A string with specified modes applied.
     */
    func applyingCodes(_ codes: ModeCode...) -> Str {
        
        guard L.Rainbow.enabled else {
            return self
        }
        
        let current = L.Rainbow.extractModes(for: self)
        let input = ConsoleCodesParser().parse(modeCodes: codes.map{ $0.rawValue } )
        
        let color = input.color ?? current.color
        let backgroundColor = input.backgroundColor ?? current.backgroundColor
        var styles = [L.Style]()
        
        if let s = current.styles {
            styles += s
        }
        
        if let s = input.styles {
            styles += s
        }
        
        if codes.isEmpty {
            return self
        }
        return L.Rainbow.generateString(
            forColor: color,
            backgroundColor: backgroundColor,
            styles: styles.isEmpty ? nil : styles,
            current.text)
    }
}

// MARK: - Colors Shorthand

extension Str {
    
    /// Str with black text.
    var black: Str {  applyingColor(.black) }
    /// Str with red text.
    var red: Str {  applyingColor(.red)   }
    /// Str with green text.
    var green: Str {  applyingColor(.green) }
    /// Str with yellow text.
    var yellow: Str {  applyingColor(.yellow) }
    /// Str with blue text.
    var blue: Str {  applyingColor(.blue) }
    /// Str with magenta text.
    var magenta: Str {  applyingColor(.magenta) }
    /// Str with cyan text.
    var cyan: Str {  applyingColor(.cyan) }
    /// Str with white text.
    var white: Str {  applyingColor(.white) }
    /// Str with light black text. Generally speaking, it means dark grey in some consoles.
    var lightBlack: Str {  applyingColor(.lightBlack) }
    /// Str with light red text.
    var lightRed: Str {  applyingColor(.lightRed) }
    /// Str with light green text.
    var lightGreen: Str {  applyingColor(.lightGreen) }
    /// Str with light yellow text.
    var lightYellow: Str {  applyingColor(.lightYellow) }
    /// Str with light blue text.
    var lightBlue: Str {  applyingColor(.lightBlue) }
    /// Str with light magenta text.
    var lightMagenta: Str {  applyingColor(.lightMagenta) }
    /// Str with light cyan text.
    var lightCyan: Str {  applyingColor(.lightCyan) }
    /// Str with light white text. Generally speaking, it means light grey in some consoles.
    var lightWhite: Str {  applyingColor(.lightWhite) }
}

// MARK: - Background Colors Shorthand

extension Str {
    
    /// Str with black background.
    var onBlack: Str {  applyingBackgroundColor(.black) }
    /// Str with red background.
    var onRed: Str {  applyingBackgroundColor(.red) }
    /// Str with green background.
    var onGreen: Str {  applyingBackgroundColor(.green) }
    /// Str with yellow background.
    var onYellow: Str {  applyingBackgroundColor(.yellow) }
    /// Str with blue background.
    var onBlue: Str {  applyingBackgroundColor(.blue) }
    /// Str with magenta background.
    var onMagenta: Str {  applyingBackgroundColor(.magenta) }
    /// Str with cyan background.
    var onCyan: Str {  applyingBackgroundColor(.cyan) }
    /// Str with white background.
    var onWhite: Str {  applyingBackgroundColor(.white) }
}

// MARK: - Styles Shorthand

extension Str {
    
    /// Str with bold style.
    var bold: Str {  applyingStyle(.bold) }
    /// Str with dim style. This is not widely supported in all terminals. Use it carefully.
    var dim: Str {  applyingStyle(.dim) }
    /// Str with italic style. This depends on whether a italic existing for the font family of terminals.
    var italic: Str {  applyingStyle(.italic) }
    /// Str with underline style.
    var underline: Str {  applyingStyle(.underline) }
    /// Str with blink style. This is not widely supported in all terminals, or need additional setting. Use it carefully.
    var blink: Str {  applyingStyle(.blink) }
    /// Str with text color and background color swapped.
    var swap: Str {  applyingStyle(.swap) }
}

// MARK: - Clear Modes Shorthand
extension Str {
    
    /// Clear color component from string.
    var clearColor: Str {  removingColor() }
    
    /// Clear background color component from string.
    var clearBackgroundColor: Str {  removingBackgroundColor() }
    
    /// Clear styles components from string.
    var clearStyles: Str {  removingAllStyles() }
}

extension Str {
    
    /// Get the raw string of current L.Rainbow styled string. O(n)
    var raw: Str {
        L.Rainbow.extractModes(for: self).text
    }
}
