//
//  WeatherCellTableViewCell.swift
//  Weather_HaNoi
//
//  Created by Nguyễn Đình Thành Long on 11/27/19.
//  Copyright © 2019 Nguyễn Đình Thành Long. All rights reserved.
//

import UIKit

class WeatherCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lbTemp: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
