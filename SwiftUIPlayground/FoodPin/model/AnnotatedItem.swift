//
//  AnnotatedItem.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/5/2.
//

import Foundation
import CoreLocation

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}
