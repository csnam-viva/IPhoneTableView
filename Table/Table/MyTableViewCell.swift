//
//  MyTableViewCell.swift
//  Table
//
//  Created by 비바 on 2022/12/09.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myCount: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
