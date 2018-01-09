//
//  SearchRouter.h
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

@import UIKit;

@class SearchProductViewController;

@protocol SearchProductRouterInput

@end

@interface SearchProductRouter: NSObject <SearchProductRouterInput>
    @property (nonatomic, weak, nullable) SearchProductViewController *viewController;
@end
