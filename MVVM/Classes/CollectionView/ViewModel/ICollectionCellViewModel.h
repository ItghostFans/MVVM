//
//  ICollectionCellViewModel.h
//  iOSAbility
//
//  Created by ItghostFan on 2024/2/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ICollectionCellViewModel <NSObject>

@property (weak, nonatomic, nullable) NSIndexPath *collectionIndexPath;
@property (assign, nonatomic, readonly) CGSize collectionCellSize;               // 最后一次collectionCellSizeForSize:的size。
@property (strong, nonatomic, nonnull, readonly) Class collectionCellClass;

- (CGSize)collectionCellSizeForSize:(CGSize)size;                          // 在计算Collection View Cell高度时调用。

@end

NS_ASSUME_NONNULL_END
