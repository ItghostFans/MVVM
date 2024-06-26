//
//  CollectionViewModel+UICollectionViewDataSource.m
//  MVVM
//
//  Created by ItghostFan on 2024/5/31.
//

#import "CollectionViewModel+UICollectionViewDataSource.h"

#import "CellViewModel+CollectionView.h"

@implementation CollectionViewModel (UICollectionViewDataSource)

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionViewModels.viewModels.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.sectionViewModels[section] viewModels].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CellViewModel *cellViewModel = self.sectionViewModels[indexPath.section][indexPath.item];
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellViewModel.collectionCellClass) forIndexPath:indexPath];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SectionViewModel *sectionViewModel = self.sectionViewModels[indexPath.section];
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass(sectionViewModel.collectionHeaderClass) forIndexPath:indexPath];
    }
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        SectionViewModel *sectionViewModel = self.sectionViewModels[indexPath.section];
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass(sectionViewModel.collectionFooterClass) forIndexPath:indexPath];
    }
    return nil;
}

@end
