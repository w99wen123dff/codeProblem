//
//  PermuteUnique.swift
//  codeProblem
//
//  Created by w99wen on 2019/12/31.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

class PermuteUnique: NSObject {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted();
        var result = [[Int]]();
        backTrace(sortedNums, [], &result);
        return result;
    }
    
    func backTrace(_ leftNums:[Int], _ midway:[Int], _ result: inout [[Int]])  {
        if leftNums.count == 0 {
            result.append(midway);
            return;
        }
        
        var i = -1;
        
        while i < leftNums.count {
            var leftNumsCopy = Array(leftNums);
            
            var midwayCopy = Array(midway);
            var nextIndex = 0;
            if i < 0 {
                nextIndex = 0;
            } else {
                nextIndex = nextDiffNumIndex(leftNumsCopy, i);
            }
            if nextIndex < 0 {
                return;
            } else {
                i = nextIndex;
                midwayCopy.append(leftNums[i]);
                leftNumsCopy.remove(at: i);
                backTrace(leftNumsCopy, midwayCopy, &result);
            }
        }
    }
    
    func nextDiffNumIndex(_ nums:[Int], _ index: Int) -> Int {
        if index < 0 {
            return -1;
        } else if index >= nums.count {
            return -1;
        }
        if nums.last! == nums[index] {
            return -1;
        }
        for i in index + 1 ..< nums.count {
            if nums[i] > nums[index] {
                return i;
            }
        }
        return -1;
    }
}
