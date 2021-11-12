//
//  APIClient.swift
//  MoviesApp
//
//  Created by 정태훈 on 2021/10/10.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation
import Alamofire
import Combine

class APIClient {
    static let agent = Agent()
    static let base = "http://www.omdbapi.com/"
    
    /*static func getMovies(search: String) -> AnyPublisher<MovieResponse, APIError> {
     
     var urlComps = URLComponents(string: APIClient.base)!
     urlComps.queryItems = [
     URLQueryItem(name: "s", value: search),
     URLQueryItem(name: "apikey", value: Constants.API_KEY)
     
     ]
     
     print(urlComps.url!)
     
     let request = AF.request(urlComps.url!)
     return APIClient.agent.run(request)
     .map(\.value)
     .print()
     .eraseToAnyPublisher()
     
     
     }*/
}
