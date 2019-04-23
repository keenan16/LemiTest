//
//  Place.swift
//  LemiTest
//
//  Created by Keenan Lania on 24/04/2019.
//  Copyright © 2019 Keenan Lania. All rights reserved.
//

import Foundation

struct Place: Decodable {
  let name :String?
  let subtitle :String?
  let country_code :String?
  let population :Int?
  let longitude : Double?
  let latitude: Double?
  let type: String?
  let id: String?
  let banner: String?
  let zoom : Int?
  let color: String?  
}
