//
//  NLTagger.swift
//  Base
//
//  Created by Oleksandr Bretsko on 16.07.2022.
//

import NaturalLanguage
import Foundation

//make small service for lang detection, POS parsing,  String extensions
// consider making an actor - to solve access from multiple threads


//let text = "Knowledge will give you power, but character respect"
//
//let tagger = NLTagger(tagSchemes: [.lexicalClass, .language, .script])
//tagger.string = text
//
//tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: NLTokenUnit.word, scheme: NLTagScheme.lexicalClass, options: [.omitPunctuation, .omitWhitespace]) { (tag, range) -> Bool in
//    print(text[range])
//    print(tag?.rawValue ?? "unknown")
//    return true
//}
