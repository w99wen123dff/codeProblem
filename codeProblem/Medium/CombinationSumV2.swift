//
//  CombinationSumV2.swift
//  codeProblem
//
//  Created by w99wen on 2019/12/31.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

class CombinationSumV2: NSObject {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result:[[Int]] = [];
        let sortedCandidates = candidates.sorted();
        backtrackV2([], 0, sortedCandidates, target, &result);
        return result;
    }
    private func backtrackV2(_ subArray:[Int], _ legalIndexs:Int,_ candidates: [Int], _ target: Int, _ result:inout [[Int]]) {
        if target == 0 {
            result.append(subArray);
            return;
        } else if legalIndexs >= candidates.count {
            return;
        } else if target < candidates[legalIndexs] {
            return;
        }
        
        for index in legalIndexs ..< candidates.count {
            if index > legalIndexs && candidates[index] == candidates[index - 1]{
                continue;
            }
            if candidates[index] > target { // 剪枝
                break
            }
            var subArray2:[Int] = Array(subArray);
            subArray2.append(candidates[index]);
            backtrackV2(subArray2, index + 1, candidates, target - candidates[index], &result);
        }
    }
}
