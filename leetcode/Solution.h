//
//  Solution.h
//  leetcode
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// 打印二维数组
void printArrays(int row, int col, long data[row][col]);

/*!
 *  @brief      参考在线编程网站的模板代码命名
 *  @see        https://www.hackerrank.com
 *  @see        https://www.codility.com
 *  @see        https://leetcode.com
 */
@interface Solution : NSObject

- (NSArray *)groupAnagrams:(NSArray<NSString *> *)lines;
- (NSArray *)groupAnagrams_v2:(NSArray<NSString *> *)words;

+ (NSInteger)priceRounding:(NSInteger)cents withN:(NSUInteger)n;
+ (NSArray *)polygonCount:(NSArray *)sidesArray;

@end
