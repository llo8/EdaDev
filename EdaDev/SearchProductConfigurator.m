//
//  Search.m
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

#import "SearchProductConfigurator.h"
#import "SearchProductViewController.h"
#import "SearchProductRouter.h"
#import "SearchProductInteractor.h"
#import "SearchProductPresenter.h"
#import "EdaDev-Swift.h"

@implementation SearchProductConfigurator
#pragma mark Configuration
- (void)configureViewController:(SearchProductViewController *)viewController {
    SearchProductRouter *router = [SearchProductRouter new];
    
    ProductServiceImp *service = [[ProductServiceImp alloc] initWithProductRep:[[ProductRepositoryImp alloc] init]
                                                               shoppingListRep:[[ShoppingListRepositoryImp alloc] init]];
    
    SearchProductInteractor *interactor = [[SearchProductInteractor alloc] initWithService:service];
    
    SearchProductPresenter *presenter = [[SearchProductPresenter alloc] initWith:interactor and:router];
    
    interactor.output = presenter;
    viewController.output = presenter;
    presenter.view = viewController;
    router.viewController = viewController;
}

@end
