//
//  PickerView.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2025-03-21.
//
import SwiftUI

struct PickerView: View {
    let label: String
    let options: [String]
    @State private var selectedIndex: Int

    init(label: String, options: [String], initialIndex: Int) {
        self.label = label
        self.options = options
        _selectedIndex = State(initialValue: initialIndex) // Initialize @State
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            Picker(label, selection: $selectedIndex) {
                ForEach(0..<options.count, id: \.self) { index in
                    Text(options[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .accessibility(label: Text(label))
        }
    }
}
