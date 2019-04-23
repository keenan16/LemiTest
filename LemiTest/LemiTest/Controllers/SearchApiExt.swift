//
//  SearchApiExt.swift
//  LemiTest
//
//  Created by Keenan Lania on 24/04/2019.
//  Copyright © 2019 Keenan Lania. All rights reserved.
//

import Foundation
import Alamofire

extension SearchViewController{
  
  func getIntialPlaces(){
    Alamofire.request(BASE_URL + URL_SEARCH, method: .get).validate().responseJSON { (response) in
      switch response.result {
        case .success:
          if let data = response.data {
            do {
              let places = try JSONDecoder().decode([Place].self, from:data)
              self.searchPlaces = places
            }catch {
              
            }
          }
        case .failure(let error):
        print(error)
      }
    }
  }
  
  func search(searchQuery:String){
    
    print(BASE_URL + URL_SEARCH + "?q=" + searchQuery)
    
    Alamofire.request(BASE_URL + URL_SEARCH + "?q=" + searchQuery, method: .get).validate().responseJSON { (response) in
      switch response.result {
      case .success:
        if let data = response.data {
          do {
            let places = try JSONDecoder().decode([Place].self, from:data)
            self.searchPlaces = places
          }catch {
            
          }
        }
      case .failure(let error):
        print(error)
      }
    }
  }
    

  
  
  
}

