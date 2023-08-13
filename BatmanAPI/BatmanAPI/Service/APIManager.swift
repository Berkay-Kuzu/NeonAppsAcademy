//
//  API Manager.swift
//  BatmanAPI
//
//  Created by Berkay Kuzu on 24.06.2023.
//

import Foundation

enum APIError: Error {
    case failedToGetData
}

class APIManager {
    
    static let shared = APIManager()
    
    
    func fetchUser(completion: @escaping(Result<User, Error>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).last {
                    completion(.success(user))
                } else {
                    completion(.failure(APIError.failedToGetData))
                }
            }
        }
        task.resume()
    }
}
