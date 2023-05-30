//
//  ReviewView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/5/10.
//

import SwiftUI

struct ReviewView: View {
    
    var restaurant: Restaurant
    @Binding var isDisplayed: Bool
    @State var isShowRatings: Bool = false
    
    var body: some View {
        ZStack(alignment: .center) {
            Image(uiImage: UIImage(data: restaurant.image)!)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
            Color.black
                .opacity(0.1)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            VStack {
                HStack() {
                    Spacer()
                    Button {
                        withAnimation(.easeOut(duration: 0.3)) {
                            self.isDisplayed = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30.0))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer()
            }
            VStack(alignment: .leading) {
                ForEach(Restaurant.Rating.allCases, id: \.self) { rating in
                    let delay = Double((Restaurant.Rating.allCases.firstIndex(of: rating)!)) * 0.05
                    HStack {
                        Image(rating.image)
                        Text(rating.image.capitalized)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .opacity(isShowRatings ? 1.0 : 0)
                    .offset(x: isShowRatings ? 0 : 1000)
                    .onAppear {
                        isShowRatings.toggle()
                    }
                    .animation(.easeOut.delay(delay), value: isShowRatings)
                    .onTapGesture {
                        self.restaurant.rating = rating
//                        self.isDisplayed = false
                    }
                }
            }
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(restaurant: (PersistenceController.testData?.first)!, isDisplayed: .constant(true))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
