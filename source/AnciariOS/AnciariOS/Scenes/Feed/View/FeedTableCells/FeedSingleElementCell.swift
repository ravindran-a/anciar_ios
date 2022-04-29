//
//  FeedSingleElementCell.swift
//  AnciariOS
//
//  Created by Ravindran on 29/04/22.
//

import UIKit

class FeedSingleElementCell: UITableViewCell {

    static let cellIdentifier: String = "FeedSingleElementCell"
    
    @IBOutlet weak var feedImageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.feedImageview.image = nil
    }
    
    func setImage(imagePath: String) {
        self.feedImageview.imageWithURL(imagePath)
    }
    
}
