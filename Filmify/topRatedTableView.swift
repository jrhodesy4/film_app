//
//  topRatedTableView.swift
//  Filmify
//
//  Created by Jordan Robert Rhodes on 5/26/17.
//  Copyright © 2017 Jordan Robert Rhodes. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class topRatedTableView: UITableViewController {
    
    var toprated = [NSDictionary]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Top Rated"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toprated.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topRatedCell") as! topRatedCell
        cell.titleLabel.text = toprated[indexPath.row]["title"] as? String
        cell.yearLabel.text = toprated[indexPath.row]["release_date"] as? String
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let newEvent = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: context) as! Movie
//        newEvent.title = toprated[indexPath.row]["title"] as? String
//        newEvent.releaseDate = toprated[indexPath.row]["release_date"] as? String
//        newEvent.synopsis = toprated[indexPath.row]["overview"] as? String
//        newEvent.posterPath = toprated[indexPath.row]["poster_path"] as? String
//        print("done")
//        if context.hasChanges {
//            do {
//                try context.save()
//                print("Saved changes to CoreData!")
//            } catch {
//                print("\(error)")
//            }
//        }
//        performSegue(withIdentifier: "topRatedSegue", sender: toprated[indexPath.row])
//    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenuController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Create UIAlertAction for UIAlertController
        
        let saveAction = UIAlertAction(title: "Add to WatchList", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            let newEvent = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: self.context) as! Movie
            newEvent.title = self.toprated[indexPath.row]["title"] as? String
            newEvent.releaseDate = self.toprated[indexPath.row]["release_date"] as? String
            newEvent.synopsis = self.toprated[indexPath.row]["overview"] as? String
            newEvent.posterPath = self.toprated[indexPath.row]["poster_path"] as? String
            print("done")
            if self.context.hasChanges {
                do {
                    try self.context.save()
                    print("Saved changes to CoreData!")
                } catch {
                    print("\(error)")
                }
            }
            self.performSegue(withIdentifier: "topRatedSegue", sender: self.toprated[indexPath.row])
            //            self.editButtonPressed(c: self.contacts[indexPath.row])
            
            print("File has been added to WatchList")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancel")
        })
        
        // Add UIAlertAction in UIAlertController
        
        
        optionMenuController.addAction(saveAction)
        optionMenuController.addAction(cancelAction)
        
        // Present UIAlertController with Action Sheet
        
        self.present(optionMenuController, animated: true, completion: nil)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    
    func callAPI() {
        let url = URL(string: "https:api.themoviedb.org/3/movie/top_rated?api_key=facdbd08fccf330c5cf404d4658087ae")
        Alamofire.request(url!, method: .get, parameters: nil, headers: nil) .responseJSON { response in
            
            if let jsonresult = response.result.value as? NSDictionary {
                //                print(jsonresult)
                if let resultarray = jsonresult["results"] as? NSArray {
                    //                    print(resultarray)
                    for result in resultarray {
                        let r = result as! NSDictionary
                        //                        print(r)
                        self.toprated.append(r)
                        
                        self.tableView.reloadData()
                    }
                    
                }
                
                
            }
            
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
