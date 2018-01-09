//
//  SearchPresenter.h
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

@import UIKit;

#import "SearchProductViewController.h"
#import "SearchProductInteractor.h"

@protocol SearchProductInteractorInput;
@protocol SearchProductRouterInput;

@interface SearchProductPresenter: NSObject <SearchProductViewOutput, SearchProductInteractorOutput>
    @property (nonatomic, weak, nullable) id <SearchProductViewInput> view;

    - (instancetype _Nonnull)init NS_UNAVAILABLE;
    - (instancetype _Nonnull)initWith:(id _Nonnull /* <SearchProductInteractorInput> */)interactor
                                  and:(id _Nonnull /* <SearchProductRouterInput> */)router NS_DESIGNATED_INITIALIZER;
@end
