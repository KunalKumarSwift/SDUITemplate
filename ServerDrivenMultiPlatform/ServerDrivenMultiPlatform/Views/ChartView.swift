//
//  ChartView.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2025-03-21.
//

import SwiftUI

struct ChartView: View {
    let data: [ChartData]?
    let geometry: GeometryProxy  // Accept GeometryProxy from parent

    var body: some View {
        VStack {
            ForEach(data ?? [], id: \.label) { dataPoint in
                HStack {
                    Text(dataPoint.label)
                        .frame(minWidth: 20.0)
                    Spacer(minLength: 20.0)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: min(CGFloat(dataPoint.value * 10), geometry.size.width * 0.6), height: 20) // Use geometry here
                }
            }
        }
        .padding()
    }
}
