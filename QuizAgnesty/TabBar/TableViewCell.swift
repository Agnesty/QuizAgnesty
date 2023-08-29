//
//  TableViewCell.swift
//  QuizAgnesty
//
//  Created by Agnes Triselia Yudia on 10/08/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
