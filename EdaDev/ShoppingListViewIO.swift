//
//  ShoppingListViewControllerIO.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

protocol ShoppingListViewInput: class {
    func setupInitialState()
    func reloadData()
}

protocol ShoppingListViewOutput {
    func viewIsReady()
    func viewIsAppear()
    
    func countProducts() -> Int
    func productForIndex(_ index: Int) -> Product
    
    func removeFromShoppingList(_ product: Product)
}
