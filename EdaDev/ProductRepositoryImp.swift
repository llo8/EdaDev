//
//  ProductRepositoryImp.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

import Foundation

@objc class ProductRepositoryImp:NSObject, ProductRepository, RealmSaveMany, RealmGetAll, RealmSaveOne {
    typealias Entity = ProductRealm
    
    func getProducts() -> [Product] {
        let products = self.getAll().map { $0.simpleValue() }
        return products;
    }
    
    func updateProducts(products: [Product]) {
        let productsRealm = products.map { product -> (ProductRealm) in
            let productRealm = ProductRealm()
            productRealm.fill(with: product)
            return productRealm
        }
        _ = self.save(productsRealm)
    }
    
}

