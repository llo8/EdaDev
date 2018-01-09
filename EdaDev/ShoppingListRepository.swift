//
//  ShoppingListRepository.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

@objc protocol ShoppingListRepository {
    func getShoppingList() -> [Product]
    func removeProduct(_ product: Product)
    func addProduct(_ product: Product)
}
