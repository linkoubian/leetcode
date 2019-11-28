//
//  Solution+LinkedList.h
//  leetcode
//
//  Created by Linkou Bian on 2019/11/28.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution.h"

@interface ListNode : NSObject

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) ListNode *next;

- (instancetype)initWithVal:(NSInteger)value;

@end

@interface Solution (LinkedList)

- (ListNode *)removeNth:(NSUInteger)n fromEndOfList:(ListNode *)head;

@end
