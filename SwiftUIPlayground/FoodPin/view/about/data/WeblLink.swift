//
//  WeblLink.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/6/6.
//

import Foundation

enum WebLink: String, Identifiable {
    
    case rateUs = "https://www.apple.com/ios/app-store"
    case feedback = "https://www.apple.com/contact"
    case twitter = "https://www.twitter.com/appcodamobile"
    case facebook = "https://www.facebook.com/appcodamobile"
    case instagram = "https://www.instagram.com/appcodadotcom"
    
    var id: UUID {
        UUID()
    }
}
