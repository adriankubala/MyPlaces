//
//  CLLocationCoordinate2D+Address.swift
//  MyPlaces
//
//  Created by Adrian Kubała on 07.04.2017.
//  Copyright © 2017 Adrian Kubała. All rights reserved.
//

import GoogleMaps

extension CLLocationCoordinate2D {
  
  func formattedAddress(completion: @escaping (String?) -> ()) {
    DispatchQueue.main.async {
      let geocoder = GMSGeocoder()
      geocoder.reverseGeocodeCoordinate(self) { (response, error) in
        let result = response?.results()?.first
        let address = result?.lines?.reduce("") { $0 == "" ? $1 : $0 + ", " + $1 }
        completion(address)
      }
    }
  }
  
}
