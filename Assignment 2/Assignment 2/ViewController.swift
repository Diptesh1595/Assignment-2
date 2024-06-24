//
//  ViewController.swift
//  Assignment 2
//
//  Created by user252703 on 6/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var conestogastore: UILabel!
    
    
    @IBOutlet weak var logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func monitorsbutton(_ sender: Any) {
        let alertController = UIAlertController(title: "Error", message: "No Monitors yet. Check back later", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    
    
    @IBAction func laptopsbutton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let laptopsVC = storyboard.instantiateViewController(withIdentifier: "LaptopsViewController") as? LaptopsViewController {
            navigationController?.pushViewController(laptopsVC, animated: true)
        }
    }

    
    
    class LaptopsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LaptopCell", for: indexPath)
            
            let laptop = laptops[indexPath.row]
            cell.textLabel?.text = laptop["name"] as? String
            cell.detailTextLabel?.text = laptop["price"] as? String
            
            
            cell.accessoryType = .disclosureIndicator
            cell.detailTextLabel?.textColor = .gray
            
            return cell
        }
    }

    
}
