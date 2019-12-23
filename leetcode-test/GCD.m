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

- (void)logNumber:(NSNumber *)num {
    NSLog(@"%zd", [num integerValue]);
    
    int i = 0;
    while (i < 100000) {
        i++;
    }
}

- (void)testPerformSelector {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.balloonsys.leetcode.performselector", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        NSLog(@"1");
        [self performSelector:@selector(logNumber:) withObject:@2 afterDelay:0]; // 不手动 run 当前的 RunLoop 则 selector 是不会执行的
        [[NSRunLoop currentRunLoop] run]; // 必须写在 performSelector:withObject:afterDelay: 后面
        [self performSelectorOnMainThread:@selector(logNumber:) withObject:@3 waitUntilDone:NO];
        NSLog(@"5");
        [self performSelectorOnMainThread:@selector(logNumber:) withObject:@6 waitUntilDone:YES];
        NSLog(@"7");
        [self performSelector:@selector(logNumber:) withObject:@8];
        NSLog(@"9");
        [self logNumber:@10];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.000000001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"X");
    });
}

@end
