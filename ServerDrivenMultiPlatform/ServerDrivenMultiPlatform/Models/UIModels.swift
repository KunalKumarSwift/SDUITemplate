//
//  UIModels.swift
//  ServerDriven
//
//  Created by Kunal Kumar on 2024-07-04.
//

import Foundation

struct AccessibilityData: Codable, Equatable {
    let label: String?
}

struct ChartData: Codable, Equatable {
    let label: String
    let value: Double
}

struct UIComponent: Codable, Equatable {
    //var id: UUID = UUID()
    let type: String
    let content: String?
    let action: String?
    let children: [UIComponent]?
    let font: String?
    let color: String?
    let backgroundColor: String?
    let foregroundColor: String?
    let url: String?
    let data: [ChartData]?
    let accessibility: AccessibilityData?
    let label: String?
    let placeholder: String?
    let options: [String]?
    let selectedIndex: Int?
    let isOn: Bool?
    let sections: [UIComponent]?
    let header: String?
    let footer: String?
}

struct RootComponent: Codable, Equatable {
    let components: [UIComponent]
}
