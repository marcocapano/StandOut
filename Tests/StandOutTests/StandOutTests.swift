import XCTest
@testable import StandOut

final class StandOutTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(StandOut().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
