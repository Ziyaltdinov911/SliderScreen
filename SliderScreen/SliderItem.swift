//
//  SliderItem.swift
//  SliderScreen
//
//  Created by KAMA . on 03.03.2025.
//

import Foundation
import UIKit

struct SliderItem {
    let id = UUID().uuidString
    var image: String
    var text: String
    var textColor: UIColor = .black
    
    static func mockData() -> [SliderItem] {
        return [
            SliderItem(image: "img1", text: "Текст для первой картинки выглядит следующим образом."),
            SliderItem(image: "img2", text: "Текст для второй картинки выглядит следующим образом."),
            SliderItem(image: "img3", text: "Текст для третьей картинки выглядит следующим образом."),
            SliderItem(image: "img4", text: "Текст для четвёртой картинки выглядит следующим образом.", textColor: .white),
        ]
    }
}
