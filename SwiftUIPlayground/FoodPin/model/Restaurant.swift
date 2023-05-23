//
//  Restaurant.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/3/30.
//

import Foundation

class Restaurant: Identifiable, ObservableObject {
    init(
        name: String,
        type: String,
        location: String,
        phone: String,
        description: String,
        image: String,
        isFavorite: Bool = false,
        rating: Rating? = nil
    ){
        self.id = UUID()
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = image
        self.isFavorite = isFavorite
        self.rating = rating
    }
    @Published
    var id: UUID
    @Published
    var name: String
    @Published
    var type: String
    @Published
    var location: String
    @Published
    var phone: String
    @Published
    var description: String
    @Published
    var image: String
    @Published
    var isFavorite: Bool
    @Published
    var rating: Rating?
    
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

