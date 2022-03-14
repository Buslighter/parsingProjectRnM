//
//  RickNMortyCell.swift
//  hw12(Parsing)
//
//  Created by gleba on 24.01.2022.
//

import UIKit

class RickNMortyCell: UITableViewCell {
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var CharStatusText: UILabel!
    @IBOutlet weak var StatusIndicator: UIView!
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var lastKnowLoc: UILabel!
    @IBOutlet weak var PictureOfChar: UIImageView!
    
    override func awakeFromNib() {
        StatusIndicator.layer.cornerRadius = StatusIndicator.frame.size.width/2
        StatusIndicator.clipsToBounds = true
        PictureOfChar.layer.cornerRadius = 3
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
