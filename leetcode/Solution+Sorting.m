//
//  Solution+Sorting.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution+Sorting.h"

@implementation Solution (Sorting)

- (NSArray *)bubbleSort:(NSMutableArray *)array {
    for (int i = ((int)array.count - 2); i >= 0; i--) {
        for (int j = 0; j <= i; j++) {
            if ([array[j] compare:array[j + 1]] == NSOrderedDescending) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:(j + 1)];
            }
        }
    }
    
    return [array copy];
}

- (NSArray *)quickSort:(NSMutableArray *)array fromLeft:(NSInteger)left toRight:(NSInteger)right {
    NSInteger i = left;
    NSInteger j = right;
    
    NSInteger pivotIndex = (left + right) / 2;
    if (pivotIndex < 0 || pivotIndex > (int)array.count - 1) {
        return [array copy];
    }
    
    id pivot = array[pivotIndex];
    
    while (i <= j) {
        while (([array[i] compare:pivot] == NSOrderedAscending) && (i < right)) {
            i++;
        }
        
        while (([array[j] compare:pivot] == NSOrderedDescending) && (j > left)) {
            j--;
        }
        
        if (i <= j) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            
            i++;
            j--;
        }
    }
    
    if (left < j) {
        [self quickSort:array fromLeft:left toRight:j];
    }
    
    if (i < right) {
        [self quickSort:array fromLeft:i toRight:right];
    }
    
    return [array copy];
}

@end
