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

@end
