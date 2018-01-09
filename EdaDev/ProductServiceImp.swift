//
//  SearchProductServiceImp.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

import Alamofire
import ObjectMapper

@objc class ProductServiceImp:NSObject, ProductService {
    
    let productRepository: ProductRepository
    let shoppingListRepository: ShoppingListRepository
    
    @objc init(productRep: ProductRepository, shoppingListRep: ShoppingListRepository) {
        self.productRepository = productRep;
        self.shoppingListRepository = shoppingListRep;
    }
    
    func requestAllProducts(completionHandler: @escaping () -> Void) {
        let sessionManager = SessionManager.default
        let url = URL(string: "https://api.edadev.ru/intern/")
        sessionManager.request(url!).responseJSON { Response in
            if let json = Response.result.value {
                do {
                    let products:[Product] = try Mapper().mapArray(JSONObject: json)
                    self.productRepository.updateProducts(products: products)
                } catch {
                    print(error.localizedDescription)
                }
            }
            completionHandler()
        }
    }
    
    func getAllProducts() -> [Product] {
        var products = self.productRepository.getProducts()
        products.sort { $0.descriptionProduct < $1.descriptionProduct }
        return products
    }
    
    func addToShoppingList(product: Product) {
        self.shoppingListRepository.addProduct(product)
    }
}
