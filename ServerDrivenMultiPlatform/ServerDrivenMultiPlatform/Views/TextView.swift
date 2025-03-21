//
//  Untitled.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2025-03-21.
//

import SwiftUI

struct TextView: View {
    let content: String?
    let font: Font?
    let color: Color?
    let accessibilityLabel: String?

    var body: some View {
        if let content = content {
            Text(content)
                .font(font)
                .foregroundColor(color)
                .accessibility(label: Text(accessibilityLabel ?? ""))
        } else {
            Text("-renderText-")
        }
    }
}

