//
//  Solution+Robber.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/26.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution+Robber.h"

@implementation Solution (Robber)

/*!
 *  @brief      House Robber
 *  @discussion 也可以用动态规划，每个房子存在劫与不劫两种可能
 */
- (NSUInteger)rob:(NSArray *)nums {
    if (nums.count == 0) {
        return 0;
    }
    
    NSUInteger dp[nums.count];
    dp[0] = [nums[0] unsignedIntegerValue];
    
    if (nums.count > 1) {
        dp[1] = MAX([nums[0] unsignedIntegerValue], [nums[1] unsignedIntegerValue]);
    }
    
    for (int i = 2; i < nums.count; i++) {
        NSInteger num = [nums[i] unsignedIntegerValue];
        // 选不选中 num 哪个更优
        dp[i] = MAX(dp[i - 2] + num, dp[i - 1]);
    }
    
    return dp[nums.count - 1];
}

@end
