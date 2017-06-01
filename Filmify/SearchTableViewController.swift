//
//  SearchTableViewController.swift
//  Filmify
//
//  Created by Jordan Robert Rhodes on 5/30/17.
//  Copyright © 2017 Jordan Robert Rhodes. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    
    @IBAction func searchTextField(_ sender: UITextField) {
        if searchTextField.text == nil || searchTextField.text == "" {
            view.endEditing(true)
            self.results.removeAll()
            tableView.reloadData()
        }
        else {
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=facdbd08fccf330c5cf404d4658087ae&language=en-US&query=\(String(describing: searchTextField.text))&page=1&include_adult=false")
            Alamofire.request(url!, method: .get, parameters: nil, headers: nil) .responseJSON { response in
                
                if let jsonresult = response.result.value as? NSDictionary {
                    //                print(jsonresult)
                    if let resultarray = jsonresult["results"] as? NSArray {
                        //                    print(resultarray)
                        for result in resultarray {
                            let r = result as! NSDictionary
                            //                        print(r)
                            
                            self.tableView.reloadData()
                            self.results.append(r as! film)
                            for film in self.results {
                                film.title = String(describing: r["title"]!)
                                film.releaseDate = String(describing: r["release_date"]!)
                                film.synopsis = String(describing: r["overview"]!)
                            }
                            
                            
                            self.tableView.reloadData()
                        }
                        
                    }
                    
                    
                }
                
            }
            
            
            
        }
        
        tableView.reloadData()

        
    }
    
    var results = [film]()
//    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBar.delegate = self
//        searchBarTextDidEndEditing(searchBar)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
        
    }
    
    
    
//    editing changed, make a custom class and store the properties in the class when you init
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell") as! searchCellTableViewCell
        cell.titleLabel.text = results[indexPath.row].title
        cell.yearLabel.text = results[indexPath.row].releaseDate
        return cell
    }
    
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text == nil || searchBar.text == "" {
//            view.endEditing(true)
//            self.results.removeAll()
//            tableView.reloadData()
//        }
//        else {
//            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=facdbd08fccf330c5cf404d4658087ae&language=en-US&query=\(String(describing: searchBar.text!))&page=1&include_adult=false")
//            Alamofire.request(url!, method: .get, parameters: nil, headers: nil) .responseJSON { response in
//                
//                if let jsonresult = response.result.value as? NSDictionary {
//                    //                print(jsonresult)
//                    if let resultarray = jsonresult["results"] as? NSArray {
//                        //                    print(resultarray)
//                        for result in resultarray {
//                            let r = result as! NSDictionary
//                            //                        print(r)
//                            
//                            self.tableView.reloadData()
//                            self.results.append(r as! film)
//                            for film in self.results {
//                                film.title = String(describing: r["title"]!)
//                                film.releaseDate = String(describing: r["release_date"]!)
//                                film.synopsis = String(describing: r["overview"]!)
//                            }
//                            
//                            
//                            self.tableView.reloadData()
//                        }
//                        
//                    }
//                    
//                    
//                }
//                
//            }
//            
//            
//            
//        }
//        
//        tableView.reloadData()
//    }
//
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        if searchBar.text == nil || searchBar.text == "" {
//            isSearching = false
//            view.endEditing(true)
//            self.results.removeAll()
//            tableView.reloadData()
//        }
//        else {
//            isSearching = true
//            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=facdbd08fccf330c5cf404d4658087ae&language=en-US&query=\(String(describing: searchBar.text!))&page=1&include_adult=false")
//            Alamofire.request(url!, method: .get, parameters: nil, headers: nil) .responseJSON { response in
//                
//                if let jsonresult = response.result.value as? NSDictionary {
//                    //                print(jsonresult)
//                    if let resultarray = jsonresult["results"] as? NSArray {
//                        //                    print(resultarray)
//                        for result in resultarray {
//                            let r = result as! NSDictionary
//                            //                        print(r)
//                            self.results.append(r)
//                            
//                            self.tableView.reloadData()
//                        }
//                        
//                    }
//                    
//                    
//                }
//                
//            }
//            
//            
//            
//        }
//        
//        tableView.reloadData()
//    }
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        if isSearching == false{
//            results.removeAll()
//            tableView.reloadData()
//            
//        }
//    }
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        self.results.removeAll()
//        self.tableView.reloadData()
//        
//    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text == nil || searchBar.text == "" {
//            isSearching = false
//            view.endEditing(true)
//            tableView.reloadData()
//        }
//        else {
//            isSearching = true
//            let url = URL(string: "https://api.themoviedb.org/3/search/multi?api_key=facdbd08fccf330c5cf404d4658087ae&language=en-US&query=\(String(describing: searchBar.text!))&page=1&include_adult=false")
//            Alamofire.request(url!, method: .get, parameters: nil, headers: nil) .responseJSON { response in
//                
//                if let jsonresult = response.result.value as? NSDictionary {
//                    //                print(jsonresult)
//                    if let resultarray = jsonresult["results"] as? NSArray {
//                        //                    print(resultarray)
//                        for result in resultarray {
//                            let r = result as! NSDictionary
//                            //                        print(r)
//                            self.results.append(r)
//                            
//                            self.tableView.reloadData()
//                        }
//                        
//                    }
//                    
//                    
//                }
//                
//            }
//
//            
//            
//        }
//        
//        tableView.reloadData()
//    }

    
    
    
}
