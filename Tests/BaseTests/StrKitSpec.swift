

import Quick
import Nimble
import XCTest
import Base


class StrKitSpec: QuickSpec {
    
    override func spec() {
        
        describe("SyllableCounter") {
            
            it("can count syllables") {
                
                // based on https://writingexplained.org/grammar-dictionary/syllable
                
                do {
                    try expect("man".numSyllables).to(equal(1))
                    try expect("cry".numSyllables).to(equal(1))
                    try expect("long".numSyllables).to(equal(1))
                    try expect("shame".numSyllables).to(equal(1))
                    try expect("brain".numSyllables).to(equal(1))
                    try expect("tree".numSyllables).to(equal(1))
                    try expect("lane".numSyllables).to(equal(1))
                    try expect("tile".numSyllables).to(equal(1))
                } catch {
                    XCTFail()
                }
                //                clock
                //                truck
                //                ask
                //                bin
                //                trim
                //                gym
                //                neck
                //                if
                //                wry
                //                try
                //                    no
                //                go
                //                a
                //                chew
                //                brew
                
                do {
                    try expect("baker".numSyllables).to(equal(2))
                    try expect("growing".numSyllables).to(equal(2))
                    try expect("silent".numSyllables).to(equal(2))
                    try expect("terrible".numSyllables).to(equal(3))
                } catch {
                    XCTFail()
                }
            }
            
            //            it("can ") {
            //                //expect(color.s).to(equal(colorName))
            //            }
        }
    }
}
