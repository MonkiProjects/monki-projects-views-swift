import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(monki_map_ios_viewsTests.allTests),
    ]
}
#endif
