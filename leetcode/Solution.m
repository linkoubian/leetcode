//
//  Solution.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution.h"

/*!
 *  @brief      打印二维数组
 *  @see        https://www.tutorialspoint.com/objective_c/objective_c_multi_dimensional_arrays.htm
 */
void printArrays(int row, int col, long data[row][col]) {
    printf("\n");
    
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            printf("%4ld", data[i][j]);
        }
        
        printf("\n");
    }
    
    printf("\n");
}

@implementation Solution

- (BOOL)isAnagramString:(NSString *)strA with:(NSString *)strB {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    for (int i = 0; i < strA.length; i++) {
        unichar ch = [strA characterAtIndex:i];
        if (ch == ' ') {
            continue;
        }
        
        if (dict[@(ch)]) {
            dict[@(ch)] = @([dict[@(ch)] integerValue] + 1);
        } else {
            dict[@(ch)] = @(1);
        }
    }
    
    for (int i = 0; i < strB.length; i++) {
        unichar ch = [strB characterAtIndex:i];
        if (ch == ' ') {
            continue;
        }
        
        if (!dict[@(ch)] || [dict[@(ch)] integerValue] == 0) {
            return NO;
        }
        
        dict[@(ch)] = @([dict[@(ch)] integerValue] - 1);
    }
    
    for (NSNumber *num in [dict allValues]) {
        if ([num integerValue] > 0) {
            return NO;
        }
    }
    
    return YES;
}

- (NSArray *)groupAnagrams:(NSArray<NSString *> *)lines {
    NSMutableArray *results = [NSMutableArray new];
    NSMutableArray *visited = [NSMutableArray new];
    
    for (int i = 0; i < lines.count; i++) {
        if ([visited containsObject:@(i)]) {
            continue;
        }
        
        NSString *word = lines[i];
        NSMutableArray *words = [@[word] mutableCopy];
        
        for (int j = i+1; j < lines.count; j++) {
            if ([self isAnagramString:word with:lines[j]]) {
                [words addObject:lines[j]];
                [visited addObject:@(j)];
            }
        }
        
        NSArray *sortedWords = [words sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        NSString *sortedWordsString = [sortedWords componentsJoinedByString:@","];
        [results addObject:sortedWordsString];
    }
    
    return [results sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (NSString *)keyForWord:(NSString *)word {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < word.length; i++) {
        unichar ch = [word characterAtIndex:i];
        
        if (ch == ' ') {
            continue;
        }
        
        [array addObject:[NSString stringWithFormat:@"%c", ch]];
    }
    
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return [sortedArray componentsJoinedByString:@""];
}

- (NSArray *)groupAnagrams_v2:(NSArray<NSString *> *)words {
    // 单词（字符串）按字母排序后作为 KEY，则属于 anagram 的对应同一个 KEY；
    // 根据上述 KEY 分组单词。
    NSMutableDictionary *dict = [NSMutableDictionary new];
    
    for (NSString *word in words) {
        NSString *key = [self keyForWord:word];
        
        if (!dict[key]) {
            NSMutableArray *array = [NSMutableArray new];
            dict[key] = array;
        }
        
        [dict[key] addObject:word];
    }
    
    // 每个分组的所有单词按字母排序后用逗号连接，并存入到结果字符串数组
    NSMutableArray *results = [NSMutableArray new];
    
    for (NSArray *words in [dict allValues]) {
        NSArray *sortedWords = [words sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        NSString *sortedWordsStr = [sortedWords componentsJoinedByString:@","];
        [results addObject:sortedWordsStr];
    }
    
    // 结果字符串数组再按字母排序，返回排序后的数组
    return [results sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

+ (NSInteger)priceRounding:(NSInteger)cents withN:(NSUInteger)n {
    int roundUnit = (int)pow(10, n);
    NSInteger roundedA = cents / roundUnit * roundUnit;
    NSInteger roundedB = roundedA + roundUnit * (cents > 0 ? 1 : -1);
    
    if (ABS(cents - roundedA) == ABS(cents - roundedB)) {
        return cents > 0 ? roundedB : roundedA;
    } else if (ABS(cents - roundedA) < ABS(cents - roundedB)) {
        return roundedA;
    } else {
        return roundedB;
    }
}

+ (NSArray *)polygonCount:(NSArray *)sidesArray {
    NSMutableArray *results = [NSMutableArray new];
    results[0] = @0;
    results[1] = @0;
    results[2] = @0;
    results[3] = @0;
    
    for (int i = 0; i < sidesArray.count; i++) {
        NSString *sidesString = sidesArray[i];
        NSArray *sides = [sidesString componentsSeparatedByString:@" "];
        
        BOOL existsNegative = NO;
        for (int i = 0; i < sides.count; i++) {
            if ([sides[i] integerValue] <= 0) {
                existsNegative = YES;
                break;
            }
        }
        
        if (existsNegative) {
            results[3] = @([results[3] integerValue] + 1);
            continue;
        }
        
        // not polygons
        if (sides.count < 3) {
            results[3] = @([results[3] integerValue] + 1);
        }
        // other polygons with 3 or 5 or more sides
        else if (sides.count == 3 || sides.count > 4) {
            results[2] = @([results[2] integerValue] + 1);
        }
        // 4 sides
        else {
            // all sides equal to each other
            if ([sides[0] integerValue] == [sides[1] integerValue]
                && [sides[1] integerValue] == [sides[2] integerValue]
                && [sides[2] integerValue] == [sides[3] integerValue]) {
                results[0] = @([results[0] integerValue] + 1);
            }
            // side equals to the opposite one
            else if ([sides[0] integerValue] == [sides[2] integerValue] && [sides[1] integerValue] == [sides[3] integerValue]) {
                results[1] = @([results[1] integerValue] + 1);
            }
            // other polygons with 4 sides
            else {
                results[2] = @([results[2] integerValue] + 1);
            }
        }
    }
    
    return results;
}

@end
