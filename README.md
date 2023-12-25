# DrasticPicker

### Access the SwiftUI Picker controller in .NET iOS, tvOS, and Catalyst apps.

[![NuGet Version](https://img.shields.io/nuget/v/DrasticPicker.svg)](https://www.nuget.org/packages/DrasticPicker/) ![License](https://img.shields.io/badge/License-MIT-blue.svg)

![Catalyst Logo](https://user-images.githubusercontent.com/898335/292736365-7d8a9789-6a8b-4e6b-9dc2-22e08eee2fa6.png)


## How To Use

- Check the `sample` directory for a sample app.

```csharp
var picker = new PickerViewWrapper(
            "Sample Picker", 
            new[] { "Options 1", "Options 2" },
            "Options 2",
            CustomPickerStyle.Menu,
            action =>
            {
                Console.WriteLine(action);
            });
this.View!.AddSubview(picker.UIView);
```

- PickerViewWrapper is an `NSObject` that contains the SwiftUI view. Once initialized, you can access the UIView by requesting its property.

From that point on, it's a standard UIView and can be treated as such.

## FAQ

**Q: Why does this exist?**

In the Desktop Idiom, Mac Catalyst does not support UIPickerView. Your app will throw an exception if you try to use it. Normally, in an ObjC/Swift app, you could bring in SwiftUI and use its Picker as a replacement. SwiftUI isn't bound for .NET, and there's no direct interop process for accessing Swift inside of .NET apps, so there's no direct way to call for a SwiftUI Picker. This library gives a hacky way to make that happen.

**Q: Why does this not support macOS AppKit?**

I believe it could, by replacing the UIHostingController wrapper with an AppKit version, but since AppKit already has the pickers I need, I didn't bother. But if you want that, you should be able to do it if you add the support within the library framework itself, fix its breaking changes, and rebind it.