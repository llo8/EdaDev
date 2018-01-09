//
//  ShoppingListRepositoryImp.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

@objc class ShoppingListRepositoryImp:NSObject, ShoppingListRepository, RealmRemoveOne, RealmSaveOne, RealmGetAll {
    typealias Entity = ShoppingProductRealm
    
    func getShoppingList() -> [Product] {
        let shoppingList = self.getAll().map { $0.simpleValue() }
        return shoppingList
    }
    
    func removeProduct(_ product: Product) {
        self.remove(product.descriptionProduct)
    }
    
    func addProduct(_ product: Product) {
        let productRealm = ShoppingProductRealm()
        productRealm.fill(with: product)
        _ = self.save(productRealm)
    }
}
