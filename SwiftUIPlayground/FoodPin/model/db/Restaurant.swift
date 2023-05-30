//
//  Restaurant.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/3/30.
//

import CoreData

public class Restaurant: NSManagedObject {
    
    @NSManaged public var name: String
    @NSManaged public var type: String
    @NSManaged public var location: String
    @NSManaged public var phone: String
    @NSManaged public var summary: String
    @NSManaged public var image: Data
    @NSManaged public var isFavorite: Bool
    @NSManaged public var ratingText: String?
    
}

extension Restaurant {
    enum Rating: String, CaseIterable {

        case awesome
        case good
        case okay
        case bad
        case terrible

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

    var rating: Rating? {
        get {
            guard let ratingText = ratingText else {
                return nil
            }
            return Rating(rawValue: ratingText)
        }
        set {
            self.ratingText = newValue?.rawValue
        }
    }

}
