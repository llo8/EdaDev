//
//  SearchProductsService.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

@objc protocol ProductService {
    func requestAllProducts(completionHandler: @escaping () -> Void)
    func getAllProducts() -> [Product]
    func addToShoppingList(product: Product)
}
