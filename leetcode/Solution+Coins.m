//
//  Solution+Coins.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/25.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution+Coins.h"

@implementation Solution (Coins)

/*!
 *  @brief      用无尽的硬币兑换指定金额，所需最少硬币数
 *  @discussion LeetCode 322
 *  @see        https://www.geeksforgeeks.org/find-minimum-number-of-coins-that-make-a-change/
 */
- (NSUInteger)minCountOfCoinsFor:(NSUInteger)sum with:(NSArray *)coins {
    // 求 min 则初始化为 MAX VALUE
    NSUInteger dp[sum + 1];
    memset(dp, NSUIntegerMax, coins.count * sizeof(NSUInteger));
    
    // sum 为 0 则不需要硬币
    dp[0] = 0;
    
    for (int i = 1; i <= sum; i++) {
        for (int j = 0; j < coins.count; j++) {
            NSUInteger coinVal = [[coins objectAtIndex:j] integerValue];
            
            if (coinVal > i) {
                continue;
            }
            
            // sum - coinVal 是可以找零的
            if (dp[i - coinVal] != NSUIntegerMax) {
                dp[i] = MIN(dp[i], dp[i - coinVal] + 1);
            }
        }
    }
    
    return dp[sum];
}

/**
        $   2   5   3   6
 #      1   1   1   1   1
 1      0   0   0   0   0
 2      0   1   1   1   1
 3      0   0   0   1   1
 .
 .
 .
 */

/*!
 *  @brief      用无尽的硬币兑换指定金额，可能的组合数量
 *  @see        https://www.youtube.com/watch?v=_fgjrs570YE
 */
- (NSUInteger)countOfWaysFor:(NSUInteger)sum with:(NSArray *)coins {
    NSUInteger dp[sum + 1][coins.count + 1];
    memset(dp, 0, (sum + 1) * (coins.count + 1) * sizeof(NSUInteger));
    
    for (int col = 0; col < coins.count + 1; col++) {
        dp[0][col] = 1;
    }
    
    for (NSUInteger i = 1; i <= sum; i++) {
        for (NSUInteger j = 1; j <= coins.count; j++) {
            NSUInteger coin = [coins[j - 1] unsignedIntegerValue];
            
            // coin 面额太大，无法使用
            if (i < coin) {
                dp[i][j] = dp[i][j - 1];
            } else {
                // 用 coin 则 sum 降低；不通 coin 则直接历史值
                dp[i][j] = dp[i - coin][j] + dp[i][j - 1];
            }
        }
    }
    
    return dp[sum][coins.count];
}

- (void)combinations:(NSMutableArray *)results toTarget:(NSInteger)target withConstructingArray:(NSArray *)tempArray sourceArray:(NSArray *)sourceArray startIndex:(NSUInteger)startIndex {
    if (target == 0) {
        [results addObject:tempArray];
        return;
    }
    
    if (target < 0) {
        return;
    }
    
    // startIndex 避免 2, 2, 3 和 2, 3, 2 算两种组合
    for (NSUInteger i = startIndex; i < sourceArray.count; i++) {
        if ([sourceArray[i] integerValue] > target) {
            break;
        }
        
        NSMutableArray *constructingArray = [tempArray mutableCopy];
        [constructingArray addObject:sourceArray[i]];
        
        [self combinations:results toTarget:(target - [sourceArray[i] integerValue]) withConstructingArray:constructingArray sourceArray:sourceArray startIndex:i];
    }
}

- (NSArray *)combinationsToTarget:(NSUInteger)target with:(NSArray *)array {
    NSMutableArray *results = [NSMutableArray new];
    
    if ([array count] == 0) {
        return results;
    }
    
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(compare:)];
    [self combinations:results toTarget:target withConstructingArray:@[] sourceArray:sortedArray startIndex:0];
    
    return results;
}

@end
