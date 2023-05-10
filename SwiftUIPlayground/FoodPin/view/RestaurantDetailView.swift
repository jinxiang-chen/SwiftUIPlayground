//
//  RestaurantDetailView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/4/11.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.dismiss) private var dismiss

    var restaurant: Restaurant
    
    @State private var showReview = false
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 445)
                    .overlay {
                        VStack {
                            if restaurant.isFavorite {
                                Image(systemName: "heart.fill")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                        .font(.system(size: 30))
                                        .padding([.top, .trailing], 20)
                                    .foregroundColor(.yellow)
                            } else {
                                Image(systemName: "heart")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                        .font(.system(size: 30))
                                        .padding([.top, .trailing], 20)
                                    .foregroundColor(.white)
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                Text(restaurant.name)
                                    .font(.custom("Nunito-Regular", size: 35, relativeTo: .largeTitle))
                                    .bold()
                                Text(restaurant.type)
                                    .font(.system(.headline, design: .rounded))
                                    .padding(.all, 5)
                                    .background(Color.black)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                            .foregroundColor(.white)
                            .padding()
                        }
                    }
                Text(restaurant.description)
                    .padding()
                HStack(alignment: .top){
                    VStack(alignment: .leading) {
                        Text("ADDRESS")
                            .font(.system(.headline, design: .rounded))
                        Text(restaurant.location)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading) {
                        Text("PHONE")
                            .font(.system(.headline, design: .rounded))
                        Text(restaurant.phone)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }.padding(.horizontal)
                NavigationLink {
                    MapView(location: restaurant.location)
                        .ignoresSafeArea(.all)
                } label: {
                    MapView(location: restaurant.location, interactionModes: [])
                       .frame(minWidth: 0, maxWidth: .infinity)
                       .frame(height: 200)
                       .cornerRadius(20)
                       .padding()
                }
                Button {
                    self.showReview.toggle()
                } label: {
                    Text("Rate it")
                        .font(.system(.headline, design: .rounded))
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .tint(Color("NavigationBarTitle"))
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 25))
                .controlSize(.large)
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if(!showReview) {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                    }
                }
            }
        }
        .ignoresSafeArea()
        .overlay {
            self.showReview ? ZStack {
                ReviewView(restaurant: restaurant, isDisplayed: $showReview)
            } : nil
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let restaurant = Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: true
        )
        
        
        RestaurantDetailView(
            restaurant: restaurant
        )
        .environment(\.dynamicTypeSize, .xLarge)
    }
}
