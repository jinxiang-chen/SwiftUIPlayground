//
//  TutorialView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/6/3.
//

import SwiftUI

struct TutorialView: View {
    
    let headings = [
        "CREATE YOUR OWN FOOD GUIDE", "SHOW YOUR THE LOCATION", "DISCOVER GRATE"
    ]
    let subheadings = [
        "Pin your favorite restaurants and create your own food guide",
        "Search and locate your favorite restaurant on Maps",
        "Find restaurants shared by your friends and other foodies"
    ]
    let images = ["onboarding-1", "onboarding-2", "onboarding-3"]
    
    @State private var currentPage = 0
    @Environment(\.dismiss) var dismiss
    @AppStorage("hasViewedWalkthrough") var hasViewedWalkthrough: Bool = false
    
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
    }
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(headings.indices, id: \.self) { index in
                    TutorialPage(
                        image: images[index],
                        heading: headings[index],
                        subHeading: subheadings[index]
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .animation(.default, value: currentPage)
            VStack(spacing: 20) {
                Button(action: {
                    if currentPage < headings.count - 1 {
                        currentPage += 1
                    }
                    else {
                        hasViewedWalkthrough = true
                        dismiss()
                    }
                }) {
                    Text(currentPage == (headings.count - 1) ? "GET STARTED" : "NEXT")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 50)
                        .background(Color(.systemIndigo))
                        .cornerRadius(25)
                }
                
                if currentPage < headings.count-1 {
                    Button {
                        hasViewedWalkthrough = true
                        dismiss()
                    } label: {
                        Text("SKIP")
                            .font(.headline)
                            .foregroundColor(Color(.systemIndigo))
                    }
                }
            }
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
