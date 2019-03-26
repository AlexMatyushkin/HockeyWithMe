//
//  GetJSONClass.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 11/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
class GetJSON: GetJSONPRotocol{
    var urlResourse: String{
        return "https://statsapi.web.nhl.com/api/v1/schedule"
    }
    func getJson(dates: UserDates?, completion: @escaping (GameResults?,Error?) -> ()) {
        guard var url = URL(string: "loch") else {return}
        if let dates = dates{
          let urlString = ("\(urlResourse) + ?startDate=\(dates.startDate) + &endDate=\(dates.endDate)")
            url = URL(string: urlString)!
        }else{
            url = URL(string: urlResourse)!
        }
        print(url)
            URLSession.shared.dataTask(with: url, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
              do{
                if let data = data{
                    let containerForParsing = try JSONDecoder().decode(GameResults.self, from: data)
                    completion(containerForParsing, nil)
                }
                if let error = error{
                    print("error while getting data")
                    completion(nil, error)
                }
              }catch let catchError{
                print(catchError)
                print("fdfdfdfd")
              }
                }).resume()
    }
}
