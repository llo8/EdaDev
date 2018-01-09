//
//  SearchPresenter.m
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

#import "SearchProductPresenter.h"
#import "SearchProductRouter.h"
#import "EdaDev-Swift.h"

@interface SearchProductPresenter ()

    @property (nonatomic, nonnull) id <SearchProductInteractorInput> interactor;
    @property (nonatomic, nonnull) id <SearchProductRouterInput> router;

    @property (nonatomic, strong) NSArray<Product *> * products;
    @property (nonatomic, strong) NSArray<Product *> * filterProducts;
    @property (nonatomic, assign) BOOL showFilterProducts;

@end

@implementation SearchProductPresenter

#pragma mark - init with interactor & router
- (instancetype)initWith:(id <SearchProductInteractorInput>) interactor
                     and:(id <SearchProductRouterInput>) router {
    self = [super init];
    
    self.interactor = interactor;
    self.router = router;
    
    return self;
}

- (void)viewIsReady {
    [_view startIndication];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.interactor requestAllProducts];
    });
    
    [_view setupInitialState];
}

- (void)addToShoppingList:(Product *)product {
    [_interactor addProduct:product];
}

- (NSInteger)countProducts {
    return _showFilterProducts ? _filterProducts.count : _products.count;
}

- (Product * _Nonnull)productForIndex:(NSInteger)index {
    Product *product = _showFilterProducts ? _filterProducts[index] : _products[index];
    return product;
}

- (void)filterProducts:(NSString * _Nonnull)searchText {
    _showFilterProducts = searchText.length > 0;
    if (_showFilterProducts) {
        NSString *predicateFormat = [NSString stringWithFormat:@"SELF.descriptionProduct contains[c] '%@'", searchText];
        NSPredicate *sPredicate = [NSPredicate predicateWithFormat:predicateFormat];
        _filterProducts = [_products filteredArrayUsingPredicate:sPredicate];
        _filterProducts = [_filterProducts sortedArrayUsingComparator:^NSComparisonResult(Product * _Nonnull obj1,
                                                                                          Product * _Nonnull obj2) {
            NSRange range1 = [obj1.descriptionProduct rangeOfString:searchText];
            NSRange range2 = [obj2.descriptionProduct rangeOfString:searchText];
            
            return [[NSNumber numberWithInteger:range1.location] compare:[NSNumber numberWithInteger:range2.location]];
        }];
    } else {
        _filterProducts = @[];
    }
    
    [_view reloadData];
}


- (void)receivedProducts:(NSArray<Product *> *)products {
    _products = products;
    [_view stopIndication];
    [_view reloadData];
}

@end
