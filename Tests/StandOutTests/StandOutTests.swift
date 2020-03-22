import XCTest
import SnapshotTesting
@testable import StandOut

final class StandOutTests: XCTestCase {
    func testLinearHorizontalGradient() {
        let label = UILabel()
        label.text = "Hello World!"

        let start = UIColor(red: 250/255, green: 112/255, blue: 154/255, alpha: 1.0)
        let end = UIColor(red: 254/255, green: 225/255, blue: 64/255, alpha: 1.0)
        label.apply(gradient: .init(startColor: start, endColor: end, kind: .linearHorizontal))

        assertSnapshot(matching: label, as: .image)
    }

    func testLinearVerticalGradient() {
        let label = UILabel()
        label.text = "Hello World!"

        let start = UIColor(red: 146/255, green: 254/255, blue: 157/255, alpha: 1.0)
        let end = UIColor(red: 0, green: 201/255, blue: 1, alpha: 1.0)
        label.apply(gradient: .init(startColor: start, endColor: end, kind: .linearVertical))

        assertSnapshot(matching: label, as: .image)
    }

    func testRadialGradient() {
        let label = UILabel()
        label.text = "Hello World!"

        let start = UIColor(red: 232/255, green: 25/255, blue: 139/255, alpha: 1.0)
        let end = UIColor(red: 199/255, green: 234/255, blue: 253/255, alpha: 1.0)
        label.apply(gradient: .init(startColor: start, endColor: end, kind: .radial))

        assertSnapshot(matching: label, as: .image)
    }
}
