//
//  Services.swift
//  AlexApps Demo
//
//  Created by Ali Mohamed on 8/13/20.
//  Copyright © 2020 Ali Mohamed. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchData(completion: @escaping(Movies? , Error?)-> Void){
        let stringUrl = "https://api.nytimes.com/svc/movies/v2/reviews/picks.json?api-key=ZxYFRV0QdbGcFt1t2fEbCXCJU0bflnTF"
        
        guard let url = URL(string: stringUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error",error.localizedDescription)
                completion(nil,error)
                return
            }
            
            guard let data = data else {return}
            do {
                let movies = try JSONDecoder().decode(Movies.self ,from: data)
                DispatchQueue.main.async {
                    completion(movies,nil)
                }
            } catch let jsonError{
                print("Failed to decode :", jsonError)
                completion(nil,jsonError)
            }
        }.resume()
    }
}
