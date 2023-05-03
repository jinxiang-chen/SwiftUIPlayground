//
//  MapView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/5/2.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.dismiss) private var dismiss
    var location: String = ""
    var interactionModes: MapInteractionModes = []
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 51.510357,
            longitude: -0.116773
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 1.0,
            longitudeDelta: 1.0
        )
    )
    @State private var place: AnnotatedItem = AnnotatedItem(coordinate: CLLocationCoordinate2D(
            latitude: 51.510357,
            longitude: -0.116773
    ))
    
    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: interactionModes,
            annotationItems: [place]) { place in
          
            MapMarker(coordinate: place.coordinate, tint: .red)
        
        }
            .task {
                convertAddress(location: location)
            }        
    }
    
    private func convertAddress(location: String) {
        // 取得目前位置
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location) { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let placemarks = placemarks,
                  let location = placemarks[0].location else {
                return
            }
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.0015,
                    longitudeDelta: 0.0015
                )
            )
            self.place = AnnotatedItem(coordinate: location.coordinate)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(
            location: "54 Frith Street London W1D 4SL United Kingdom"
        )
    }
}
