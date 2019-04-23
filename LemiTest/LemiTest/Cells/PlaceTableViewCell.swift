//
//  PlaceTableViewCell.swift
//  LemiTest
//
//  Created by Keenan Lania on 24/04/2019.
//  Copyright © 2019 Keenan Lania. All rights reserved.
//

import UIKit
import Kingfisher

class PlaceTableViewCell: UITableViewCell {
  
  @IBOutlet weak var placeIconHolderView: UIView!
  @IBOutlet weak var placeImg: UIImageView!
  @IBOutlet weak var placeInitalsLbl: UILabel!
  @IBOutlet weak var placeNameLbl: UILabel!
  @IBOutlet weak var placeSubTitleLbl: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      self.placeIconHolderView.clipsToBounds = true
      self.placeIconHolderView.layer.cornerRadius =  self.placeIconHolderView.frame.width / 2
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func configure(place:Place){
    placeNameLbl.text = place.name ?? "N/A"
    
    if place.subtitle?.count ?? 0 <= 0 {
      placeSubTitleLbl.text = "N/A"
    }else{
      placeSubTitleLbl.text = place.subtitle ?? "N/A"
    }
    
    if let banner = place.banner {
      
      placeImg.isHidden = false
      placeInitalsLbl.isHidden = true
      
      let placeImageUrl = URL(string: banner)
      placeImg.kf.setImage(with: placeImageUrl, placeholder: nil)
      
      
    }else{
      
      placeImg.isHidden = true
      placeInitalsLbl.isHidden = false
      
      if let abbrv = place.name?.prefix(3){
        placeInitalsLbl.text = String(abbrv)
      }
      
      placeIconHolderView.backgroundColor = UIColor(hexString: place.color ?? "#bdbdbd")
      
    }
    
  }
    
}
