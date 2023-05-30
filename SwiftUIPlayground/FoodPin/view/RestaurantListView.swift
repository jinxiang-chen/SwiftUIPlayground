import SwiftUI
import CoreData


struct RestaurantListView: View {
    
    @State private var showNewRestaurant = false
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: Restaurant.entity(),
        sortDescriptors: []
    )
    var restaurants: FetchedResults<Restaurant>
    
    var body: some View {
        NavigationStack {
            List {
                if restaurants.isEmpty {
                    Image("emptydata")
                        .resizable()
                        .scaledToFit()
                } else {
                    ForEach(restaurants.indices, id: \.self) { index in
                        ZStack(alignment: .leading) {
                            NavigationLink {
                                RestaurantDetailView(
                                    restaurant: restaurants[index]
                                )
                            } label: {
                                EmptyView()
                            }
                            .opacity(0)
                            BasicImageRow(restaurant: restaurants[index])
                                .swipeActions(
                                    edge: .leading,
                                    allowsFullSwipe: false,
                                    content: {
                                        // 加入按鈕，圖示是愛心，背景是綠色
                                        Button {
                                            restaurants[index].isFavorite.toggle()
                                        } label: {
                                            Image(systemName: "heart")
                                        }
                                        .tint(.green)
                                        // 加入按鈕，圖示是日曆，背景是橘色
                                        Button {
                                            print("Add to calendar")
                                        } label: {
                                            Image(systemName: "calendar")
                                        }
                                        .tint(.orange)
                                    }
                                )
                        }
                    }
                    .onDelete(perform: deleteRecord)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("FoodPin")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                Button {
                    self.showNewRestaurant = true
                } label: {
                    Image(systemName: "plus")
                }
                .accentColor(.primary)
            }
        }
        .accentColor(.white)
        .sheet(isPresented: $showNewRestaurant) {
            NewRestaurantView()
        }
    }
    
    private func deleteRecord(indexSet: IndexSet) {
        for index in indexSet {
            let itemToDelete = restaurants[index]
            context.delete(itemToDelete)
        }
        DispatchQueue.main.async {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}

struct BasicImageRow: View {
    
    @ObservedObject var restaurant: Restaurant
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            if let imageData = restaurant.image {
                Image(
                    uiImage: UIImage(data: imageData) ?? UIImage()
                )
                    .resizable()
                    .frame(width: 120, height: 118)
                    .cornerRadius(20)
            }
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
        .contextMenu {
            // 加入按鈕，文字是訂位，圖片是電話。
            Button {
                self.showError.toggle()
            } label: {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            // 加入按鈕，文字：當isFavroite是true時Remove from favorite，false是Mark as favorite，圖片是heart
            Button {
                self.restaurant.isFavorite.toggle()
            } label: {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorite" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            }
            Button {
                self.showOptions.toggle()
            } label: {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .alert("Not yet available", isPresented: $showError) {
            Button("OK") {
                
            }
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
        .sheet(isPresented: $showOptions) {
            let defaultText = "Just checking in at \(restaurant.name)"
            // 建立 ActivityView，並且有兩種，一種是分享文字加圖片，另一種是只有分享文字
            if let imageData = restaurant.image, let imageToShare = UIImage(data: imageData) {
                ActivityView(
                    activityItems: [defaultText, imageToShare]
                )
            } else {
                ActivityView(
                    activityItems: [defaultText]
                )
            }
        }
    }
}

struct FullImageRow: View {
    
    @ObservedObject var restaurant: Restaurant
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let imageData = restaurant.image {
                Image(
                    uiImage: UIImage(data: imageData) ?? UIImage()
                )
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(20)
            }
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
        RestaurantListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        RestaurantListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .preferredColorScheme(.dark)
            .previewDisplayName("Restaurant List View (Dark)")
        BasicImageRow(restaurant: (PersistenceController.testData?.first)!)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("BasicImageRow")
        FullImageRow(restaurant: (PersistenceController.testData?.first)!)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("FullImageRow")
        
    }
}
