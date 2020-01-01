//
//  Permute.swift
//  codeProblem
//
//  Created by w99wen on 2019/12/31.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

/*
 给定一个没有重复数字的序列，返回其所有可能的全排列。

 示例:

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutations
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Permute: NSObject {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]();
        backTrace(nums, [], &result);
        return result;
    }
    
    func backTrace(_ leftNums: [Int], _ midway: [Int], _ result: inout [[Int]]) {
        if leftNums.count == 0 {
            result.append(midway);
            return;
        }
        
        for i in 0 ..< leftNums.count {
            var tmp = Array(midway);
            tmp.append(leftNums[i])
            
            var tmp2 = Array(leftNums);
            tmp2.remove(at: i);
            backTrace(tmp2, tmp, &result);
        }
    }
}
