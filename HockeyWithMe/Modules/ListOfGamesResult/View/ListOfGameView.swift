//
//  ListOfGameView.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 21/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import UIKit

class ListOfGameView: UIView, ListOfGameResultsViewProtocol {
    
    @IBOutlet weak var listOfGameResultsTableView: UITableView?
    
    func viewLayout(){
        self.backgroundColor = UIColor(patternImage: UIImage(named: "nyu-dzhersi-devilz-new-jersey")!)
        self.contentMode = .center
        self.listOfGameResultsTableView?.backgroundColor = UIColor.clear
    }
}
