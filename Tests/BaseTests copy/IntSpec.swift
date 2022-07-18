import Quick
import Nimble
import XCTest
@testable import Base


class IntSpec: QuickSpec {
    override func spec() {
        
        describe("Int") {
            
            it("can gen in range") {
                
                let values = Int.gen(min: 1,
                                          max: 1000,
                                          step: 10)
                
                do {
                    try expect(values.len).to(equal(100))
                    try expect(values[0]).to(equal(1))
                    try expect(values[1]).to(equal(11))
                } catch {
                    XCTFail()
                }
            }
            
            it("can gen all forms") {
                
                let values = Int.allForms
                do {
                    try expect(values.len).to(equal(1000000))
                    try expect(values.contains([5, 10000])).to(beTrue())
                } catch {
                    XCTFail()
                }
                //expect(values[99]).to(equal(1000000))
            }
        }
    }
}
