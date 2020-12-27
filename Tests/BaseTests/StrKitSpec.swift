

import Quick
import Nimble
import Base


class StrKitSpec: QuickSpec {
    
    override func spec() {
        
        describe("SyllableCounter") {
            
            it("can count syllables") {
                
                // based on https://writingexplained.org/grammar-dictionary/syllable
                
                expect("man".numSyllables).to(equal(1))
                expect("cry".numSyllables).to(equal(1))
                expect("long".numSyllables).to(equal(1))
                expect("shame".numSyllables).to(equal(1))
                expect("brain".numSyllables).to(equal(1))
                expect("tree".numSyllables).to(equal(1))
                expect("lane".numSyllables).to(equal(1))
                expect("tile".numSyllables).to(equal(1))
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
                
                
                expect("baker".numSyllables).to(equal(2))
                expect("growing".numSyllables).to(equal(2))
                expect("silent".numSyllables).to(equal(2))
                
                expect("terrible".numSyllables).to(equal(3))
            }
            
            //            it("can ") {
            //                //expect(color.s).to(equal(colorName))
            //            }
        }
    }
}
