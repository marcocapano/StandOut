# StandOut

A Swift Package to make your text stand out.

`StandOut` lets you style your labels with beautiful gradients!

## How to use

```swift
let label = UILabel()
label.text = "Hello World!"
label.apply(gradient: .init(startColor: startColor, endColor: endColor, kind: .linearHorizontal))
```

## Examples

### Horizontal Gradient
![horizontal](Tests/StandOutTests/__Snapshots__/StandOutTests/testLinearHorizontalGradient.1.png)

### Vertical Gradient
![vertial](Tests/StandOutTests/__Snapshots__/StandOutTests/testLinearVerticalGradient.1.png)

### Radial Gradient
![radial](Tests/StandOutTests/__Snapshots__/StandOutTests/testRadialGradient.1.png)




