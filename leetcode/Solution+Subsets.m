//
//  Solution+Subsets.m
//  leetcode
//
//  Created by Linkou Bian on 2019/12/9.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution+Subsets.h"

@implementation Solution (Subsets)

- (void)subsets:(NSMutableArray *)results withConstructingSet:(NSMutableArray *)tempArray startFrom:(NSUInteger)startIndex ofArray:(NSArray *)sourceArray {
    [results addObject:[tempArray copy]];
    
    for (NSUInteger i = startIndex; i < sourceArray.count; i++) {
        [tempArray addObject:sourceArray[i]];
        [self subsets:results withConstructingSet:tempArray startFrom:i+1 ofArray:sourceArray];
        [tempArray removeLastObject];
    }
}

- (NSArray *)subsetsOfArray:(NSArray *)array {
    NSMutableArray *results = [NSMutableArray new];
    
    if ([array count] == 0) {
        return [results copy];
    }
    
    [self subsets:results withConstructingSet:[NSMutableArray new] startFrom:0 ofArray:array];
    
    return [results copy];
}

@end
