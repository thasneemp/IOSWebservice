//
//  ViewController.swift
//  IOSWebservice
//
//  Created by Muhammed Thasneem on 18/07/17.
//  Copyright © 2017 Muhammed Thasneem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var itemTableView: UITableView!
    
    var items = [Contacts] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "ItemTableView", for: indexPath) as? ItemTableViewCell else {
            fatalError("error")
        }
        
        cell.nameLabel.text = self.items[indexPath.row].name
        cell.emailLabel.text = self.items[indexPath.row].email
        cell.gender.text = self.items[indexPath.row].gender
        cell.phone.text = self.items[indexPath.row].phone?.mobile
        
        return cell
    }
    func loadData() {
        let urlRe = URL(string: "https://api.androidhive.info/contacts/")
        let url = URLRequest(url: urlRe!)
        WebserviceApi().loadItems(url: url) { (result) in
        
            self.items = result.contacts!
            
            self.itemTableView.reloadData()
        }
    }
}

