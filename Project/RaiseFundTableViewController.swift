//
//  RaiseFundTableViewController.swift
//  SpiritBond
//
//  Created by Fung Ying Hei on 31/7/2020.
//  Copyright © 2020 茂木匠. All rights reserved.
//

import UIKit
import Firebase

class RaiseFundTableViewController: UITableViewController {
    
    var detailData: RaiseFundInfo?
    var raiseFundDatas = [RaiseFundInfo]()
    let defaultURL = "https://firebasestorage.googleapis.com/v0/b/find-cafe-8c443.appspot.com/o/804341E1-77D3-4E25-9372-781D06A7E8A3.jpg?alt=media&token=cb023511-760f-45f7-8665-5b8dd0f4c2fc"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(red: 229 / 255, green: 216 / 255, blue: 191 / 255, alpha: 1)
        tableView.separatorStyle = .none

        
        loadRaiseFundData()
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return raiseFundDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "raiseFundCell", for: indexPath) as!
            RaiseFundTableViewCell
        cell.raiseFundTitleLabel.text = raiseFundDatas[indexPath.row].title
        cell.raiseFundStockLabel.text = raiseFundDatas[indexPath.row].stock
        if let image = raiseFundDatas[indexPath.row].image {
            cell.raiseFundImageView.image = UIImage(data: image)
        }
        
        cell.backgroundColor = UIColor(red: 229 / 255, green: 216 / 255, blue: 191 / 255, alpha: 1)
        return cell
    }
    
    @IBAction func unwinToNewRaiseFundTableView(segue: UIStoryboardSegue) {
        
    }
    
    func loadRaiseFundData() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRaiseFundDetail" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationVC = segue.destination as!
                    RaiseFundTableViewController
                destinationVC.detailData = raiseFundDatas[indexPath.row]
                print(raiseFundDatas)
            }
        }
    }
    
}
    
    
