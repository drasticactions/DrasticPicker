//
//  PickerViewWrapper.swift
//  DrasticPicker
//
//  Created by ミラー・ティモシー on 2023/12/25.
//

import Combine
import Foundation
import SwiftUI

@objc public class PickerViewWrapper: NSObject, ObservableObject
{
    private var swiftUIView: PickerWrapperView?
    private var hostingController: UIHostingController<PickerWrapperView>?
        
    @objc public var uiView: UIView? { hostingController?.view }

    @objc public init(title: String, options: [String], selectedOption: String, style: CustomPickerStyle, onSelectionChange: @escaping (String) -> Void) {
            super.init()

        swiftUIView = PickerWrapperView(title: title, options: options, selectedOption: selectedOption, pickerStyle: style, change: onSelectionChange)
        
            guard let rootView = swiftUIView else { return }
            hostingController = UIHostingController(rootView: rootView)
        }
}
