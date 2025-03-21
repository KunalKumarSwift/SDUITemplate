//
//  LinkView.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2025-03-21.
//

import SwiftUI

struct LinkView: View {
    let content: String?
    let urlString: String?
    let font: Font?
    let color: Color?
    let accessibilityLabel: String?

    var body: some View {
        if let content = content, let urlString = urlString, let url = URL(string: urlString) {
            Link(content, destination: url)
                .font(font)
                .foregroundColor(color)
                .accessibility(label: Text(accessibilityLabel ?? ""))
        } else {
            Text("-renderLink-")
        }
    }
}

