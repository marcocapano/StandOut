import UIKit

public extension UILabel {
    /// Applies a gradient to the label's text only, not the background.
    func apply(gradient: Gradient) {
        guard let text = text, !text.isEmpty else { return }

        var startColorRed: CGFloat = 0
        var startColorGreen: CGFloat = 0
        var startColorBlue: CGFloat = 0
        var startAlpha: CGFloat = 0

        gradient.startColor.getRed(&startColorRed, green: &startColorGreen, blue: &startColorBlue, alpha: &startAlpha)

        var endColorRed: CGFloat = 0
        var endColorGreen: CGFloat = 0
        var endColorBlue: CGFloat = 0
        var endAlpha: CGFloat = 0

        gradient.endColor.getRed(&endColorRed, green: &endColorGreen, blue: &endColorBlue, alpha: &endAlpha)

        let textSize: CGSize = text.size(withAttributes: [.font: font as Any])
        UIGraphicsBeginImageContext(textSize)

        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return
        }

        let locations: [CGFloat] = [0.0, 1.0]
        let rgbColorspace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [
            startColorRed, startColorGreen, startColorBlue, startAlpha,
            endColorRed, endColorGreen, endColorBlue, endAlpha
        ]

        let cgGradient = CGGradient(colorSpace: rgbColorspace, colorComponents: components, locations: locations, count: locations.count)!

        switch gradient.kind {
        case .linearHorizontal:
            let start = CGPoint(x: 0, y: textSize.height / 2)
            let end = CGPoint(x: textSize.width, y: textSize.height / 2)
            context.drawLinearGradient(cgGradient, start: start, end: end, options: .drawsBeforeStartLocation)
        case .linearVertical:
            let start = CGPoint(x: textSize.width / 2, y: 0)
            let end = CGPoint(x: textSize.width / 2, y: textSize.height)
            context.drawLinearGradient(cgGradient, start: start, end: end, options: .drawsBeforeStartLocation)
        case .radial:
            let center = CGPoint(x: textSize.width / 2, y: textSize.height / 2)
            let radius = max(textSize.width, textSize.height) / 2
            context.drawRadialGradient(cgGradient, startCenter: center, startRadius: 0, endCenter: center, endRadius: radius, options: .drawsBeforeStartLocation)
        }

        guard let gradientImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return
        }

        UIGraphicsEndImageContext()

        textColor = UIColor(patternImage: gradientImage)
        return
    }

    public struct Gradient {
        let startColor: UIColor
        let endColor: UIColor
        let kind: Kind

        init(startColor: UIColor, endColor: UIColor, kind: Kind = .linearHorizontal) {
            self.startColor = startColor
            self.endColor = endColor
            self.kind = kind
        }

        enum Kind {
            case linearHorizontal
            case linearVertical
            case radial
        }
    }
}
