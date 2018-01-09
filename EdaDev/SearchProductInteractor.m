//
//  Search.m
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

#import "SearchProductInteractor.h"
#import "EdaDev-Swift.h"

@interface SearchProductInteractor ()

    @property (nonatomic, strong) id <ProductService> productService;

@end

@implementation SearchProductInteractor

- (instancetype)initWithService:(id <ProductService>) productService {
    self = [super init];
    self.productService = productService;
    return self;
}

#pragma mark Business logic
- (void)getProducts {
    NSArray<Product *> *list = _productService.getAllProducts;
    [_output receivedProducts:list];
}

- (void)addProduct:(Product *)product {
    [_productService addToShoppingListWithProduct:product];
}

- (void)requestAllProducts {
    [_productService requestAllProductsWithCompletionHandler:^{
        [self getProducts];
    }];
}

@end
