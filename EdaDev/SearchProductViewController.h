//
//  SearchProductViewController.h
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

@import UIKit;

@class Product;
@class SearchProductConfigurator;

@protocol SearchProductViewInput
- (void)setupInitialState;
- (void)reloadData;
- (void)startIndication;
- (void)stopIndication;
@end

@protocol SearchProductViewOutput
- (void) viewIsReady;

- (NSInteger)countProducts;
- (Product * _Nonnull)productForIndex:(NSInteger)index;

- (void)addToShoppingList:(Product  * _Nonnull)product;

- (void)filterProducts:(NSString * _Nonnull)searchText;
@end


@interface SearchProductViewController: UIViewController <SearchProductViewInput>

    @property (nonatomic, nonnull) id<SearchProductViewOutput> output;
    @property (nonatomic, nonnull) SearchProductConfigurator *configurator;

@end
