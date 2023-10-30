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



final class APIManager{
    
    static let shared = APIManager()
    private init() {}
    
    func fetchData<T: Decodable>(pageUrl : String,dataModel : T.Type,completionHandler : @escaping (_ jsonData: T?, _ error: Error?)->()){
        if let url = URL(string : pageUrl){
            let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard let data = data else{
                    if error == nil{
                        print("unknown error")
                    }
                    return
                }
                let httpResponse = (response as! HTTPURLResponse)
                guard (200...299) ~= httpResponse.statusCode else{
                    print("StatusCode \(httpResponse.statusCode)")
                    return
                }
                do{
                    let jsonData = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(jsonData,nil)
                }
                catch{
                    completionHandler(nil,error)
                }
            }
            task.resume()
        }
    }
}
