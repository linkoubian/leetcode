//
//  Solution+Coins.h
//  leetcode
//
//  Created by Linkou Bian on 2019/11/25.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution.h"

@interface Solution (Coins)

// 用无尽的硬币兑换指定金额，所需最少硬币数
- (NSUInteger)minCountOfCoinsFor:(NSUInteger)sum with:(NSArray *)coins;
// 用无尽的硬币兑换指定金额，可能的组合数量
- (NSUInteger)countOfWaysFor:(NSUInteger)sum with:(NSArray *)coins;

- (NSArray *)combinationsToTarget:(NSUInteger)target with:(NSArray *)array;

@end
