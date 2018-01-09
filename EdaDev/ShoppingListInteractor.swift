//
//  ShoppingList.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

import UIKit

class ShoppingListInteractor: ShoppingListInteractorInput {

    var output: ShoppingListInteractorOutput!
    let shoppingListService: ShoppingListService;
    
    init(shoppingService: ShoppingListService) {
        self.shoppingListService = shoppingService;
    }

    // MARK: Business logic
    func getShoppingList() {
        let list = shoppingListService.getShoppingList()
        output.receivedShoppingList(list: list)
    }
    
    func removeFromShoppingList(_ product: Product) {
        shoppingListService.removeProduct(product: product)
    }
    
}
