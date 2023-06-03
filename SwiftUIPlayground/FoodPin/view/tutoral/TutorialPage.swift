//
//  TutorialPage.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/6/3.
//

import SwiftUI

struct TutorialPage: View {
    let image: String
    let heading: String
    let subHeading: String
    
    var body: some View {
        VStack(spacing: 70) {
            Image(image)
                .resizable()
                .scaledToFit()
            VStack(spacing: 10) {
                Text(heading)
                    .font(.headline)
                Text(subHeading)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 40)
            Spacer()
        }
        .padding(.top)
        
    }
}

struct TutorialPage_Previews: PreviewProvider {
    static var previews: some View {
        TutorialPage(
            image: "onboarding-1",
            heading: "CREATE YOUR OWN FOOD GUILE",
            subHeading: "Pin your restaurants and create your own food guild"
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("TutorailPage")
    }
}
