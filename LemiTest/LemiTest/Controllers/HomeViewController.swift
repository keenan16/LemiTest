//
//  HomeViewController.swift
//  LemiTest
//
//  Created by Keenan Lania on 23/04/2019.
//  Copyright © 2019 Keenan Lania. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var selectedPlaceLbl: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func locationDidTap(_ sender: Any) {
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    let searchViewController = storyBoard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
    searchViewController.modalPresentationStyle = .overFullScreen
    present(searchViewController, animated: true, completion:nil)
    
    searchViewController.requestForPlace { (place) in
      self.selectedPlaceLbl.text = "Youc selected :\(place.name ?? "No name")"
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

}
