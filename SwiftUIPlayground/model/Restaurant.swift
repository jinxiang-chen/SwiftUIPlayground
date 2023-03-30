//
//  Restaurant.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/3/30.
//

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var image: String = ""
    var name: String = ""
    var location: String = ""
    var type: String = ""
    var isFavorite: Bool = false
}
