//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by itsector on 03/10/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

import Foundation
import UIKit

struct PhotoInfoController {
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = [
            "api_key": "DEMO_KEY",
            "date": "2012-03-13"
        ]
        
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
//                 DispatchQueue.main.async {
                    completion(photoInfo)
//                }
            } else {
                print("Either no data was returned, or data was not properly decoded.")
                completion(nil)
            }
        }
        task.resume()
    }

}


