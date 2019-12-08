//
//  Solution+Search.h
//  leetcode
//
//  Created by Linkou Bian on 2019/11/27.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution.h"

@interface Solution (Search)

/*! @brief 二分搜索 */
- (NSInteger)search:(NSInteger)key inArray:(NSArray *)array;
/*! @brief 在有序数组中找到目标值，或者适合目标值的插入位置 */
- (NSInteger)position:(NSInteger)target inArray:(NSArray *)array;

- (double)medianOfArray:(NSArray *)aArray andArray:(NSArray *)bArray;
- (NSInteger)sqrt:(NSInteger)n;

/*! @brief 在有序数组中，找到目标值最左及最右坐标 */
- (NSArray *)rangeOfTarget:(NSInteger)target inArray:(NSArray *)array;

@end
