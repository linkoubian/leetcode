//
//  NSArray+DeltaCoder.m
//  leetcode
//
//  Created by Linkou Bian on 2019/12/1.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "NSArray+DeltaCoder.h"

@implementation NSArray (DeltaCoder)

- (NSArray *)deltaDecoded {
    NSMutableArray *result = [NSMutableArray new];
    
    for (int i = 0; i < self.count; i++) {
        NSInteger num = [self[i] integerValue];
        
        if (num == 0) {
            [result addObject:self[i]];
            continue;
        }
        
        if (num == -128) {
            continue;
        }
        
        [result addObject:@(num + [[result lastObject] integerValue])];
    }
    
    return [result copy];
}

@end
