//
//  ContentView.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2024-07-04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var uiComponents: [UIComponent] = []

    var body: some View {
        VStack {
            Text("1234")
            DynamicView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.loadJSONFromFile()
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
