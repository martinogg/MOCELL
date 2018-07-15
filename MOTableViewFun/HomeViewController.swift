//
//  HomeViewController.swift
//  MOTableViewFun
//
//  Created by martin ogg on 15/07/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tableViewController: ViewController?
    
    @IBAction func addCellBtn(_ sender: Any) {
        
        self.tableViewController?.addCellBtn()
    }
    
    @IBAction func removeCellBtn(_ sender: Any) {
        
        self.tableViewController?.removeCellBtn()
    }
    
}
