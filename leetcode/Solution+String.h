//
//  Solution+String.h
//  leetcode
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution.h"

@interface Solution (String)

// 计算 s 中不含重复字符的最长子串的长度
- (NSUInteger)lengthOfLongestSubstring:(NSString *)s;

// 返回 s 中最长的回文子串
- (NSString *)longestPalindrome:(NSString *)s;

// 将字符按 Zig Zag 形式，即 竖、斜、竖、斜 的轨迹排列，再从左到右、从上到下的按序输出
- (NSString *)zigZag:(NSString *)s withRow:(NSUInteger)row;

// 在俩字符串中找最长公共子串
- (NSString *)longestCommonSubStringOf:(NSString *)aStr andString:(NSString *)bStr;

- (NSArray *)letterCombinations:(NSArray *)digits;

@end
