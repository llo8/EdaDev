//
//  Product.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

import ObjectMapper

@objc final class Product: NSObject {
    var descriptionProduct: String
    var price: Double?
    var discount: Int?
    var image: String?
    var retailer: String?
    
    override init() {
        self.descriptionProduct = ""
    }
    
    @objc init(descriptionProduct: String, price: Double, discount: Int, image: String?, retailer: String?) {
        self.descriptionProduct = descriptionProduct
        self.price = price
        self.discount = discount
        self.image = image
        self.retailer = retailer
    }
}

extension Product: ImmutableMappable {
    convenience init(map: Map) throws {
        self.init()
        self.descriptionProduct = try map.value("description")
        self.price = try? map.value("price")
        self.discount = try? map.value("discount")
        self.image = try? map.value("image")
        self.retailer = try? map.value("retailer")
    }
}
