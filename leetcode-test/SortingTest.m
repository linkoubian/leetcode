//
//  SortingTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution+Sorting.h"

@interface SortingTest : XCTestCase

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation SortingTest

- (void)setUp {
    for (int i = 0; i < 10; i++) {
        [self.array addObject:@(arc4random() % 100)];
    }
}

- (void)tearDown {
    [self.array removeAllObjects];
}

- (void)testBubbleSort {
    NSLog(@"Bubble sort result: %@", [[Solution new] bubbleSort:self.array]);
}

- (void)testQuickSort {
    NSLog(@"Quick sort result: %@", [[Solution new] quickSort:self.array fromLeft:0 toRight:self.array.count-1]);
}

#pragma mark - Properties

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray new];
    }
    
    return _array;
}

@end
