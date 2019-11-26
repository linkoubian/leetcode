//
//  Solution.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution.h"

/*!
 *  @brief      打印二维数组
 *  @see        https://www.tutorialspoint.com/objective_c/objective_c_multi_dimensional_arrays.htm
 */
void printArrays(int row, int col, long data[row][col]) {
    printf("\n");
    
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            printf("%4ld", data[i][j]);
        }
        
        printf("\n");
    }
    
    printf("\n");
}

@implementation Solution

@end
