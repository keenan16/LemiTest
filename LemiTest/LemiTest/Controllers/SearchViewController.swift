//
//  SearchViewController.swift
//  LemiTest
//
//  Created by Keenan Lania on 23/04/2019.
//  Copyright © 2019 Keenan Lania. All rights reserved.
//

import UIKit

typealias SearchViewControllerCompletionHandler = (_ place : Place) -> ()

class SearchViewController: UIViewController {

  @IBOutlet weak var searchTbl: UITableView!
  @IBOutlet weak var searchTxtF: UITextField!
  
  var searchPlaces = [Place]() {
    didSet{
      searchTbl.reloadData()
    }
  }
  private var previousRun = Date()
  private let minInterval = 0.05
  fileprivate var searchViewControllerCompletionHandler : SearchViewControllerCompletionHandler?
  
  public func requestForPlace(completionHandler:@escaping SearchViewControllerCompletionHandler){
    searchViewControllerCompletionHandler = completionHandler
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.searchTxtF.delegate = self
    self.searchTbl.delegate = self
    self.searchTbl.dataSource = self
    self.searchTbl.estimatedRowHeight = 60
    self.searchTbl.rowHeight = UITableViewAutomaticDimension
    self.searchTbl.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceTableViewCell")
    self.getIntialPlaces()
        // Do any additional setup after loading the view.
  }
    
  @IBAction func backDidTap(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }

}

extension SearchViewController: UITableViewDelegate,UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchPlaces.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as! PlaceTableViewCell
    cell.configure(place: searchPlaces[indexPath.row])
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.dismiss(animated: true, completion: nil)
    searchViewControllerCompletionHandler?(searchPlaces[indexPath.row])
  }
   
}

extension SearchViewController:UITextFieldDelegate{
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
    searchPlaces.removeAll()
    
    if textField.text?.count ?? 0 > 0 {
      if Date().timeIntervalSince(previousRun) > minInterval {
        previousRun = Date()
        search(searchQuery: textField.text ?? "")
      }
    }
    return true
  
    }
  
}
