//
//  ServerDrivenMultiPlatformApp.swift
//  ServerDrivenMultiPlatform
//
//  Created by Kunal Kumar on 2024-07-04.
//

import SwiftUI

@main
struct ServerDrivenMultiPlatformApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
