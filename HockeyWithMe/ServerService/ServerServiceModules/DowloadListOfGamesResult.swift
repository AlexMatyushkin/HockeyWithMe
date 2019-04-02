//
//  GetJSONClass.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 11/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
class DowloadListOfGamesResult: DownoloadGamesResult{
    var urlResourse: String{
        return "https://statsapi.web.nhl.com/api/v1/schedule"
    }
    func downloadGamesResult(dates: UserDates?, date: String?, completion: @escaping (GameResults?,Error?) -> ()) {
        guard var url = URL(string: "loch") else {return}
        if let dates = dates{
          let urlString = ("\(urlResourse)?startDate=\(dates.startDate)&endDate=\(dates.endDate)")
            url = URL(string: urlString)!
        }else if let date = date{
            let urlString = ("\(urlResourse)?date=\(date)")
            url = URL(string: urlString)! // GUARD
        }else{
            url = URL(string: urlResourse)!
        }
            URLSession.shared.dataTask(with: url, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
              do{
                if let data = data{
                    let containerForParsing = try JSONDecoder().decode(GameResults.self, from: data)
                    completion(containerForParsing, nil)
                }
                if let error = error{
                    completion(nil, error)
                }
              }catch let catchError{
                print(catchError)
              }
                }).resume()
    }
}
