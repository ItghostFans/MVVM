//
//  AutoCellViewModel.h
//  ViewModel_Example
//
//  Created by ItghostFan on 2024/7/26.
//  Copyright © 2024 fanchunxing1. All rights reserved.
//

#import "CellViewModel+TableView.h"
#import "CellViewModel+CollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@class AutoCellViewModel;

@protocol IAutoCellViewModelDelegate <ICellViewModelDelegate>
@end

@interface AutoCellViewModel : CellViewModel

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wobjc-property-synthesis"
@property (weak, nonatomic, nullable) id<IAutoCellViewModelDelegate> delegate;
#pragma clang diagnostic pop

@end

NS_ASSUME_NONNULL_END
