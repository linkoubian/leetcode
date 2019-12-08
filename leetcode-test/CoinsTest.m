//
//  CoinsTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/11/25.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution+Coins.h"

@interface CoinsTest : XCTestCase

@end

@implementation CoinsTest

- (void)testMinCountOfCoins {
    NSUInteger minCount = [[Solution  new] minCountOfCoinsFor:10 with:@[@2, @5, @3, @6]];
    NSLog(@"minCountOfCoins is %tu", minCount);
    
    XCTAssert(minCount == 2);
}

- (void)testCountOfWays {
    NSUInteger ways = [[Solution  new] countOfWaysFor:10 with:@[@2, @5, @3, @6]];
    NSLog(@"count of ways is %tu", ways);
    
    XCTAssert(ways == 5);
}

- (void)testCombinationsOfTarget {
    NSArray *candidates = @[@2, @6, @3, @7];
    NSArray *combinations = [[Solution new] combinationsToTarget:7 with:candidates];
    NSLog(@"combinations: %@", combinations);
}

@end
