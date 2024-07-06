//
//  CellViewModel+TableView.m
//  AFNetworking
//
//  Created by ItghostFan on 2024/2/4.
//

#import "CellViewModel+TableView.h"

#import <objc/runtime.h>

#import "WeakifyProxy.h"
#import "TableViewModel.h"
#import "TableViewModelCell.h"

@interface CellViewModel ()
@property (strong, nonatomic, readonly) NSMutableDictionary<__kindof NSNumber *, __kindof NSNumber *> *widthHeights;
@property (assign, nonatomic) CGSize tableCellSize;               // 最后一次tableCellHeightForWidth的size。
@end

@implementation CellViewModel (TableView)

- (NSMutableDictionary<__kindof NSNumber *, __kindof NSNumber *> *)widthHeights {
    NSMutableDictionary<__kindof NSNumber *, __kindof NSNumber *> *widthHeights = objc_getAssociatedObject(self, @selector(widthHeights));
    if (!widthHeights) {
        widthHeights = NSMutableDictionary.new;
        objc_setAssociatedObject(self, @selector(widthHeights), widthHeights, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return widthHeights;
}

#pragma mark - ITableCellViewModel

- (NSIndexPath *)tableIndexPath {
    NSUInteger section = [self.tableSectionViewModel.viewModels indexOfObject:self];
    if (section == NSNotFound) {
        return nil;
    }
    SectionViewModel *sectionViewModel = self.tableSectionViewModel[section];
    NSUInteger row = [sectionViewModel.viewModels indexOfObject:self];
    if (row == NSNotFound) {
        return nil;
    }
    return [NSIndexPath indexPathForRow:row inSection:section];
}

- (SectionViewModel *)tableSectionViewModel {
    return [objc_getAssociatedObject(self, @selector(tableSectionViewModel)) target];
}

- (void)setTableSectionViewModel:(SectionViewModel *)tableSectionViewModel {
    objc_setAssociatedObject(self, @selector(tableSectionViewModel), [[WeakifyProxy alloc] initWithTarget:tableSectionViewModel], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGSize)tableCellSize {
    NSValue *tableCellSize = objc_getAssociatedObject(self, @selector(tableCellSize));
    return [tableCellSize CGSizeValue];
}

- (void)setTableCellSize:(CGSize)tableCellSize {
    objc_setAssociatedObject(self, @selector(tableCellSize), [NSValue valueWithCGSize:tableCellSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (Class)tableCellClass {
    NSAssert(NO, @"%@ %s Should Implement By Subclass!", NSStringFromClass(self.class), __FUNCTION__);
    return TableViewModelCell.class;
}

- (CGFloat)tableCellHeightForWidth:(CGFloat)width {
    NSNumber *height;
    @synchronized (self.widthHeights) {
        height = self.widthHeights[@(width)];
        if (!height) {
            CGFloat contentWidth = width;
            height = @([self.tableCellClass heightForWidth:&contentWidth viewModel:self]);
            self.widthHeights[@(width)] = height;
        }
    }
    return height.doubleValue;
}

@end