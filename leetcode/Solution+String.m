//
//  Solution+String.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution+String.h"

@implementation Solution (String)

/*!
 *  @brief      计算 s 中不含重复字符的最长子串的长度
 *  @discussion 使用快慢指针遍历，访问过的不重复的字符放到 Set 里，
 *              快指针遇到的新字符，
 *                  Set 中若已经存在，则从 Set 移除慢指针处的字符同时移动慢指针
 *                  若不存在，则将该字符加到 Set 中同时移动快指针
 *  @see        http://www.goodtecher.com/leetcode-3-longest-substring-without-repeating-characters/
 */
- (NSUInteger)lengthOfLongestSubstring:(NSString *)s {
    NSUInteger max = 0;
    NSUInteger i = 0;
    NSUInteger j = 0;
    
    NSMutableSet *chars = [NSMutableSet new];
    
    while (j < s.length) {
        id ch = @([s characterAtIndex:j]);
        
        if (![chars containsObject:ch]) {
            [chars addObject:ch];
            max = MAX(max, chars.count);
            j++;
        } else {
            [chars removeObject:ch];
            i++;
        }
    }
    
    return max;
}

/*!
 *  @brief      最长回文
 *  @discussion dp[i][j] 表示从 i 到 j 的子串是否是回文，注意 dp 数组只用到了一半。
 *              判定为回文的子串 Ci...j，符合 Ci == Cj 且 Ci+1...j-1 也是回文子串，
 *              Ci == Cj 则 dp[i][j] = dp[i+1][j-1]。
 *
 *              可以看到，计算 dp[i][j] 时用到了 i+1，说明 i 更快被遍历。
 */
- (NSString *)longestPalindrome:(NSString *)s {
    if (s.length == 0) {
        return s;
    }
    
    NSUInteger begin = 0;
    NSUInteger end = 0;
    
    int size = (int)[s length];
    int dp[size][size];
    memset(dp, 0, size * size * sizeof(int));  // 如果是静态长度数组，如 dp[5][4]，可以通过赋值为 {0} 初始化
    
    for (int j = 0; j < size; j++) {
        for (int i = 0; i < j; i++) {
            BOOL isInnerWordPalindrome = (j - i <= 2) || dp[i+1][j-1] == 1;
            if ([s characterAtIndex:i] == [s characterAtIndex:j] && isInnerWordPalindrome) {
                dp[i][j] = 1;
                
                if (j - i > end - begin) {
                    begin = i;
                    end = j;
                }
            }
        }
    }
    
    NSUInteger len = end - begin + 1;
    return [s substringWithRange: NSMakeRange(begin, len)];
}


// P   A   H   N
// A P L S I I G
// Y   I   R

/*!
 *  @brief      将字符按 Zig Zag 形式，即 竖、斜、竖、斜 的轨迹排列，再从左到右、从上到下的按序输出
 *  @discussion 整体还是按行（i）、列（j）的形式遍历输出。
 *              若最大行数为 N，将 PAY 和 ALI 之间的距离定义为 interval, 则 interval = 2*N - 2，
 *              PAY 的 A 和 P 之间的距离 step = interval - 2*i。
 *
 *              行（i）从 0 到 N 之间遍历，i++；
 *              列（j）从 i 到 s.length 之间遍历，j+= interval。
 *
 *  @param      s   原字符串，比如 PAYPALISHIRING
 *  @param      row 行数，比如 3
 *  @return     转换后的字符串，比如 PAHNAPLSIIGYIR
 */
- (NSString *)zigZag:(NSString *)s withRow:(NSUInteger)row {
    NSMutableString *result = [NSMutableString new];
    
    if (row <= 1 || row >= s.length) {
        return s;
    }
    
    int interval = (int)(2 * row - 1 - 1);  // P, A, H, N 所代表的列之间的距离
    
    for (int i = 0; i < row; i++) {
        for (int j = i; j < s.length; j+=interval) {
            [result appendFormat:@"%C", [s characterAtIndex:j]];
            
            int step = interval - i - i;    // PAY 列除了首末行外（比如 A）, 和中间元素（比如 P）间的距离
            
            if (step > 0 && step < interval && (j + step) < s.length) {
                [result appendFormat:@"%C", [s characterAtIndex:(j + step)]];
            }
        }
    }
    
    return [result copy];
}

/*!
 *  @brief      在俩字符串中找最长公共子串
 *  @see        https://www.geeksforgeeks.org/longest-common-substring-dp-29/
 */
- (NSString *)longestCommonSubStringOf:(NSString *)aStr andString:(NSString *)bStr {
    if (aStr.length == 0 || bStr.length == 0) {
        return @"";
    }
    
    long dp[aStr.length+1][bStr.length+1];
    memset(dp, 0, (aStr.length + 1) * (bStr.length + 1) * sizeof(long));
    
    long max = 0;
    int end = 0;
    
    for (int i = 1; i <= aStr.length; i++) {
        for (int j = 1; j <= bStr.length; j++) {
            if ([aStr characterAtIndex:i-1] == [bStr characterAtIndex:j-1]) {
                dp[i][j] = dp[i-1][j-1] + 1;
                
                if (dp[i][j] > max) {
                    max = dp[i][j];
                    end = i;
                }
            }
        }
    }
    
    NSUInteger loc = (end - 1) - (max - 1);
    return [aStr substringWithRange:NSMakeRange(loc, max)];
}

- (void)letterCombinations:(NSMutableArray *)combinations forDigits:(NSArray<NSNumber *> *)digits withConstructingStr:(NSMutableString *)str andDict:(NSDictionary *)dict {
    if (str.length == digits.count) {
        [combinations addObject:str.copy];
        return;
    }
    
    NSString *chars = dict[digits[str.length]];
    for (int i = 0; i < chars.length; i++) {
        unichar ch = [chars characterAtIndex:i];
        [str appendFormat:@"%c", ch];
        [self letterCombinations:combinations forDigits:digits withConstructingStr:str andDict:dict];
        [str deleteCharactersInRange:NSMakeRange(str.length - 1, 1)];
    }
}

/*!
 *  @brief      电话号码的字母组合
 */
- (NSArray<NSString *> *)letterCombinations:(NSArray<NSNumber *> *)digits {
    NSMutableArray<NSString *> *results = [NSMutableArray new];
    
    if (digits.count == 0) {
        return [results copy];
    }
    
    
    NSDictionary *dict = @{@0: @"",
     @1: @"",
     @2: @"abc",
     @3: @"def",
     @4: @"ghi",
     @5: @"jkl",
     @6: @"mno",
     @7: @"pqrs",
     @8: @"tuv",
     @9: @"wxyz",
    };
    
    [self letterCombinations:results forDigits:digits withConstructingStr:[@"" mutableCopy] andDict:dict];
    
    return [results copy];
}

@end
