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
- (NSInteger)search:(NSInteger)target inArray:(NSArray *)array {
    if ([array count] == 0) {
        return -1;
    }
    
    NSUInteger start = 0;
    NSUInteger end = array.count - 1;
    
    while (start + 1 < end) {
        NSInteger mid = start + (end - start) / 2;
        if ([array[mid] integerValue] == target) {
            return mid;
        } else if ([array[mid] integerValue] > target) {
            end = mid;
        } else {
            start = mid;
        }
    }
    
    if ([array[start] integerValue] == target) {
        return start;
    }
    
    if ([array[end] integerValue] == target) {
        return end;
    }
    
    return -1;
}

- (NSInteger)position:(NSInteger)target inArray:(NSArray *)array {
    NSInteger start = 0;
    NSInteger end = array.count - 1;
    
    while (start + 1 < end) {
        NSInteger mid = start + (end - start) / 2;
        if ([array[mid] integerValue] == target) {
            return mid;
        } else if ([array[mid] integerValue] < target) {
            start = mid + 1;
        } else {
            end = mid - 1;
        }
    }
    
    if ([array[end] integerValue] < target) {
        return end + 1;
    } else if ([array[start] integerValue] >= target) {
        return start;
    } else {
        return end;
    }
}

- (double)medianOfArray:(NSArray *)array {
    if (array.count == 0) {
        return 0;
    }
    
    if (array.count % 2 == 0) {
        return ([array[array.count/2 - 1] integerValue] + [array[array.count/2] integerValue]) / 2;
    }
    
    return [array[array.count/2] integerValue];
}

- (double)medianOfArray:(NSArray *)aArray andArray:(NSArray *)bArray {
    // 任一数组是空的，则相当于在单个有序数组中找中位数
    if ([aArray count] == 0) {
        return [self medianOfArray:bArray];
    }
    
    if ([bArray count] == 0) {
        return [self medianOfArray:aArray];
    }
    
    // 确保第一个数组是数量少的那个
    if ([aArray count] > [bArray count]) {
        NSArray *tmpArray = aArray;
        aArray = bArray;
        bArray = tmpArray;
    }
    
    // 总数量的一半（或一半多一个，这样中位数就是多的那个）
    NSInteger half = (aArray.count + bArray.count + 1) / 2;
    
    // 在数组 A 中二分找到一个位置，符合 A 和 B 数组划分在左半边的数都是小于等于右边的
    NSInteger start = 0;                // 数组 A 的 最左 border
    NSInteger end = aArray.count;       // 数组 A 的 最右 border
    NSInteger borderA;                  // 数组 A 的 border（分隔线），分隔线的值等于线左边的数量，两边的下标跟 border 值有关
    NSInteger borderB;                  // 数组 B 的 border（分隔线），且 half = borderA + borderB
    NSInteger aLeft = NSIntegerMin;     // 数组 A 的 border 左侧元素
    NSInteger aRight = NSIntegerMax;    // 数组 A 的 border 右侧元素
    NSInteger bLeft = NSIntegerMin;     // 数组 B 的 border 左侧元素
    NSInteger bRight = NSIntegerMax;    // 数组 B 的 border 右侧元素
    
    while (start <= end) {
        borderA = (start + end) / 2;
        borderB = half - borderA;
        aLeft = borderA < 1 ? NSIntegerMin : [aArray[borderA - 1] integerValue];
        aRight = borderA > aArray.count - 1 ? NSIntegerMax : [aArray[borderA] integerValue];
        bLeft = borderB < 1 ? NSIntegerMin : [bArray[borderB - 1] integerValue];
        bRight = borderB > bArray.count - 1 ? NSIntegerMax : [bArray[borderB] integerValue];
        
        if (aLeft >bRight) {
            end = borderA - 1;
        } else if (bLeft > aRight) {
            start = borderA + 1;
        } else {
            break;
        }
    }
    
    // 偶数个
    if ((aArray.count + bArray.count) % 2 == 0) {
        return (MAX(aLeft, bLeft) + MIN(aRight, bRight)) / 2.0;
    } else {
        // 取左边较大值，呼应前面 half 取值时用 total 先加 1 再除以 2
        return MAX(aLeft, bLeft);
    }
}

/*!
 *  @brief      Sqrt(x)
 *  @discussion 利用二分法求平方根
 *  @see        http://www.goodtecher.com/leetcode-69-sqrtx-java/
 */
- (NSUInteger)sqrt:(NSUInteger)n {
    NSUInteger start = 0;
    NSUInteger end = n;
    
    while (start + 1 < end) {
        NSUInteger mid = start + (end - start) / 2;
        if (mid * mid == n) {
            return mid;
        } else if (mid * mid > n) {
            end = mid;
        } else {
            start = mid;
        }
    }
    
    if (end * end == n) {
        return end;
    }
    
    return start;
}

/*!
 *  @brief      在有序数组中，找到目标值最左及最右坐标
 *  @discussion 知道目标值的最左最右位置后，就可以计算目标值的数量
 */
- (NSArray *)rangeOfTarget:(NSInteger)target inArray:(NSArray *)array {
    NSMutableArray *results = [NSMutableArray new];
    results[0] = @(-1);
    results[1] = @(-1);
    
    int start = 0;
    int end = (int)array.count - 1;
    
    // 至少三个元素
    while (start + 1 < end) {
        int mid = start + (end - start) / 2;
        
        if ([array[mid] integerValue] == target) {
            end = mid;
        } else if ([array[mid] integerValue] > target) {
            end = mid;
        } else {
            start = mid;
        }
    }
    
    // 最后两个或1个元素，先看右边的，确保 results[0] 是最左边的
    if ([array[end] integerValue] == target) {
        results[0] = @(end);
    }
    
    if ([array[start] integerValue] == target) {
        results[0] = @(start);
    }
    
    // 同理，处理最右的位置
    start = 0;
    end = (int)array.count - 1;
    
    while (start + 1 < end) {
        int mid = start + (end - start) / 2;
        
        if ([array[mid] integerValue] == target) {
            start = mid;
        } else if ([array[mid] integerValue] > target) {
            end = mid;
        } else {
            start = mid;
        }
    }
    
    if ([array[start] integerValue] == target) {
        results[1] = @(start);
    }
    
    if ([array[end] integerValue] == target) {
        results[1] = @(end);
    }
    
    return results;
}

@end
