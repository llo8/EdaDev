//
//  Search.h
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

@import UIKit;

@class Product;

@protocol SearchProductInteractorInput
- (void)addProduct:(Product * _Nonnull)product;
- (void)getProducts;
- (void)requestAllProducts;
@end

@protocol SearchProductInteractorOutput
- (void)receivedProducts:(NSArray<Product *> * _Nonnull) products;
@end

@interface SearchProductInteractor: NSObject <SearchProductInteractorInput>
    @property (nonatomic, nonnull) id<SearchProductInteractorOutput> output;
    - (instancetype _Nonnull)init NS_UNAVAILABLE;
    - (instancetype _Nonnull)initWithService:(id _Nonnull /* <ProductService> */)productService NS_DESIGNATED_INITIALIZER;
@end
