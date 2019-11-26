//
//  RobberTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/11/26.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution+Robber.h"

@interface RobberTest : XCTestCase

@end

@implementation RobberTest

- (void)testRobber {
    NSArray *nums = @[@4, @2, @6, @1, @3, @5, @8];
    NSInteger robbed = [[Solution new] rob:nums];
    NSLog(@"The max robbed is %zd", robbed);
    XCTAssert(robbed == 21);
}

@end
