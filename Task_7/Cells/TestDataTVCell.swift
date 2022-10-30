//
//  TestDataTVCell.swift
//  Task_7
//
//  Created by Yevhenii M on 30.10.2022.
//

import UIKit

class TestDataTVCell: UITableViewCell {
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var dateTimeLable: UILabel!
    
    var userName = ""
    var email = ""
    var dateTime = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        userNameLable.text = userName
        emailLable.text = email
        dateTimeLable.text = dateTime
    }
    
}
