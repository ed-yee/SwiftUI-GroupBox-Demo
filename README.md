# SwiftUI GroupBox Demo

This project demonstrates SwiftUI GroupBox usage.

## Technical Stuff
XCode version: 27.0

The project has been tested with the following simulator:
- iPhone 18 Pro (iOS 18.6)
- iPhone 18 Pro (iOS 27.0)

## Basic GroupBox

A basic GroupBox shows content within a rounded rectangle box.

![Basic GroupBox](Doc%20Assets/Basic3.png)

```swift
GroupBox {
	Text("Content")
}
```

## GroupBox Title

A GroupBox can have a title.

![GroupBox Title](Doc%20Assets/Header.png)

```swift
GroupBox("Header") {
	Text("Content")
}
```

A formatted title:

```swift
GroupBox {
    Text("Content")
} label: {
    Text("Colored \(Text("Header")
        .foregroundStyle(.blue))")
        .foregroundStyle(.red)
}
```

Since the header, `label:` parameter, is a View type therefore you can present anything you want.

```swift
GroupBox {
    Text("Content")
} label: {
    VStack(alignment: .leading) {
        HStack {
            Image(systemName: "gear")
            Text("Fancy Header")
        }
        .font(.title2)
        Text("Subheader")
            .font(.title3).italic()
            .foregroundStyle(.blue)
    }
}}
```

## Multilevel

You can embed another GroupBox within another GroupBox. In fact, you can go as deep as you want.

![Multilevel GroupBox](Doc%20Assets/Multilevel.png)

## Customization

If you want to style a GroupBox, you must create a custom GroupBoxStyle type.

```swift
struct SimpleGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: GroupBoxStyleConfiguration) -> some View {
        // Return some view
        VStack(alignment: .leading) {
            // Style the header block
            configuration.label

            // Style the content block
            configuration.content
        }
    }
}
```

In a nutshell, your custom GroupBoxStyle must implement the `makeBody` function. It returns a View.

The GroupBoxStyleConfiguration contains two properties:

- `label` (GroupBox header)
- `content` (GroupBox content)

So you can format the header block and content block separately.

The demo project styles the header block with a RoundedRectangle element.

![Multilevel GroupBox with style](Doc%20Assets/Multilevel%20with%20custom%20style.png)

Other than the indentation of each GroupBox, it is hard to distinguish each GroupBox.

## Fix Multilevel GroupBox Styling Problem

I decided to change the GroupBox background color based on the nesting level. Of course, you can also change the header background color, too.

**How does the code know the current nesting level?**

We need an environment property to hold the current nesting level.

```swift
@Environment(\.groupBoxNestingLevel) var nestingLevel
```

Note that the `\.groupBoxNestingLevel` is a custom environment key.

To access the value, we need to extend EnvironmentValues. We also need to initialize the key value to 0.

```swift
struct GroupBoxNestingLevelKey: EnvironmentKey {
    static var defaultValue: Int = 0 // Default value for the outermost GroupBox
}

extension EnvironmentValues {
    var groupBoxNestingLevel: Int {
        get { self[GroupBoxNestingLevelKey.self] }
        set { self[GroupBoxNestingLevelKey.self] = newValue }
    }
}
```

The following code snippet shows how to utilize the `.groupBoxNestingLevel` environment property.

Look for `nestingLevel` variable.

Make sure the `nestingLevel` is incremented by 1. Otherwise, all GroupBox background color will be the same!

```swift
struct CustomGroupBoxStyle: GroupBoxStyle {
    @Environment(\.groupBoxNestingLevel) var nestingLevel
    @Environment(\.colorScheme) var colorScheme
    
    // Select appropriate group box background color
    var groupBoxBgColor: Color {
        if colorScheme == .dark {
            // Dark
            if nestingLevel % 2 == 0 {
                // Even
                return .gbBgColorDarkEven
            } else {
                // Odd
                return .gbBgColorDarkOdd
            }
        } else {
            // Light
            if nestingLevel % 2 == 0 {
                // Even
                return .gbBgColorLightEven
            } else {
                // Odd
                return .gbBgColorLightOdd
            }
        }
    }

    func makeBody(
        configuration: GroupBoxStyleConfiguration
    ) -> some View {
        VStack(...) }
            ...
        }
        .background(groupBoxBgColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .environment(\.groupBoxNestingLevel, nestingLevel + 1) // Increment for nested GroupBoxes
    }
}
```
