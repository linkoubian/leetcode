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
    
    return YES;
}

- (NSString *)alphabeticallyString:(NSMutableArray *)array {
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return [sortedArray componentsJoinedByString:@","];
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
        
        [results addObject:[self alphabeticallyString:words]];
    }
    
    return [results copy];
}

@end
