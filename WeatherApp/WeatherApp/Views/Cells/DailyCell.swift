//
//  DailyCell.swift
//  WeatherApp
//
//  Created by Umesh Dhuri on 17/02/22.
//

import UIKit

class DailyCell: UITableViewCell {
    
    @IBOutlet weak var dateLbl : UILabel!
    @IBOutlet weak var mainWeather : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
