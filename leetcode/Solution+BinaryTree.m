//
//  Solution+BinaryTree.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution+BinaryTree.h"

@implementation TreeNode

- (instancetype)initWithVal:(NSInteger)value {
    if (self = [super init]) {
        self.value = value;
    }
    
    return self;
}

@end

@implementation Solution (BinaryTree)

- (BOOL)isTree:(TreeNode *)rootNodeA sameAsTree:(TreeNode *)rootNodeB {
    // nil && nil
    if (!rootNodeA && !rootNodeB) {
        return YES;
    }
    
    // 走到这里必然有个非 nil, 所以只需额外判断存在一个 nil 即可
    if (!rootNodeA || !rootNodeB) {
        return NO;
    }
    
    // !nil && !nil
    if (rootNodeA.value != rootNodeB.value) {
        return NO;
    }
    
    return [self isTree:rootNodeA.left sameAsTree:rootNodeB.left] && [self isTree:rootNodeA.right sameAsTree:rootNodeB.right];
}

- (BOOL)isTree:(TreeNode *)rootNodeA mirrorOf:(TreeNode *)rootNodeB {
    if (!rootNodeA && !rootNodeB) {
        return YES;
    }
    
    if (!rootNodeA || !rootNodeB) {
        return NO;
    }
    
    if (rootNodeA.value != rootNodeB.value) {
        return NO;
    }
    
    return [self isTree:rootNodeA.left mirrorOf:rootNodeB.right] && [self isTree:rootNodeA.right mirrorOf:rootNodeB.left];
}

- (BOOL)isSymmetricTree:(TreeNode *)rootNode {
    if (!rootNode) {
        return YES;
    }
    
    return [self isTree:rootNode.left mirrorOf:rootNode.right];
}

/*!
 *  @brief      分层访问二叉树的节点 (从左到右, 一层一层的)，核心是使用 Queue 这样的数据结构
 *  @see        http://www.goodtecher.com/zh/leetcode-102-binary-tree-level-order-traversal-二叉树的层次遍历/
 */
- (NSArray *)levelOrderTraversal:(TreeNode *)root {
    NSMutableArray *result = [NSMutableArray new];
    NSMutableArray *queue = [NSMutableArray new];
    
    if (root) {
        [queue addObject:root];
    }
    
    while (queue.count > 0) {
        NSUInteger levelSize = [queue count];
        for (int i = 0; i < levelSize; i++) {
            TreeNode *node = [queue firstObject];
            [queue removeObjectAtIndex:0];
            
            [result addObject:@(node.value)];
            
            if (node.left) {
                [queue addObject:node.left];
            }
            
            if (node.right) {
                [queue addObject:node.right];
            }
        }
    }
    
    return [result copy];
}

/*!
 *  @brief      深度优先（前序），核心是使用 Stack 这样的数据结构
 *  @see        https://blog.csdn.net/My_Jobs/article/details/43451187
 */
- (NSArray *)preorderTraversal:(TreeNode *)root {
    NSMutableArray *result = [NSMutableArray new];
    NSMutableArray *stack = [NSMutableArray new];
    
    if (root) {
        [stack addObject:root];
    }
    
    while (stack.count > 0) {
        TreeNode *node = [stack lastObject];
        [stack removeLastObject];
        
        [result addObject:@(node.value)];
        
        if (node.right) {
            [stack addObject:node.right];
        }
        
        if (node.left) {
            [stack addObject:node.left];
        }
    }
    
    return [result copy];
}

/*!
 *  @brief      中序遍历，核心是使用 Stack 这样的数据结构
 *  @discussion 其实该方案也可用于前序
 *  @see        http://www.goodtecher.com/leetcode-144-binary-tree-preorder-traversal/
 */
- (NSArray *)inorderTraversal:(TreeNode *)root {
    NSMutableArray *result = [NSMutableArray new];
    NSMutableArray *stack = [NSMutableArray new];
    
    TreeNode *pNode = root;
    
    while (pNode || stack.count > 0) {
        if (pNode) {
            [stack addObject:pNode];
            pNode = pNode.left;
        } else {
            TreeNode *node = [stack lastObject];
            [stack removeLastObject];
            
            [result addObject:@(node.value)];
            
            pNode = node.right;
        }
    }
    
    return [result copy];
}

// left,right,root -> root, right, left

/*!
 *  @brief      后序遍历，将 left,right,root 看成 root, right, left 的反转，这样最好实现
 *  @discussion 常规思路是，先遍历到最左端的叶子节点，逐个入栈；
 *              从栈顶开始处理：
 *                  无右节点 or 右节点是刚被访问的，则访问栈顶节点 同时更新刚被访问的节点；
 *                  否则，重新入栈，访问右子树直至其最左端的叶子节点，逐个入栈。
 *  @see        https://blog.csdn.net/zhuqiuhui/article/details/51319165
 */
- (NSArray *)postorderTraversal:(TreeNode *)root {
    NSMutableArray *result = [NSMutableArray new];
    NSMutableArray *stack = [NSMutableArray new];
    
    if (root) {
        [stack addObject:root];
    }
    
    while (stack.count > 0) {
        TreeNode *node = [stack lastObject];
        [stack removeLastObject];
        
        [result addObject:@(node.value)];
        
        if (node.left) {
            [stack addObject:node.left];
        }
        
        if (node.right) {
            [stack addObject:node.right];
        }
    }
    
    return [[result reverseObjectEnumerator] allObjects];
}


@end
