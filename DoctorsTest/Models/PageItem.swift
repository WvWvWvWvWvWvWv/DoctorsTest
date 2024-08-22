//
//  PageItem.swift
//  DoctorsTest
//
//  Created by Сергей Зайцев on 22.08.2024.
//

import Foundation


struct PageItem: Identifiable {
    let id = UUID()
    let pageName: String
    let pageTag: String
    let ifSelectedPng: String
    let badge: Int
    
    static func pages() -> [PageItem]{
        [
            PageItem(pageName: "Главная", pageTag: "homeGray", ifSelectedPng: "homePink", badge: 0),
            PageItem(pageName: "Приёмы", pageTag: "calendar", ifSelectedPng: "calendar", badge: 0),
            PageItem(pageName: "Чат", pageTag: "chat", ifSelectedPng: "chat", badge: 1),
            PageItem(pageName: "Профиль", pageTag: "Union", ifSelectedPng: "UnionPink", badge: 0)
        ]
    }
}
