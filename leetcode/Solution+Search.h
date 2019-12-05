//
//  Solution+Search.h
//  leetcode
//
//  Created by Linkou Bian on 2019/11/27.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution.h"

/// 搜索
@interface Solution (Search)

- (NSInteger)search:(NSInteger)key inArray:(NSArray *)array;
- (double)medianOfArray:(NSArray *)aArray andArray:(NSArray *)bArray;
- (NSInteger)sqrt:(NSInteger)n;

/*! @brief 在有序数组中，找到目标值最左及最右坐标 */
- (NSArray *)rangeOfTarget:(NSInteger)target inArray:(NSArray *)array;

@end
