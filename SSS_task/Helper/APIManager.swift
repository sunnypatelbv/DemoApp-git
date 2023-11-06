//
//  APIManager.swift
//  SSS_task
//
//  Created by Sunny Patel on 12/10/23.
//

import UIKit

public typealias JSON = [String: Any]
public typealias HTTPHeaders = [String: String]

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
    
    
    //GET API function
    func fetchData <T: Codable> (pageUrl : String,
                                 httpHeaders: HTTPHeaders? = nil,
                                 dataModel : T.Type,
                                 completionHandler : @escaping (_ jsonData: T?, _ response: URLResponse?, _ error: Error?)->()){
        guard let url = URL(string: pageUrl) else {return}
        var request = URLRequest(url: url)
        
        
        request.allHTTPHeaderFields = httpHeaders
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
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
                completionHandler(jsonData, response, nil)
            }
            catch{
                completionHandler(nil,response,error)
            }
        }
        task.resume()
    }
    
    
    
    //POST API Function
    func postRequest<T: Codable>(url: String,
                                 body: JSON? = nil,
                                 httpHeaders: HTTPHeaders? = nil,
                                 type: T.Type,
                                 completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) {
        if let url = URL(string: url){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            if let httpHeader = httpHeaders{
                request.allHTTPHeaderFields = httpHeader
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            if let body = body {
                request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
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
                    print(jsonData)
                    completionHandler(jsonData,response,error)
                }
                catch{
                    completionHandler(nil,response,error)
                }
            }
            task.resume()
        }
    }
    
}
