//
//  WebService.swift
//  IOSWebservice
//
//  Created by Muhammed Thasneem on 18/07/17.
//  Copyright © 2017 Muhammed Thasneem. All rights reserved.
//

import Foundation

class WebserviceApi {
    func loadItems(url : URLRequest, onResult : @escaping (Json4Swift_Base) -> Void ){
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        DispatchQueue.main.async {
                            DispatchQueue.main.async {
                            onResult(Json4Swift_Base(error: error.localizedDescription)!)
                        }                        }
                        }else{
                            if let data = data {
                                do {
                                    let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                                    onResult(Json4Swift_Base(dictionary: dictionary! as NSDictionary)!)
                                    
                                } catch let error {
                                    DispatchQueue.main.async {
                                        onResult(Json4Swift_Base(error: error.localizedDescription)!)
                                    }
                                }
                            }
                        }
                    }.resume()
        }
    }


