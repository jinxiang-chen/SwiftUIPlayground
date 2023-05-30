//
//  RestaurantDetailView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/4/11.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var context

    @ObservedObject var restaurant: Restaurant
    @State private var showReview = false
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(uiImage: UIImage(data: restaurant.image)!)
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
                            HStack(alignment: .bottom) {
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
                                
                                if let rating = restaurant.rating, !showReview {
                                    Image(rating.image)
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .padding([.bottom, .trailing])
                                        .transition(.scale)
                                }
                            }
                          
                        }
                    }
                Text(restaurant.summary)
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
        .onChange(of: restaurant) { _ in
            if context.hasChanges {
                try? self.context.save()
            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(
            restaurant: (PersistenceController.testData?.first)!
        )
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        .previewDevice("iPhone 12 Pro")
    }
}
