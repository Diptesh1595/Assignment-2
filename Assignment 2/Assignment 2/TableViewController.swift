//
//  TableViewController.swift
//  Assignment 2
//
//  Created by user252703 on 6/23/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var laptops: [[String: Any]] = [
        ["name": "HP ", "price": "$1100", "Storage": "512 GB"],
        ["name": "Dell ", "price": "$1300", "Storage": "512 GB"],
        ["name": "Asus", "price": "$1400", "Storage": "512 GB"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Laptops"
        
        
        
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = addButton
        
        // Setup table view
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    
    
    @objc func addTapped() {
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laptops.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        
        let laptop = laptops[indexPath.row]
        cell.price.text = laptop["price"] as? String
        cell.name.text = laptop["name"] as? String
        cell.additionalinformation.text = laptop["Storage"] as? String
        
        return cell
    }
    
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


