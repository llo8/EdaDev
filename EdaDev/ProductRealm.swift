//
//  ProductRealm.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

import Realm
import RealmSwift

class ProductRealm: Object {
    dynamic var descriptionProduct: String = ""
    dynamic var price: Double = 0.0
    dynamic var discount: Int = 0
    dynamic var image: String?
    dynamic var retailer: String?
    
    override static func primaryKey() -> String? {
        return "descriptionProduct"
    }
    
    func simpleValue() -> Product {
        return Product(descriptionProduct: descriptionProduct,
                       price: price,
                       discount: discount,
                       image: image,
                       retailer: retailer)
    }
    
    func fill(with product: Product) {
        self.descriptionProduct = product.descriptionProduct
        self.price = product.price ?? 0.0
        self.discount = product.discount ?? 0
        self.image = product.image
        self.retailer = product.retailer
    }
}

class ShoppingProductRealm: ProductRealm { }
