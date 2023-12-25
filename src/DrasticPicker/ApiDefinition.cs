using System;
using DrasticPicker;
using Foundation;
using ObjCRuntime;
using UIKit;

namespace DrasticPicker {

	// @interface PickerViewWrapper : NSObject
	[BaseType (typeof(NSObject), Name = "_TtC13DrasticPicker17PickerViewWrapper")]
	[DisableDefaultCtor]
	interface PickerViewWrapper
	{
		// @property (readonly, nonatomic, strong) UIView * _Nullable uiView;
		[NullAllowed, Export ("uiView", ArgumentSemantic.Strong)]
		UIView UIView { get; }

		// -(instancetype _Nonnull)initWithTitle:(NSString * _Nonnull)title options:(NSArray<NSString *> * _Nonnull)options selectedOption:(NSString * _Nonnull)selectedOption style:(enum CustomPickerStyle)style onSelectionChange:(void (^ _Nonnull)(NSString * _Nonnull))onSelectionChange __attribute__((objc_designated_initializer));
		[Export ("initWithTitle:options:selectedOption:style:onSelectionChange:")]
		[DesignatedInitializer]
		NativeHandle Constructor (string title, string[] options, string selectedOption = "", CustomPickerStyle style = CustomPickerStyle.DefaultStyle, Action<NSString>? onSelectionChange = null);
	}
	
}
