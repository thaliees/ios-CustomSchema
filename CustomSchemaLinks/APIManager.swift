//
//  APIManager.swift
//  UniversalLinks
//
//  Created by Thaliees on 4/15/20.
//  Copyright © 2020 Thaliees. All rights reserved.
//

import Foundation

class APIManager: NSObject {
    static let sharedInstance = APIManager()
    private let baseURL = "https://api-mobile-wineupp.herokuapp.com/api"
    private var urlSession:URLSession = {
        let config:URLSessionConfiguration = .default
        config.waitsForConnectivity = false
        config.allowsCellularAccess = true
        config.timeoutIntervalForRequest = 20
        return URLSession(configuration: config)
    }()
    
    // MARK: -PRODUCTS SECTION
    func getProducts(page: Int, onSuccess: @escaping (ItemModel) -> Void, onFailure: @escaping (String) -> Void) {
        let url = baseURL + "/guest/wines?page=1&limit=5"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = urlSession.dataTask(with: request as URLRequest, completionHandler: { data, response, error -> Void in
            if error != nil {
                onFailure(error!.localizedDescription)
            }
            else {
                let statusResponse = response as! HTTPURLResponse
                
                do {
                    if statusResponse.statusCode == 200 {
                        let result = try JSONDecoder().decode(ItemModel.self, from: data!)
                        onSuccess(result)
                    }
                    else {
                        let result = try JSONDecoder().decode(ErrorModel.self, from: data!)
                        onFailure(result.message)
                    }
                } catch let error {
                    onFailure(error.localizedDescription)
                }
            }
        })
        
        task.resume()
    }
    
    func getProductDetails(idWine: String, onSuccess: @escaping (Product) -> Void, onFailure: @escaping (String) -> Void) {
        let url = baseURL + "/guest/wines" + "/\(idWine)"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = urlSession.dataTask(with: request as URLRequest, completionHandler: { data, response, error -> Void in
            if error != nil {
                onFailure(error!.localizedDescription)
            }
            else {
                let statusResponse = response as! HTTPURLResponse
                
                do {
                    if statusResponse.statusCode == 200 {
                        let result = try JSONDecoder().decode(Product.self, from: data!)
                        onSuccess(result)
                    }
                    else {
                        let result = try JSONDecoder().decode(ErrorModel.self, from: data!)
                        onFailure(result.message)
                    }
                } catch let error {
                    onFailure(error.localizedDescription)
                }
            }
        })
        
        task.resume()
    }
    
}
