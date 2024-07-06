//
//  TestSectionViewModel.h
//  ViewModel_Example
//
//  Created by ItghostFan on 2024/6/2.
//  Copyright © 2024 fanchunxing1. All rights reserved.
//

#import "SectionViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@class TestSectionViewModel;

@protocol ITestSectionViewModelDelegate <IBaseViewModelDelegate>
@end

@interface TestSectionViewModel : SectionViewModel

@property (weak, nonatomic, nullable) id<ITestSectionViewModelDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
