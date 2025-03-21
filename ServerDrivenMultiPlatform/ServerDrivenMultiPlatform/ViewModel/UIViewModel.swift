//
//  UIViewModel.swift
//  ServerDriven
//
//  Created by Kunal Kumar on 2024-07-04.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var uiComponents: [UIComponent] = []

    init() {
        //loadJSONFromFile()
    }

    func loadJSONFromFile() {
        if let url = Bundle.main.url(forResource: "UIComponents", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let rootComponent = try decoder.decode(RootComponent.self, from: data)
                DispatchQueue.main.async {
                    self.uiComponents = rootComponent.components
                }

            } catch {
                print("Failed to load JSON from file: \(error.localizedDescription)")
            }
        }
    }

    func loadJSONFromAPI() {
        guard let url = URL(string: "https://your-api-endpoint.com/uiComponents") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let rootComponent = try decoder.decode(RootComponent.self, from: data)
                    DispatchQueue.main.async {
                        self.uiComponents = rootComponent.components
                    }
                } catch {
                    print("Failed to decode JSON from API: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Failed to load JSON from API: \(error.localizedDescription)")
            }
        }.resume()
    }

    func performAction(named action: String) {
        // Define your custom actions here
        switch action {
        case "buttonAction":
            print("Button was clicked!")
        default:
            break
        }
    }
}

