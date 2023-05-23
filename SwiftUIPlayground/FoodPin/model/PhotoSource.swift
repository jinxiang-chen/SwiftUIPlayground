//
//  PhotoSource.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/5/17.
//

import Foundation

enum PhotoSource: Identifiable {
    case photoLibrary
    case camera
    var id: Int {
        hashValue
    }
}
