
import Quick
import Nimble
@testable import Base



private enum TestEnum: Str, CaseIterable {
    case aaa = "a", bbb = "b"
}

private enum StrEnum: Str, StrEnumT {
    case aaa = "a", bbb = "b"
}


class BaseSpec: QuickSpec {
    override func spec() {
        
        describe("CaseIterable") {
            
            it("can ") {
                expect(TestEnum.aaa.rawValue).to(equal("a"))
                expect(TestEnum.bbb.rawValue).to(equal("b"))
                
                expect(TestEnum(rawValue: "a") != nil).to(beTrue())
                expect(TestEnum(rawValue: "b") != nil).to(beTrue())
                expect(TestEnum(rawValue: "c") == nil).to(beTrue())
                
                expect(TestEnum(rawValue: "aaa") == nil).to(beTrue())
                expect(TestEnum(rawValue: "bbb") == nil).to(beTrue())
                
                
                expect(TestEnum(caseName: "a") == nil).to(beTrue())
                expect(TestEnum(caseName: "b") == nil).to(beTrue())
                
                expect(TestEnum(caseName: "aaa") != nil).to(beTrue())
                expect(TestEnum(caseName: "bbb") != nil).to(beTrue())
            }
            it("can provide random value") {
                expect(TestEnum.allCases).to(contain(TestEnum.randomCase))
            }
            it("can provide allCaseNames") {
                expect(TestEnum.allCaseNames).to(contain("aaa"))
            }
        }
        
        describe("StrEnumT") {
            
            it("can provide Str value") {
                expect(StrEnum.aaa.s).to(equal("a"))
                expect(StrEnum.bbb.s).to(equal("b"))
                
                expect(StrEnum("a") != nil).to(beTrue())
                expect(StrEnum("b") != nil).to(beTrue())
                expect(StrEnum("c") == nil).to(beTrue())
                
                expect(StrEnum("aaa") == nil).to(beTrue())
                expect(StrEnum("bbb") == nil).to(beTrue())
                
                expect(StrEnum(caseName: "a") == nil).to(beTrue())
                expect(StrEnum(caseName: "b") == nil).to(beTrue())
                
                expect(StrEnum(caseName: "aaa") != nil).to(beTrue())
                expect(StrEnum(caseName: "bbb") != nil).to(beTrue())
            }
            
            it("can provide descr value") {
                expect(StrEnum.aaa.descr).to(equal("StrEnum.a"))
            }
            it("can provide allCaseNames") {
                expect(StrEnum.allCaseNames).to(contain("aaa"))
                print(StrEnum.allCaseNames)
                //["StrEnum.a", "StrEnum.b"]
            }
        }
    }
}

