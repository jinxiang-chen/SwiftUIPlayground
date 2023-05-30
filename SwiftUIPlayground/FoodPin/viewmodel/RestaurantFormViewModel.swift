//
//  RestaurantFormViewModel.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/5/30.
//

import Foundation
import UIKit

class RestaurantFormViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var type: String = ""
    @Published var location: String = ""
    @Published var phone: String = ""
    @Published var description: String = ""
    @Published var image: UIImage = UIImage()
    
    init(restaurant: Restaurant? = nil) {
        if let restaurant = restaurant {
            name = restaurant.name
            type = restaurant.type
            location = restaurant.location
            phone = restaurant.phone
            description = restaurant.description
            image = UIImage(data: restaurant.image) ?? UIImage()
        }
    }
}
