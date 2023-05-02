//
//  DifferencList.swift
//  SwiftUIPlayground
//
//  Created by 陳晉翔 on 2023/3/20.
//

import SwiftUI

struct SampleListView: View {
    let items = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var body: some View {
        List {
            ForEach(items.indices, id: \.self) { index in
                let item = items[index]
                HStack {
                    Image(item)
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text(item)
                }
            }
        }
    }
}

struct Item: Identifiable, Hashable {
    let id = UUID()
    let description: String
    let imageName: String
}

struct DifferencList_Previews: PreviewProvider {
    static var previews: some View {
        SampleListView()
    }
}
