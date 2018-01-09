//
//  ShoppingListServiceImp.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

class ShoppingListServiceImp: ShoppingListService {
    let shoppingListRepository: ShoppingListRepository
    
    init(shoppingListRep: ShoppingListRepository) {
        self.shoppingListRepository = shoppingListRep
    }
    
    func getShoppingList() -> [Product] {
        return shoppingListRepository.getShoppingList()
    }
    
    func removeProduct(product: Product) {
        shoppingListRepository.removeProduct(product)
    }
}
