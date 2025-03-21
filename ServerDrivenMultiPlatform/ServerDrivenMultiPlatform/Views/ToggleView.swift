//
//  ToggleView.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2025-03-21.
//

import SwiftUI

struct ToggleView: View {
    let label: String
    @State private var isOn: Bool

    init(label: String, initialState: Bool) {
        self.label = label
        _isOn = State(initialValue: initialState) // Initialize @State
    }

    var body: some View {
        Toggle(label, isOn: $isOn)
            .padding()
            .accessibility(label: Text(label))
    }
}

