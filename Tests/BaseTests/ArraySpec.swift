import Quick
import Nimble
import XCTest
import Base


class ArraySpec: QuickSpec {
    override func spec() {
        
        describe("Array") {
            
            //TODO: add cases from
            //https://themathpage.com/Arith/decimals.htm
            
            it("can make combinations of subsequent elements - with integers") {
                
                let arr = [0,1,2]
                let arrs = arr.allSubseqCombis
                
                //print(arrs)
                
                let a = arrs.map{$0.objs.set}.set
                
                let b = Set([ Set([0]),
                              Set([1]),
                              Set([2]),
                              Set([0,1]),
                              Set([1,2]),
                              Set([0,1,2]),
                             ])
                do {
                    try expect(a).to(equal(b))
                } catch {
                    XCTFail()
                }
            }
            
            it("can make combinations of subsequent elements - with strings") {

                let arr = ["a0","a1","a2"]
                let arrs = arr.allSubseqCombis
                
                print(arrs)

                let a = arrs.map{$0.objs.set}.set
                
                let b = Set([ Set(["a0"]),
                              Set(["a1"]),
                              Set(["a2"]),
                              Set(["a0","a1"]),
                              Set(["a1","a2"]),
                              Set(["a0","a1","a2"]),
                ])
                do {
                    try expect(a).to(equal(b))
                } catch {
                    XCTFail()
                }
            }
            
            
//            it("can gen in range") {
//
//                let arr = [0,1,2,3,4,5,6]
//                let arrs = arr.allSubseqCombis
//
//                print(arrs)
//                expect(arrs).to(equal( [ [2] ] ))
//            }
        }
    }
}
