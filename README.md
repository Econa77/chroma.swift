# chroma.swift

**🚧 This library is still development. 🚧**

## Requirements
- macOS 10.9+
- Xcode 9.0+
- Swift 4.0+

## Usage
### CocoaPods
```
pod 'chroma.swift', :git => 'https://github.com/Econa77/chroma.swift.git'
```

### Carthage
```
github "Econa77/chroma.swift"
```

## Examples

```swift
let colors = Chroma().scale([UIColor.red, UIColor.blue], colorSpace: .lab).split(6)
```

```swift
let color = Chroma().scale([UIColor.red, UIColor.blue], colorSpace: .lab).color(0.5)
```

## Contributing
1. Fork it ( https://github.com/Econa77/chroma.swift/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
