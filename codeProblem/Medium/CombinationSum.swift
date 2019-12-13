//
//  CombinationSum.swift
//  codeProblem
//
//  Created by w99wen on 2019/12/13.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa
/*
 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 
 candidates 中的数字可以无限制重复被选取。
 
 说明：
 
 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 示例 1:
 
 输入: candidates = [2,3,6,7], target = 7,
 所求解集为:
 [
 [7],
 [2,2,3]
 ]
 示例 2:
 
 输入: candidates = [2,3,5], target = 8,
 所求解集为:
 [
   [2,2,2,2],
   [2,3,3],
   [3,5]
 ]
 输入: candidates = [2,3,4], target = 9,
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/combination-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class CombinationSum: NSObject {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result:[[Int]] = [];
        let sortedCandidates = candidates.sorted();
        combinationSumV2([], 0, sortedCandidates, target, &result);
        return result;
    }
    
    func combinationSumV2(_ subArray:[Int], _ legalIndexs:Int,_ candidates: [Int], _ target: Int, _ result:inout [[Int]]) {
        if target == 0 {
            result.append(subArray);
            return;
        } else if legalIndexs >= candidates.count {
            return;
        } else if target < candidates[legalIndexs] {
            return;
        }
        var sum = 0;
        var subArray2:[Int] = Array(subArray);
        while sum <= target {
            combinationSumV2(subArray2, legalIndexs + 1, candidates, target - sum, &result);
            subArray2.append(candidates[legalIndexs]);
            sum += candidates[legalIndexs];
        }
    }
}
