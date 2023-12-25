//
//  PickerView.swift
//  DrasticPicker
//
//  Created by ミラー・ティモシー on 2023/12/25.
//

import SwiftUI

@objc public enum CustomPickerStyle : Int {
    case defaultStyle
    case segmented
    case wheel
    case menu

    @ViewBuilder
    func applyStyle<T: View>(to picker: T) -> some View {
        switch self {
        case .defaultStyle:
            picker.pickerStyle(DefaultPickerStyle())
        case .segmented:
            picker.pickerStyle(SegmentedPickerStyle())
        case .wheel:
            picker.pickerStyle(WheelPickerStyle())
        case .menu:
            picker.pickerStyle(MenuPickerStyle())
        }
    }
}

struct PickerWrapperView: View {
    let title: String
    let options: [String]
    @State private var selectedOption: String
    var pickerStyle: CustomPickerStyle
    var onSelectionChange: ((String) -> Void)?
    
    init(title: String, options: [String], selectedOption: String = "", pickerStyle: CustomPickerStyle, change: ((String) -> Void)? = nil) {
        self.title = title
        self.options = options
        self._selectedOption = State(initialValue: selectedOption)
        self.pickerStyle = pickerStyle
        self.onSelectionChange = change
    }

    var body: some View {
        let picker = Picker(title, selection: $selectedOption) {
            ForEach(options, id: \.self) { option in
                Text(option)
            }
        }
        pickerStyle.applyStyle(to: picker)
        .onChange(of: selectedOption) { newValue in
           onSelectionChange?(newValue)
        }
    }
}

#Preview {
    PickerWrapperView(title: "Select an option", options: ["Option 13", "Option 2", "Option 3"], pickerStyle: .defaultStyle)
}
