//
//  Solution+Array.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/25.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution+Array.h"

@implementation Solution (Array)

/*!
 *  @brief      连续子数组最大和, Kadane 算法
 *  @see        https://segmentfault.com/a/1190000012524061
 */
- (NSInteger)maxSubArray:(NSArray *)array {
    if ([array count] == 0) {
        return 0;
    }
    
    NSInteger maxSoFar = [array[0] integerValue];
    NSInteger maxEndingHere = [array[0] integerValue];
    
    for (int i = 1; i < array.count; i++) {
        maxEndingHere = MAX([array[i] integerValue], maxEndingHere + [array[i] integerValue]);
        maxSoFar = MAX(maxSoFar, maxEndingHere);
    }
    
    return maxSoFar;
}

/*!
 *  @brief      连续子数组最大和, C 数组版本
 */
- (int)maxSubArray:(int [])array withCount:(int)count {
    if (count == 0) {
        return 0;
    }
    
    int max = array[0];
    int sum = array[0];
    
    for (int i = 1; i < count; i++) {
        // 累积的有正向作用
        if (sum > 0) {
            sum += array[i];
            
            // 是否创新高
            if (sum > max) {
                max = sum;
            }
        } else {
            sum = array[i];
            
            if (sum > max) {
                max = sum;
            }
        }
    }
    
    return max;
}

/*!
 *  @brief      连续子数组最大和, DP 版本
 *  @discussion dp[i][0]: 不包含 array[i] 的 sum，
 *              dp[i][1]: 包含 nums[i] 的 sum。
 *
 *              f(i) = max(dp[i][0], dp[i][1])
 */
- (NSInteger)maxSubArrayDP:(NSArray *)array {
    if ([array count] == 0) {
        return 0;
    }
    
    long dp[array.count][2];
    memset(dp, 0, array.count * 2 * sizeof(long));
    
    dp[0][0] = LONG_MIN;
    dp[0][1] = [array[0] integerValue];
    
    for (int i = 1; i < array.count; i++) {
        dp[i][0] = MAX(dp[i-1][0], dp[i-1][1]);
        dp[i][1] = MAX([array[i] integerValue], dp[i-1][1] + [array[i] integerValue]);
    }
    
    return MAX(dp[array.count-1][0], dp[array.count-1][1]);
}

@end
