//
//  Solution+Array.h
//  leetcode
//
//  Created by Linkou Bian on 2019/11/25.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution.h"

@interface Solution (Array)

// 连续子数组最大和, Kadane 算法
- (NSInteger)maxSubArray:(NSArray *)array;
// 连续子数组最大和, C 数组版本
- (int)maxSubArray:(int [])array withCount:(int)count;
// 连续子数组最大和, DP 版本
- (NSInteger)maxSubArrayDP:(NSArray *)array;

@end
