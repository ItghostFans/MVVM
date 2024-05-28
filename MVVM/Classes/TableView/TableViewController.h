//
//  TableViewController.h
//  iOSAbility
//
//  Created by ItghostFan on 2024/2/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TableViewModel;

@interface TableViewController : UIViewController

@property (strong, nonatomic, nonnull, readonly) UITableView *tableView;

@property (strong, nonatomic, nullable) TableViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
