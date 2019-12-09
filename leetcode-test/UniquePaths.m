//
//  UniquePaths.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/12/9.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution+UniquePaths.h"

@interface UniquePaths : XCTestCase

@end

@implementation UniquePaths

- (void)testUniquePaths {
    NSArray *obstacles = @[
                            @[@0, @0, @0],
                            @[@0, @1, @0],
                            @[@0, @0, @0]
    ];
    NSUInteger paths = [[Solution new] uniquePathsWithObstacles:obstacles];
    XCTAssert(paths == 2);
}

@end
