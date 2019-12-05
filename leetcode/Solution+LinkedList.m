//
//  Solution+LinkedList.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/28.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution+LinkedList.h"

@implementation ListNode

- (instancetype)initWithVal:(NSInteger)value {
    if (self = [super init]) {
        self.value = value;
    }
    
    return self;
}

- (NSString *)description {
    NSMutableArray *values = [NSMutableArray new];
    
    
    ListNode *node = self;
    while (node) {
        [values addObject:@(node.value)];
        node = node.next;
    }
    
    return [NSString stringWithFormat:@"%@", values];
}

@end

@implementation Solution (LinkedList)

- (ListNode *)removeNth:(NSUInteger)n fromEndOfList:(ListNode *)head {
    // 不删任何元素
    if (n == 0) {
        return head;
    }
    
    ListNode *dummyNode = [[ListNode alloc] initWithVal:0];
    dummyNode.next = head;
    
    // 初始 preDeleteNode 指向 dummyNode
    ListNode *preDeleteNode = dummyNode;
    
    // 移动 head 使得 dummy 和 head 间的距离，等于目标 preDeleteNode 和最后的 nil 间的距离
    for (int i = 0; i < n; i++) {
        if (!head) {
            return nil;
        }
        
        head = head.next;
    }
    
    // 同步移动 preDeleteNode 和 head，使得 head 移动到最后的 nil 处
    while (head) {
        head = head.next;
        preDeleteNode = preDeleteNode.next;
    }
    
    // 此时 preDeleteNode 就是要删除的节点前的那个
    preDeleteNode.next = preDeleteNode.next.next;
    
    return dummyNode.next;
}

/*!
 *  @brief      将排序后的两个 List 合并成一个有序列表
 */
- (ListNode *)mergeList:(ListNode *)headA withAnother:(ListNode *)headB {
    ListNode *dummyNode = [[ListNode alloc] initWithVal:0];
    ListNode *pnode = dummyNode;
    
    while (headA && headB) {
        if (headA.value <= headB.value) {
            pnode.next = headA;
            headA = headA.next;
        } else {
            pnode.next = headB;
            headB = headB.next;
        }
        
        pnode = pnode.next;
    }
    
    if (headA) {
        pnode.next = headA;
    }
    
    if (headB) {
        pnode.next = headB;
    }
    
    return dummyNode.next;
}

@end
