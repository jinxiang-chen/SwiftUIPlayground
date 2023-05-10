//
//  Rating.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/5/10.
//

import Foundation

enum Rating: String, CaseIterable {
    
    case awesome = "awesome"
    case good = "good"
    case okay = "okay"
    case bad = "bad"
    case terrible = "terrible"
    
    var image: String {
        switch self {
            case .awesome: return "love"
            case .good: return "love"
            case .okay: return "love"
            case .bad: return "love"
            case .terrible: return "love"
        }
    }
    
}
