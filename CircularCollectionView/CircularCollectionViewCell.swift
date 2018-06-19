//
//  CircularCollectionViewCell.swift
//  CircularCollectionView
//
//  Created by Rounak Jain on 10/05/15.
//  Copyright (c) 2015 Rounak Jain. All rights reserved.
//

import UIKit

class CircularCollectionViewCell: UICollectionViewCell {
  
  var imageName: String = "" {
    didSet {
      imageView!.image = UIImage(named: imageName)
    }
  }
  
  @IBOutlet weak var imageView: UIImageView?
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    contentView.layer.cornerRadius = 5
    contentView.layer.borderColor = UIColor.black.cgColor
    contentView.layer.borderWidth = 1
    contentView.layer.shouldRasterize = true
    contentView.layer.rasterizationScale = UIScreen.main.scale
    contentView.clipsToBounds = true
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    imageView!.contentMode = .scaleAspectFill
  }
  
  override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
    super.apply(layoutAttributes)
    let circularLayoutAttributes = layoutAttributes as! CircularCollectionViewLayoutAttributes
    self.layer.anchorPoint = circularLayoutAttributes.anchorPoint
    self.center.y += (circularLayoutAttributes.anchorPoint.y - 0.5) * self.bounds.height
  }
  
}
