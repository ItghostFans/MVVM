//
//  TestTableController.m
//  MVVM_Example
//
//  Created by ItghostFan on 2024/6/2.
//  Copyright © 2024 fanchunxing1. All rights reserved.
//

#import "TestTableController.h"
#import "TestTableControllerViewModel.h"

#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>

#import "TableViewModel.h"
#import "TestCellViewModel.h"
#import "TestSectionViewModel.h"

@interface TestTableController ()
@property (weak, nonatomic) UIButton *addSectionButton;
@property (weak, nonatomic) UIButton *addRowButton;
@end

@implementation TestTableController

@synthesize viewModel = _viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addSectionButton.mas_bottom);
        make.leading.trailing.bottom.equalTo(self.view);
    }];
    self.viewModel.tableViewModel.tableView = self.tableView;
    
    @weakify(self);
    self.addSectionButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        [self.viewModel.tableViewModel.tableView performBatchUpdates:^{
            @strongify(self);
            TestSectionViewModel *sectionViewModel = TestSectionViewModel.new;
            [sectionViewModel addViewModel:TestCellViewModel.new];
            [self.viewModel.tableViewModel.sectionViewModels addViewModel:sectionViewModel];
        } completion:^(BOOL finished) {
        }];
        return [RACSignal return:nil];
    }];
    self.addRowButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        [self.viewModel.tableViewModel.tableView performBatchUpdates:^{
            @strongify(self);
            SectionViewModel *sectionViewModel = self.viewModel.tableViewModel.sectionViewModels.viewModels.firstObject;
            if (sectionViewModel) {
                [sectionViewModel addViewModel:TestCellViewModel.new];
            }
        } completion:^(BOOL finished) {
        }];
        return [RACSignal return:nil];
    }];
}

#pragma mark - Public

#pragma mark - Actions

#pragma mark - Private

#pragma mark - Getter

- (UIButton *)addSectionButton {
    if (!_addSectionButton) {
        UIButton *addSectionButton = UIButton.new;
        [self.view addSubview:addSectionButton];
        _addSectionButton = addSectionButton;
        [_addSectionButton setTitle:@"Add Section" forState:(UIControlStateNormal)];
        [_addSectionButton setTitleColor:UIColor.blackColor forState:(UIControlStateNormal)];
        [_addSectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.leading.equalTo(self.view);
        }];
    }
    return _addSectionButton;
}

- (UIButton *)addRowButton {
    if (!_addRowButton) {
        UIButton *addRowButton = UIButton.new;
        [self.view addSubview:addRowButton];
        _addRowButton = addRowButton;
        [_addRowButton setTitle:@"Add Row" forState:(UIControlStateNormal)];
        [_addRowButton setTitleColor:UIColor.blackColor forState:(UIControlStateNormal)];
        [_addRowButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.leading.equalTo(self.addSectionButton.mas_trailing);
        }];
    }
    return _addRowButton;
}

@end
