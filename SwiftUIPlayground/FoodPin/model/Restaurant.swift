//
//  Restaurant.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/3/30.
//

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var phone: String = ""
    var description: String = "" 
    var image: String = ""
    var isFavorite: Bool = false
}
