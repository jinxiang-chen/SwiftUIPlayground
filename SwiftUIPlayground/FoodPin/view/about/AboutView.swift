//
//  AboutView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/6/6.
//

import SwiftUI

struct AboutView: View {
    
    @State private var link: WebLink?
    
    var body: some View {
        NavigationStack {
            List {
                Image("about")
                    .resizable()
                    .scaledToFit()
                
                Section {
                    Link(destination: URL(string: WebLink.rateUs.rawValue)!) {
                        Label(String(localized: "Rate us on App Store"), image: "store")
                            .foregroundColor(.primary)
                    }
                    
                    Label(String(localized: "Tell us your feedback", comment: "Tell us your feedback"), image: "chat")
                        .onTapGesture {
                            link = .feedback
                        }
                }
                
                Section {
                    Label(String(localized: "Twitter", comment: "Twitter"), image: "twitter")
                        .onTapGesture {
                           
                            link = .twitter
                        }
                    Label(String(localized: "Facebook", comment: "Facebook"), image: "facebook")
                        .onTapGesture {
                            link = .facebook
                        }
                    Label(String(localized: "Instagram", comment: "Instagram"), image: "instagram")
                        .onTapGesture {
                            link = .instagram
                        }
                }
            }
            .sheet(item: $link) { item in
                if let url = URL(string: item.rawValue) {
                    SafariView(url: url)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("about")
            .navigationBarTitleDisplayMode(.automatic)
          
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
            .environment(\.locale, .init(identifier: "zh-Hant"))
    }
}
