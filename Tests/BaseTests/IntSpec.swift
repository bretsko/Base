import Quick
import Nimble
@testable import Base


class IntSpec: QuickSpec {
    override func spec() {
        
        describe("Int") {
            
            it("can gen in range") {
                
                let values = Int.gen(min: 1,
                                          max: 1000,
                                          step: 10)
                
                expect(values.len).to(equal(100))
                expect(values[0]).to(equal(1))
                expect(values[1]).to(equal(11))
            }
            
            it("can gen all forms") {
                
                let values = Int.allForms
                expect(values.len).to(equal(1000000))
                expect(values.contains([5, 10000])).to(beTrue())
                //expect(values[99]).to(equal(1000000))
            }
        }
    }
}
