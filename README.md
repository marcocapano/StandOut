# StandOut

A Swift Package to make your text stand out.

`StandOut` lets you style your labels with beautiful gradients!

## How to use

```swift
let label = UILabel()
label.text = "Hello World!"

let start = UIColor(red: 250/255, green: 112/255, blue: 154/255, alpha: 1.0)
let end = UIColor(red: 254/255, green: 225/255, blue: 64/255, alpha: 1.0)
label.apply(gradient: .init(startColor: start, endColor: end, kind: .linearHorizontal))
```

## Examples

### Horizontal Gradient
![horizontal](Tests/StandOutTests/__Snapshots__/StandOutTests/testLinearHorizontalGradient.1.png)

### Vertical Gradient
![vertial](Tests/StandOutTests/__Snapshots__/StandOutTests/testLinearVerticalGradient.1.png)

### Radial Gradient
![radial](Tests/StandOutTests/__Snapshots__/StandOutTests/testRadialGradient.1.png)




