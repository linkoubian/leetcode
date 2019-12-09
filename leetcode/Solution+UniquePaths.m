//
//  Solution+UniquePaths.m
//  leetcode
//
//  Created by Linkou Bian on 2019/12/9.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution+UniquePaths.h"

@implementation Solution (UniquePaths)

- (NSUInteger)uniquePathsWithObstacles:(NSArray *)obstacles {
    NSUInteger row = obstacles.count;
    NSUInteger column = [[obstacles firstObject] count];
    
    if (row == 0 || column == 0) {
        return 0;
    }
    
    NSUInteger dp[row][column];
    memset(dp, 0, row * column * sizeof(NSUInteger));
    
    for (int i = 0; i < row; i++) {
        if ([obstacles[i][0] integerValue] == 1) {
            break;
        }
        
        dp[i][0] = 1;
    }
    
    for (int j = 0; j < column; j++) {
        if ([obstacles[0][j] integerValue] == 1) {
            break;
        }
        
        dp[0][j] = 1;
    }
    
    for (int i = 1; i < row; i++) {
        for (int j = 1; j < column; j++) {
            if ([obstacles[i][j] integerValue] == 1) {
                dp[i][j] = 0;
            } else {
                dp[i][j] = dp[i][j - 1] + dp[i - 1][j];
            }
        }
    }
    
    return dp[row - 1][column - 1];
}

@end
