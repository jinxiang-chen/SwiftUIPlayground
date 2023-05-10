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
    
    enum Rating: String, CaseIterable {
        
        case awesome = "awesome"
        case good = "good"
        case okay = "okay"
        case bad = "bad"
        case terrible = "terrible"
        
        var image: String {
            switch self {
                case .awesome: return "awesome"
                case .good: return "good"
                case .okay: return "okay"
                case .bad: return "bad"
                case .terrible: return "terrible"
            }
        }
        
    }

}

