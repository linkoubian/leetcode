//
//  Solution+Search.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/27.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution+Search.h"

@implementation Solution (Search)

/*!
 *  @brief      二分搜索
 *  @see        https://youtu.be/UeUyTbtFxQQ
 *  @return     位置, -1 表示未找到
 */
- (NSInteger)search:(NSInteger)key inArray:(NSArray *)array {
    NSUInteger start = 0;
    NSUInteger end = array.count - 1;
    NSUInteger mid = (start + end) / 2;
    
    while (start <= end && [array[mid] integerValue] != key) {
        if ([array[mid] integerValue] > key) {
            end = mid - 1;
        } else {
            start = mid + 1;
        }
        
        mid = (start + end) / 2;
    }
    
    if (start > end) {
        return -1;
    }
    
    return mid;
}

@end
