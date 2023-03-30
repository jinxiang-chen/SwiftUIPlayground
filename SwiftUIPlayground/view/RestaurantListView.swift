import SwiftUI

struct RestaurantListView: View {
    
    @State
    var restaurants = [
        Restaurant(image: "Cafe Deadend",name: "Cafe Deadend",location: "Hong kong",type: "Coffee & Tea Shop"),
        Restaurant(image: "Homei",name: "Homei",location: "Hong kong",type: "Cafe"),
        Restaurant(image: "Teakha",name: "Teakha",location: "Hong kong",type: "Tea House"),
        Restaurant(image: "Cafe Loisl",name: "Cafe Loisl",location: "Hong kong",type: "Austrain / Causual Drink"),
        Restaurant(image: "Petite Oyster",name: "Petite Oyster",location: "Hong kong",type: "French"),
        Restaurant(image: "For Kee Restaurant",name: "For Kee Restaurant",location: "Hong kong",type: "Bakery"),
        Restaurant(image: "Po's Atelier",name: "Po's Atelier",location: "Hong kong",type: "Bakery"),
        Restaurant(image: "Teakha",name: "Teakha",location: "Sydney",type: "Chocolate"),
        Restaurant(image: "Bourke Street Bakery",name: "Bourke Street Bakery",location: "Sydney",type: "cafe"),
        Restaurant(image: "Haigh's Chocolate",name: "Haigh's Chocolate",location: "Sydney",type: "American / Seafood"),
        Restaurant(image: "Palomino Espresso",name: "Palomino Espresso",location: "New York",type: "American"),
        Restaurant(image: "Upstate",name: "Upstate",location: "New York",type: "American"),
        Restaurant(image: "Traif",name: "Traif",location: "New York",type: "Breakfast & Brunch"),
        Restaurant(image: "Graham Avenue Meats And Deli",name: "Graham Avenue Meats And Deli",location: "New York",type: "Coffee & Tea"),
        Restaurant(image: "Waffle & Wolf",name: "Waffle & Wolf",location: "New York",type: "Coffee & Tea"),
        Restaurant(image: "Five Leaves",name: "Five Leaves",location: "New York",type: "Latin American"),
        Restaurant(image: "Cafe Lore",name: "Cafe Lore",location: "New York",type: "Spanish"),
        Restaurant(image: "Confessional",name: "Confessional",location: "London",type: "Spanish"),
        Restaurant(image: "Barrafina",name: "Barrafina",location: "London",type: "Spanish"),
        Restaurant(image: "Donostia",name: "Donostia",location: "London",type: "Spanish"),
        Restaurant(image: "Royal Oak",name: "Royal Oak",location: "London",type: "British"),
        Restaurant(image: "CASK Pub and Kitchen", name: "CASK Pub and Kitchen",location: "London",type: "Thai")
    ]

    var body: some View {
        List {
            ForEach(restaurants.indices, id: \.self) { index in
                BasicImageRow(
                    restaurant: $restaurants[index]
                )
            }.listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}

struct BasicImageRow: View {
    
    @Binding var restaurant: Restaurant
    @State private var showOptions = false
    @State private var showError = false

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(restaurant.image)
                .resizable()
                .frame(width: 120, height: 118)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.bottom)
            if restaurant.isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog("What do you want to do?", isPresented: $showOptions, titleVisibility: .visible) {
            Button("Reserve a table") {
                self.showError.toggle()
            }
            if restaurant.isFavorite {
                Button("Remove from favorites") {
                    self.restaurant.isFavorite.toggle()
                }
            } else {
                Button("Mark as favorite") {
                    self.restaurant.isFavorite.toggle()
                }
            }
            
        }
        .alert("Not yet available", isPresented: $showError) {
            Button("OK") {
                
            }
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
    }
}

struct FullImageRow: View {
    
    @Binding var restaurant: Restaurant
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(20)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(restaurant.name)
                        .font(.system(.title2, design: .rounded))
                    Text(restaurant.type)
                        .font(.system(.body, design: .rounded))
                    Text(restaurant.location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom)
                if restaurant.isFavorite {
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .padding([.trailing], 20)
                        .foregroundColor(.yellow)
                }
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog("What do you want to do?", isPresented: $showOptions, titleVisibility: .visible) {
            Button("Reserve a table") {
                self.showError.toggle()
            }
            if restaurant.isFavorite {
                Button("Remove from favorites") {
                    self.restaurant.isFavorite.toggle()
                }
            } else {
                Button("Mark as favorite") {
                    self.restaurant.isFavorite.toggle()
                }
            }
        }
        .alert("Not yet available", isPresented: $showError) {
            Button("OK") {
                
            }
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        let restaurant = Restaurant(image: "Cafe Deadend",name: "Cafe Deadend",location: "Hong kong",type: "Coffee & Tea Shop", isFavorite: true)
        RestaurantListView()
        RestaurantListView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Restaurant List View (Dark)")
        BasicImageRow(restaurant: .constant(restaurant))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("BasicImageRow")
        FullImageRow(restaurant: .constant(restaurant))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("FullImageRow")
      
    }
}