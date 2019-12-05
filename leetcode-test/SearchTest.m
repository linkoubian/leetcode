//
//  SearchTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/11/27.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution+Search.h"

@interface SearchTest : XCTestCase

@end

@implementation SearchTest

- (void)testBinarySearch {
    NSArray *array = @[@-16, @2, @8, @21, @48, @51, @73, @73, @91];
    NSInteger pos = [[Solution new] search:48 inArray:array];
    XCTAssert(pos == 4);
    
    pos = [[Solution new] search:100 inArray:array];
    XCTAssert(pos == -1);
    
    pos = [[Solution new] search:2 inArray:array];
    XCTAssert(pos == 1);
    
    pos = [[Solution new] search:73 inArray:array];
    XCTAssert(pos == 6 || pos == 7);
}

- (void)testMedianOfArray {
    NSArray *aArray = @[@1, @2, @3];
    NSArray *bArray = @[            @4, @5, @6];
    double median = [[Solution new] medianOfArray:aArray andArray:bArray];
    XCTAssert(ABS(median - 3.5) < DBL_EPSILON);
    
    aArray = @[@1, @2];
    bArray = @[         @3, @4, @5];
    median = [[Solution new] medianOfArray:aArray andArray:bArray];
    XCTAssert(ABS(median - 3) < DBL_EPSILON);
    
    aArray = @[@1, @2];
    bArray = @[         @3, @4, @5, @6];
    median = [[Solution new] medianOfArray:aArray andArray:bArray];
    XCTAssert(ABS(median - 3.5) < DBL_EPSILON);
    
    aArray = @[@1, @2];
    bArray = @[         @3, @4, @5, @6, @7];
    median = [[Solution new] medianOfArray:aArray andArray:bArray];
    XCTAssert(ABS(median - 4) < DBL_EPSILON);
    
    aArray = @[    @2,      @4];
    bArray = @[@1,      @3,     @5];
    median = [[Solution new] medianOfArray:aArray andArray:bArray];
    XCTAssert(ABS(median - 3) < DBL_EPSILON);
    
    aArray = @[             @9, @10];
    bArray = @[@2, @4, @6];
    median = [[Solution new] medianOfArray:aArray andArray:bArray];
    XCTAssert(ABS(median - 6) < DBL_EPSILON);
    
    aArray = @[];
    bArray = @[@2, @4, @6];
    median = [[Solution new] medianOfArray:aArray andArray:bArray];
    XCTAssert(ABS(median - 4) < DBL_EPSILON);
    
    aArray = @[];
    bArray = @[];
    median = [[Solution new] medianOfArray:aArray andArray:bArray];
    XCTAssert(ABS(median - 0) < DBL_EPSILON);
}

- (void)testSqrt {
    NSInteger sqrt = [[Solution new] sqrt:2];
    XCTAssert(sqrt == 1);
    
    sqrt = [[Solution new] sqrt:3];
    XCTAssert(sqrt == 1);
    
    sqrt = [[Solution new] sqrt:4];
    XCTAssert(sqrt == 2);
    
    sqrt = [[Solution new] sqrt:5];
    XCTAssert(sqrt == 2);
}

- (void)testRangeOfKeyInArray {
    NSArray *array = @[@-16, @2, @8, @21, @48, @51, @73, @73, @91];
    NSArray *result = [[Solution new] rangeOfTarget:73 inArray:array];
    XCTAssert([result[0] integerValue] == 6);
    XCTAssert([result[1] integerValue] == 7);
    
    result = [[Solution new] rangeOfTarget:1 inArray:array];
    XCTAssert([result[0] integerValue] == -1);
    XCTAssert([result[1] integerValue] == -1);
    
    result = [[Solution new] rangeOfTarget:8 inArray:array];
    XCTAssert([result[0] integerValue] == 2);
    XCTAssert([result[1] integerValue] == 2);
}

@end
