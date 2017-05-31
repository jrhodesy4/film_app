//
//  MovieSpecViewController.swift
//  Filmify
//
//  Created by Jordan Robert Rhodes on 5/26/17.
//  Copyright © 2017 Jordan Robert Rhodes. All rights reserved.
//

import UIKit
import Alamofire

class MovieSpecViewController: UIViewController {
    
    var somemovie: NSDictionary!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var release_dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = somemovie["title"] as? String
        let rating = String(describing: somemovie["popularity"]!)
        ratingLabel.text = "\(rating) /100"
        print(somemovie["popularity"]!)
        synopsisLabel.text = somemovie["overview"] as? String
        release_dateLabel.text = somemovie["release_date"] as? String
        synopsisLabel.sizeToFit()
        titleLabel.sizeToFit()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
