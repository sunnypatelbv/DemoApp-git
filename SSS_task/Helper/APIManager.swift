//
//  APIManager.swift
//  SSS_task
//
//  Created by Sunny Patel on 12/10/23.
//

import UIKit

//Singleton Design Pattern

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler = (Result<ProductInformationModel, DataError>) -> Void

final class APIManager{
    
    static let shared = APIManager()
    private init() {}
    
    func fetchProducts(completion: @escaping Handler  ){
        guard let url = URL(string: Constant.API.plpAPI) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let products = try JSONDecoder().decode(ProductInformationModel.self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.network(error)))
            }
        }.resume()
        
        
    }
}
