//
//  ProductRepository.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

@objc protocol ProductRepository {
    func getProducts() -> [Product]
    func updateProducts(products: [Product])
}
