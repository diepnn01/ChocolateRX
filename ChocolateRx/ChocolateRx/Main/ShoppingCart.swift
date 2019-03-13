//
//  ShopingCart.swift
//  ChocolateRx
//
//  Created by Diep Nguyen on 3/13/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import Foundation
import RxSwift

final class ShoppingCart {
    
    static let shared = ShoppingCart()
    
    let chocolates: Variable<[Chocolate]> = Variable([])
    
    var totalCost: Float? {
        
        return chocolates.value.reduce(0) { templeTotal, chocolate in
            return templeTotal + chocolate.priceInDollars
        }
    }
    
    var itemCountString: String {
        guard chocolates.value.count > 0 else {
            return "🚫🍫"
        }
        
        let setOfChocolate = Set<Chocolate>(chocolates.value)
        
        let itemString = setOfChocolate.map { (model: Chocolate) -> String in
            
            let count: Int = chocolates.value.reduce(0) {
                templeTotal, reduceChocolate in
                if reduceChocolate == model {
                    return templeTotal + 1
                }
                
                return templeTotal
            }
            return "\(model.countryFlagEmoji)🍫: \(count)"
        }
        
        return itemString.joined(separator: "\n")
    }
}
