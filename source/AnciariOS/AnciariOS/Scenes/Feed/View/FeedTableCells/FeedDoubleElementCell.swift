//
//  FeedDoubleElementCell.swift
//  AnciariOS
//
//  Created by Ravindran on 29/04/22.
//

import UIKit

class FeedDoubleElementCell: UITableViewCell {

    static let cellIdentifier: String = "FeedDoubleElementCell"
    
    @IBOutlet weak var feedLeftImageview: UIImageView!
    @IBOutlet weak var feedRightImageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.feedLeftImageview.image = nil
        self.feedRightImageview.image = nil
    }
    
    func setLeftImage(imagePath: String) {
        self.feedLeftImageview.imageWithURL(imagePath)
    }
    
    func setRightImage(imagePath: String) {
        self.feedRightImageview.imageWithURL(imagePath)
    }
    
}
