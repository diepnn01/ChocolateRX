//
//  ChocolateTableViewCell.swift
//  ChocolateRx
//
//  Created by Diep Nguyen on 3/13/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

final class ChocolateTableViewCell: UITableViewCell {

    static let Identifier = "ChocolateCell"
    
    @IBOutlet private var countryNameLabel: UILabel!
    @IBOutlet private var emojiLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    
    func configureWithChocolate(chocolate: Chocolate) {
        countryNameLabel.text = chocolate.countryName
        emojiLabel.text = "🍫" + chocolate.countryFlagEmoji
        priceLabel.text = CurrencyFormatter.dollarsFormatter.rw_string(from: chocolate.priceInDollars)
    }
}
