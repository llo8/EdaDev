//
//  Search.m
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

#import "SearchProductViewController.h"
#import "SearchProductRouter.h"
#import "SearchProductConfigurator.h"
#import "SVProgressHUD.h"
#import "EdaDev-Swift.h"

@interface SearchProductViewController () <UITableViewDelegate, UITableViewDataSource, AdditionProductDelegate, UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation SearchProductViewController

#pragma mark - Object lifecycle
- (SearchProductConfigurator *)configurator {
    if (_configurator == nil) {
        _configurator = [SearchProductConfigurator new];
    }
    return _configurator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [_output viewIsReady];
}

#pragma mark - SearchProductViewInput
- (void)setupInitialState {
    self.title = NSLocalizedString(@"search_tab", nil);
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [_tableView registerClass:[AddProductCell class] forCellReuseIdentifier:@"ProductCell"];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.estimatedRowHeight = 200;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.hidden = YES;
    
    NSMutableArray<NSLayoutConstraint *> *constraints = [NSMutableArray new];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:_tableView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.view
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:_tableView
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.view
                                                        attribute:NSLayoutAttributeLeading
                                                       multiplier:1.0f
                                                         constant:0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.view
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:_tableView
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0f
                                                         constant:0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:self.view
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:_tableView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0f
                                                         constant:0]];
    
    [self.view addSubview:_tableView];
    [self.view addConstraints:constraints];

    _searchBar = [[UISearchBar alloc] init];
    _searchBar.placeholder = NSLocalizedString(@"search_tab", nil);
    _searchBar.delegate = self;
    _tableView.tableHeaderView = _searchBar;
    [_searchBar sizeToFit];
}

- (void)reloadData {
    [self.tableView reloadData];
}

- (void)startIndication {
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading_status", nil)];
}

- (void)stopIndication {
    [SVProgressHUD dismiss];
    _tableView.hidden = NO;
}

#pragma mark UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _output.countProducts;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView
                 cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    AddProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell"
                                                           forIndexPath:indexPath];
    
    Product *product = [_output productForIndex:indexPath.row];
    [cell fillWith:product];
    cell.delegate = self;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [_output filterProducts:searchText];
}

#pragma mark - AdditionProductDelegate
- (void)addToShoppingListWithProduct:(Product *)product {
    [_output addToShoppingList:product];
}

@end
