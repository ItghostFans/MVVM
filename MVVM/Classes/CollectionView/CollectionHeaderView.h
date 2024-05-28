//
//  CollectionHeaderView.h
//  iOSAbility
//
//  Created by ItghostFan on 2024/2/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SectionViewModel;

@interface CollectionHeaderView : UICollectionReusableView

@property (weak, nonatomic, nullable) SectionViewModel *viewModel;

+ (CGSize)headerSizeForSize:(CGSize *)size viewModel:(SectionViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
