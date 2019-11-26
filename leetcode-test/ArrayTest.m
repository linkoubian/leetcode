//
//  ArrayTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/11/25.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution+Array.h"

@interface ArrayTest : XCTestCase

@end

@implementation ArrayTest

- (void)testMaxSubArray {
    NSArray *array = @[@-2, @1, @-3, @4, @-1, @2, @1, @-5, @4];
    NSInteger max = [[Solution new] maxSubArray:array];
    NSLog(@"maxSubArray is %zd", max);
    XCTAssert(max == 6);
    
    array = @[];
    max = [[Solution new] maxSubArray:array];
    NSLog(@"maxSubArray is %zd", max);
    XCTAssert(max == 0);
    
    array = @[@1];
    max = [[Solution new] maxSubArray:array];
    NSLog(@"maxSubArray is %zd", max);
    XCTAssert(max == 1);
}

- (void)testMaxSubArray_C {
    int array[9] = {-2, 1, -3, 4, -1, 2, 1, -5, 4};
    int count = (int)sizeof(array) / sizeof(int);
    printf("count of array is %d\n", count);
    int max = [[Solution new] maxSubArray:array withCount:count];
    printf("max of sub array is %d\n", max);
    XCTAssert(max == 6);
}

- (void)testMaxSubArray_DP {
    NSArray *array = @[@-2, @1, @-3, @4, @-1, @2, @1, @-5, @4];
    NSInteger max = [[Solution new] maxSubArrayDP:array];
    NSLog(@"maxSubArray is %zd", max);
    XCTAssert(max == 6);
}

@end
