//
//  MainView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/6/3.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTabIndex = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            RestaurantListView()
               .tabItem {
                   Label("Favorites", systemImage: "tag.fill")
               }
               .tag(0)
           
           Text("Discover")
               .tabItem {
                   Label("Discover", systemImage: "wand.and.rays")
               }
               .tag(1)
           
           AboutView()
               .tabItem {
                   Label("About", systemImage: "square.stack")
               }
               .tag(2)
        }
        .accentColor(Color("NavigationBarTitle"))
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
