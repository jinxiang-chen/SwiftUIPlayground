//
//  SwiftUIPlaygroundApp.swift
//  SwiftUIPlayground
//
//  Created by 陳晉翔 on 2023/3/9.
//

import SwiftUI

@main
struct SwiftUIPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            RestaurantListView()
        }
    }
    
    init() {
        UIColor()
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle"), .font: UIFont(name: "ArialRoundedMTBlod", size: 35) ?? UIFont.systemFont(ofSize: 35)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle"), .font: UIFont(name: "ArialRoundedMTBlod", size: 20) ?? UIFont.systemFont(ofSize: 20)]
        navBarAppearance.backgroundColor = .clear
        navBarAppearance.backgroundEffect = .none
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}
