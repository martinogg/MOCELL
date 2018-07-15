//
//  ViewController.swift
//  MOTableViewFun
//
//  Created by martin ogg on 14/07/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var cells:[String] = []
    var heights:[CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        for i in 1...25 {
            
            self.cells.append("Cell \(i)")
            self.heights.append(CGFloat(40 + arc4random() % 60))
        }
        
        self.tableView.register(UINib.init(nibName: "MOCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        if let parent = self.parent as? HomeViewController {
            
            parent.tableViewController = self;
        }
    }
    
    func addCellBtn() {
        
        self.cells.insert("Added Cell!", at: 0)
        self.heights.insert(CGFloat(60 + arc4random() % 60), at: 0)
        
        // Update Table Data
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [
            NSIndexPath(row: 0, section: 0) as IndexPath
            ], with: .automatic)
        self.tableView.endUpdates()
    }
    
    func removeCellBtn()
    {
        
        self.cells.remove(at: 0)
        self.heights.remove(at: 0)
        
        // Update Table Data
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [
            NSIndexPath(row: 0, section: 0) as IndexPath
            ], with: .automatic)
        self.tableView.endUpdates()
    }
}

extension ViewController { //UITableViewDelegate, UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //https://medium.com/@musawiralishah/creating-custom-uitableviewcell-using-nib-xib-files-in-xcode-9bee5824e722
        
        guard let result = tableView.dequeueReusableCell(withIdentifier: "cell") as? MOCell else {
            
            fatalError()
        }
        
        result.translatesAutoresizingMaskIntoConstraints = false
        result.mainLabel.text = self.cells[indexPath.row]
        //result.heightConstraint.isActive = false
        result.heightConstraint.constant = self.heights[indexPath.row]
        
        return result
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return UITableViewAutomaticDimension
    }
    
}


