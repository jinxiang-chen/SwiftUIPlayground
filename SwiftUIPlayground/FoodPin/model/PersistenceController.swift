//
//  PersistenceController.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/5/29.
//

import Foundation
import CoreData
import SwiftUI

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "FoodPin")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let newRestaurant = Restaurant(context: viewContext)
        newRestaurant.name = "Cafe Deadend"
        newRestaurant.type = "Coffee & Tea Shop"
        newRestaurant.location = "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong"
        newRestaurant.phone = "232-923423"
        newRestaurant.summary = "Search for the perfect place to have a great time with friends and family."
        newRestaurant.image = (UIImage(named: "cafedeadend")?.pngData())!
        newRestaurant.isFavorite = false
        
        do {
            try viewContext.save()
        } catch {
            fatalError("Error: \(error.localizedDescription)")
        }
        
        return result
    }()
    
    static var testData: [Restaurant]? {
        let fetchRequest = NSFetchRequest<Restaurant>(entityName: "Restaurant")
        return try? PersistenceController.preview.container.viewContext.fetch(fetchRequest)
    }
}

