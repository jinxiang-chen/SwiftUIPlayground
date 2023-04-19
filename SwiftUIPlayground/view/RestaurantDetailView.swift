//
//  RestaurantDetailView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/4/11.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var restaurant: Restaurant
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .ignoresSafeArea()
            // 一個黑色背景的View，高度為100，寬度無限，透明度為0.8，圓角為20，邊距為20
            Color.black
                .frame(height: 100)
                .opacity(0.8)
                .cornerRadius(20)
                .padding(20)
                .overlay {
                    VStack(spacing: 5) {
                        Text(restaurant.name)
                        Text(restaurant.type)
                        Text(restaurant.location)
                    }
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                }
            }
        
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(
            restaurant: Restaurant(
                image: "Cafe Deadend",
                name: "Cafe Deadend",
                location: "Hong kong",
                type: "Coffee & Tea Shop"
            )
        )
        
    }
}
