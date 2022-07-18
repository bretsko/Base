
import Quick
import Nimble
import XCTest
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
                do {
                    try expect(TestEnum.aaa.rawValue).to(equal("a"))
                    try expect(TestEnum.bbb.rawValue).to(equal("b"))
                    
                    try expect(TestEnum(rawValue: "a") != nil).to(beTrue())
                    try expect(TestEnum(rawValue: "b") != nil).to(beTrue())
                    try expect(TestEnum(rawValue: "c") == nil).to(beTrue())
                    
                    try expect(TestEnum(rawValue: "aaa") == nil).to(beTrue())
                    try expect(TestEnum(rawValue: "bbb") == nil).to(beTrue())
                    
                    
                    try expect(TestEnum(caseName: "a") == nil).to(beTrue())
                    try expect(TestEnum(caseName: "b") == nil).to(beTrue())
                    
                    try expect(TestEnum(caseName: "aaa") != nil).to(beTrue())
                    try expect(TestEnum(caseName: "bbb") != nil).to(beTrue())
                } catch {
                    XCTFail()
                }
            }
            it("can provide random value") {
                do {
                    try expect(TestEnum.allCases).to(contain(TestEnum.randomCase))
                } catch {
                    XCTFail()
                }
            }
            it("can provide allCaseNames") {
                do {
                    try expect(TestEnum.allCaseNames).to(contain("aaa"))
                } catch {
                    XCTFail()
                }
            }
        }
        
        describe("StrEnumT") {
            
            it("can provide Str value") {
                do {
                    
                    try expect(StrEnum.aaa.s).to(equal("a"))
                    try expect(StrEnum.bbb.s).to(equal("b"))
                    
                    try expect(StrEnum("a") != nil).to(beTrue())
                    try expect(StrEnum("b") != nil).to(beTrue())
                    try expect(StrEnum("c") == nil).to(beTrue())
                    
                    try expect(StrEnum("aaa") == nil).to(beTrue())
                    try expect(StrEnum("bbb") == nil).to(beTrue())
                    
                    try expect(StrEnum(caseName: "a") == nil).to(beTrue())
                    try expect(StrEnum(caseName: "b") == nil).to(beTrue())
                    
                    try expect(StrEnum(caseName: "aaa") != nil).to(beTrue())
                    try expect(StrEnum(caseName: "bbb") != nil).to(beTrue())
                } catch {
                    XCTFail()
                }
            }
            
            it("can provide descr value") {
                do {
                    try expect(StrEnum.aaa.descr).to(equal("StrEnum.a"))
                } catch {
                    XCTFail()
                }
            }
            it("can provide allCaseNames") {
                do {
                    try expect(StrEnum.allCaseNames).to(contain("aaa"))
                } catch {
                    XCTFail()
                }
                print(StrEnum.allCaseNames)
                //["StrEnum.a", "StrEnum.b"]
            }
        }
    }
}

