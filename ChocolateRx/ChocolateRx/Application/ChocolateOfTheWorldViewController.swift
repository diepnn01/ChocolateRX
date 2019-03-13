//
//  ChocolateOfTheWorldViewController.swift
//  ChocolateRx
//
//  Created by Diep Nguyen on 3/13/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ChocolateOfTheWorldViewController: UIViewController {

    @IBOutlet private weak var cartButton: UIBarButtonItem!
    @IBOutlet private weak var tableView: UITableView!
    
    let europeanChocolates = Observable.just(Chocolate.ofEurope)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewCell()
        setupTapHandling()
        setupCartObserver()
    }
    
    private func setupTableViewCell() {
        europeanChocolates.bind(to: tableView
            .rx
            .items(cellIdentifier: ChocolateTableViewCell.Identifier, cellType: ChocolateTableViewCell.self)) { row, chocolate, cell in
                cell.configureWithChocolate(chocolate: chocolate)
                
        }
        .disposed(by: disposeBag)
    }
    
    private func setupTapHandling() {
        
        tableView
        .rx
        .modelSelected(Chocolate.self)
            .subscribe(onNext: { (model: Chocolate) in
                ShoppingCart.shared.chocolates.value.append(model)
            })
        .disposed(by: disposeBag)
    }
    
    private func setupCartObserver() {
        
        ShoppingCart.shared.chocolates.asObservable()
            .subscribe(onNext: { (chocolates: [Chocolate]) in
                self.cartButton.title = "\(chocolates.count) 🍫"
            })
            .disposed(by: disposeBag)
    }
}
