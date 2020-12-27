import Quick
import Nimble
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
                
                expect(values.len).to(equal(100))
                expect(values[0]).to(equal(0.1))
                expect(values[99]).to(equal(10))
            }
            
            it("can gen all forms") {
                
                let values = Double.allForms
                expect(values.len).to(equal(10000000))
                expect(values.contains([5.7, 10000.2])).to(beTrue())
                //expect(values[99]).to(equal(1000000))
            }
        }
    }
}
