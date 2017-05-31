//
//  ViewController.swift
//  Filmify
//
//  Created by Jordan Robert Rhodes on 5/26/17.
//  Copyright © 2017 Jordan Robert Rhodes. All rights reserved.
//

import UIKit
import Alamofire

class InitialViewController: UITableViewController, UISearchBarDelegate, addMovieDelegate {
    
    var movies = [NSDictionary]()
    
    var searchResults = [NSDictionary]()
    
    var isSearching = false

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        self.tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callAPI() {
        let url = URL(string: "https:api.themoviedb.org/3/movie/now_playing?api_key=facdbd08fccf330c5cf404d4658087ae")
        Alamofire.request(url!, method: .get, parameters: nil, headers: nil) .responseJSON { response in
            
            if let jsonresult = response.result.value as? NSDictionary {
//                print(jsonresult)
                if let resultarray = jsonresult["results"] as? NSArray {
//                    print(resultarray)
                    for result in resultarray {
                        let r = result as! NSDictionary
//                        print(r)
                        self.movies.append(r)
                        
                        self.tableView.reloadData()
                    }
                    
                }
            
                
            }
            
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isSearching) {
            return searchResults.count
        }
        else {
            return movies.count
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MyCustomCell
        if (isSearching) {
            cell.titleLabel.text = searchResults[indexPath.row]["title"] as? String
            
            return cell
        }
        else {
            cell.titleLabel.text = movies[indexPath.row]["title"] as? String
            
            return cell
        }

    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let movie = movies[indexPath.row]
//        
//    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let movie = movies[indexPath.row]
        performSegue(withIdentifier: "movieSegue", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movie = sender as? NSDictionary
        let destinationcongtroller = segue.destination as? MovieSpecViewController
        destinationcongtroller?.somemovie = movie
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        }
        else {
            isSearching = true
            searchResults = movies.filter { fnote in
                return (fnote["title"]! as AnyObject).contains(searchText)}
            tableView.reloadData()
            
            
        }
        
        tableView.reloadData()
    }
    func plusButtonPressed() {
        
    }


}
