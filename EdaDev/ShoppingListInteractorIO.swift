//
//  ShoppingListInteractorIO.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

// MARK: - Interactor Input
protocol ShoppingListInteractorInput {
    func getShoppingList()
    func removeFromShoppingList(_ product: Product)
}

// MARK: - Interactor Output
protocol ShoppingListInteractorOutput {
    func receivedShoppingList(list: [Product])
}
