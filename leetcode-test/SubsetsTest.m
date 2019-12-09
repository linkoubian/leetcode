//
//  SubsetsTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/12/9.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution+Subsets.h"

@interface SubsetsTest : XCTestCase

@end

@implementation SubsetsTest

- (void)testSubsets {
    NSArray *sourceArray = @[@1, @2, @3];
    NSArray *subsets = [[Solution new] subsetsOfArray:sourceArray];
    NSLog(@"subsets: %@", subsets);
    XCTAssert(subsets.count == 8);
}

@end
