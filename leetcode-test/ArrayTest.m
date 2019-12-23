//
//  ArrayTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/11/25.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution+Array.h"
#import "NSArray+DeltaCoder.h"
#import "Solution.h"

@interface ArrayTest : XCTestCase

@end

@implementation ArrayTest

- (void)testArrayDeltaCoder {
    NSArray *array = @[@1000, @-128, @-1000, @100];
    NSArray *result = [array deltaDecoded];
    NSLog(@"%@", result);
    
    array = @[@25626, @-128, @131, @-128, @-1390, @-100, @-128, @-24251, @84, @-98, @-128, @7275];
    result = [array deltaDecoded];
    NSLog(@"%@", result);
}

- (void)testAnagrams {
    NSArray *array = @[@"pear", @"amleth", @"dormitory", @"tinsel", @"dirty room", @"hamlet", @"listen", @"silent"];
    NSArray *result = [[Solution new] groupAnagrams:array];
    NSLog(@"%@", result);
}

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

- (void)testRemoveDuplicates {
    NSArray *array = @[@0, @1, @1, @2];
    NSArray *results = [[Solution new] removeDuplicates:array.mutableCopy];
    NSLog(@"removeDuplicates: %@", results);
    XCTAssert([results count] == 3);
}

- (void)testBlockWithInt {
    int num = 3;
    
    int(^block)(int) = ^int(int n) {
        NSLog(@"num is %d", num);
        return num * n;
    };
    
    num = 1;
    NSLog(@"%d", block(2));
}

- (void)testBlockWithMutableString {
    __block NSMutableString *s = [[NSMutableString alloc] initWithFormat:@"%d", 1];
    
    void(^block)(void) = ^ {
        s = [NSMutableString stringWithFormat:@"%d", 99];
        [s appendFormat:@", %d", 2];
        NSLog(@"%@", s);
        NSLog(@"in: %p", s);
    };
    
    [s appendFormat:@", %d", 3];
    NSLog(@"out: %p", s);
    block();
}

- (void)testBlockWithMutableArray {
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1, @2, nil];
    
    void(^block)(void) = ^ {
        NSLog(@"%@", array);
        [array addObject:@3];
        NSLog(@"%@", array);
    };
    
    [array addObject:@4];
    array = nil;

    NSLog(@"%@", array);
    block();
}

@end
