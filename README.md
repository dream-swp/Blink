# Blink





* SwiftUI 一个简单遮盖，支持系统: `MacOS`， `iPhone`，`iPad`，`tvOS` 和  `watchOS`。

----


## 安装 ( Installation ) 

#### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler

##### GitHub

```swift
dependencies: [
    .package(url: "https://github.com/dream-swp/Blink.git", .upToNextMajor(from: "1.0.0"))
]
```



----

## 使用 ( Use )


``````swift

struct ContentView: View {

    @ObservedObject var `default`: Config =
        .default { ("Data Request", "Network loading, request data....") }
        .display { .default }
        .style { .default }
        .blur { .default }

    var body: some View {
        VStack(spacing: 30) {

            HStack {
                Button("default") {
                    Blink.bk.display { `default` }
                }
            }
            
        }
        #if os(macOS)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        #endif
        .blink(`default`)
    }
}
``````





-----



##  Convenient Init



``````swift

// Convenient Init function
var info: Config = .info { ("Title", "Details") }
var infoFill: Config = .infoFill { ("Title", "Details") }
var success: Config = .success { ("Title", "Details") }
var successFill: Config = .successFill { ("Title", "Details") }
var error: Config = .error { ("Title", "Details") }
var errorFill: Config = .errorFill { ("Title", "Details") }

// Convenient Init position
var `default`: Config = .`default` { ("Title", "Details") }
var top: Config = .top { ("top", "top") }
var leading: Config = .leading { ("leading", "leading") }
var bottom: Config = .bottom { ("bottom", "bottom") }
var trailing: Config = .trailing { ("trailing", "trailing") }
var center: Config = .center { ("center", "center") }


// Update
var `default`: Config =
        .default { ("Data Request", "Network loading, request data....") }
        .display { .init() }
        .style { .init()  }
        .blur { .init()  }


``````



