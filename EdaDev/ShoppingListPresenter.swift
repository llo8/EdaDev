//
//  ShoppingList.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

class ShoppingListPresenter {
    weak var view: ShoppingListViewInput?
    let interactor: ShoppingListInteractorInput
    let router: ShoppingListRouterInput
    var products: [Product] = []

    init(interactor: ShoppingListInteractorInput, router: ShoppingListRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

extension ShoppingListPresenter: ShoppingListViewOutput {

    func viewIsReady() {
        view?.setupInitialState()
    }
    
    func viewIsAppear() {
        interactor.getShoppingList()
    }
    
    func countProducts() -> Int {
        return products.count
    }
    
    func productForIndex(_ index: Int) -> Product {
        return products[index]
    }
    
    func removeFromShoppingList(_ product: Product) {
        interactor.removeFromShoppingList(product)
        if let index = products.index(of: product)  {
            products.remove(at: index)
        }
    }
}

extension ShoppingListPresenter: ShoppingListInteractorOutput {
    func receivedShoppingList(list: [Product]) {
        products = list
        view?.reloadData()
    }
}
