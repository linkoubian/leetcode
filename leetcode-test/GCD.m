//
//  GCD.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/12/21.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GCD : XCTestCase

@end

@implementation GCD

- (void)testSerialQueue {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.balloonsys.leetcode.serialqueue", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(serialQueue, ^{
            NSLog(@"%d", i+1);
        });
    }
}

- (void)testConcurentQueue {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.balloonsys.leetcode.concurrentqueue", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(concurrentQueue, ^{
            NSLog(@"%d", i+1);
        });
    }
}

@end
