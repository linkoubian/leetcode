//
//  Solution+Sorting.h
//  leetcode
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution.h"

/*!
 *  @brief      避免 Solution 太臃肿，工程上应采用 NSMutableArray Category 实现
 */
@interface Solution (Sorting)

- (NSArray *)bubbleSort:(NSMutableArray *)array;
- (NSArray *)quickSort:(NSMutableArray *)array fromLeft:(NSInteger)left toRight:(NSInteger)right;

@end
