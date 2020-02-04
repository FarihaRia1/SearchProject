//
//  ViewController.swift
//  MyNewProj
//
//  Created by apple on 2/4/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    var searcharray:[String] = ["Ria", "Shishir", "Afreen", "Murad", "Tondra"]
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    var searching = false
    var mysearch = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching{
            return mysearch.count
        }else
        {
        return searcharray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.accessoryType = .disclosureIndicator
        
        if searching{
            cell?.textLabel?.text = mysearch[indexPath.row]
        }else {
        cell?.textLabel?.text = searcharray[indexPath.row]
        }
        
        
        return cell!
    }    // Do any additional setup after loading the view.
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        mysearch = searcharray.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
    searching = true
        tableview.reloadData()
    
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableview.reloadData()
    }
}


