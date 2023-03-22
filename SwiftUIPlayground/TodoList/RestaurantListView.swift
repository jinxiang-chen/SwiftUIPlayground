//
//  RestaurantListView.swift
//  SwiftUIPlayground
//
//  Created by 陳晉翔 on 2023/3/22.
//

import SwiftUI

struct RestaurantListView: View {
    let restaurantImages = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    let restaurantLocations = ["Hong kong", "Hong kong", "Hong kong","Hong kong", "Hong kong", "Hong kong","Hong kong","Sydney","Sydney","Sydney", "New York","New York","New York","New York","New York","New York","New York", "London","London","London","London"]
    let restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrain / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    var body: some View {
        List {
            ForEach(restaurantImages.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Image(restaurantImages[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                        .cornerRadius(20)
                    Text(restaurantImages[index])
                        .padding(.leading, 16)
                        .font(.system(.title2, design: .rounded))
                    Text(restaurantLocations[index])
                        .padding(.leading, 16)
                        .font(.system(.body, design: .rounded))
                    Text(restaurantTypes[index])
                        .font(.system(.subheadline, design: .rounded))
                        .padding(.leading, 16)
                        .foregroundColor(.gray)
                }.listRowSeparator(.hidden)
            }
        }.listStyle(.plain)
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
        RestaurantListView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Restaurant List View (Dark)")
    }
}
