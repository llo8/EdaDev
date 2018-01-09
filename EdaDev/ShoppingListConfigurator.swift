//
//  ShoppingList.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

import UIKit

class ShoppingListConfigurator {
    func configure(viewController: ShoppingListViewController) {
        let router = ShoppingListRouter()

        let service = ShoppingListServiceImp(shoppingListRep: ShoppingListRepositoryImp())
        
        let interactor = ShoppingListInteractor(shoppingService: service)

        let presenter = ShoppingListPresenter(interactor: interactor, router: router)

        interactor.output = presenter
        viewController.output = presenter
        presenter.view = viewController
        router.viewController = viewController
    }
}
