//
//  CartViewController.swift
//  ChocolateRx
//
//  Created by Diep Nguyen on 3/13/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

final class CartViewController: UIViewController {

    @IBOutlet private var checkoutButton: UIButton!
    @IBOutlet private var totalItemsLabel: UILabel!
    @IBOutlet private var totalCostLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Checkout"
        configureFromCart()
    }
    
    private func configureFromCart() {
        
        totalCostLabel.text = "\(ShoppingCart.shared.totalCost ?? 0)"
        totalItemsLabel.text = "\(ShoppingCart.shared.itemCountString)"
    }

    @IBAction private func actionReset(_ sender: UIButton) {
        
        ShoppingCart.shared.chocolates.value.removeAll()
        let _ = navigationController?.popViewController(animated: true)
    }
}
