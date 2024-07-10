//
//  TestCollectionController.h
//  ViewModel_Example
//
//  Created by ItghostFan on 2024/6/2.
//  Copyright © 2024 fanchunxing1. All rights reserved.
//

#import "CollectionController.h"

NS_ASSUME_NONNULL_BEGIN

@class TestCollectionControllerViewModel;

@interface TestCollectionController : CollectionController

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-property-type"
@property (strong, nonatomic, nullable) TestCollectionControllerViewModel *viewModel;
#pragma clang diagnostic pop

@end

NS_ASSUME_NONNULL_END
