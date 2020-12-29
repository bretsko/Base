import Quick
import Nimble
import XCTest
import Base


class DoubleSpec: QuickSpec {
    override func spec() {
        
        describe("Double") {
            
            //TODO: add cases from
            //https://themathpage.com/Arith/decimals.htm
            
            it("can gen in range") {
                
                let values = Double.gen(min: 0.1,
                                        max: 10,
                                        step: 0.1)
                
                do {
                    try expect(values.len).to(equal(100))
                    try expect(values[0]).to(equal(0.1))
                    try expect(values[99]).to(equal(10))
                } catch {
                    XCTFail()
                }
            }
            
            it("can gen all forms") {
                
                let values = Double.allForms
                do {
                    try expect(values.len).to(equal(10000000))
                    try expect(values.contains([5.7, 10000.2])).to(beTrue())
                    //try expect(values[99]).to(equal(1000000))
                } catch {
                    XCTFail()
                }
            }
        }
    }
}
