//
//  ShoppingListService.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

protocol ShoppingListService {
    func getShoppingList() -> [Product]
    func removeProduct(product: Product)
}
