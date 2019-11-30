//
//  MergeSort.swift
//  codeProblem
//
//  Created by w99wen on 2019/11/30.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

class MergeSort: NSObject {
    func mergeSort(_ nums:inout [Int]) {
        var temp = Array(repeating: 0, count: nums.count);
        sort(0, nums.count - 1, &nums, &temp);
    }
    
    func sort(_ left:Int, _ right:Int, _ nums:inout [Int], _ temp:inout [Int]) {
        if left < right {
            let mid:Int = (right + left) / 2;
            sort(left, mid, &nums, &temp);
            sort(mid + 1, right, &nums, &temp);
            merge(left, mid, mid + 1, right, &nums, &temp);
        }
    }
    
    func merge(_ leftStart:Int, _ leftEnd:Int, _ rightStart:Int, _ rightEnd:Int, _ nums:inout [Int], _ temp:inout [Int]) {
        var mergeLeftPos = leftStart;
        var mergeRightPos = rightStart;
        var i = 0;
        while mergeLeftPos <= leftEnd && mergeRightPos <= rightEnd {
            if (nums[mergeLeftPos] <= nums[mergeRightPos]) {
                temp[i] = nums[mergeLeftPos];
                mergeLeftPos += 1;
            } else {
                temp[i] = nums[mergeRightPos];
                mergeRightPos += 1;
            }
            i += 1;
        }
        
        while mergeLeftPos <= leftEnd {
            temp[i] = nums[mergeLeftPos];
            mergeLeftPos += 1;
            i += 1;
        }
        
        while mergeRightPos <= rightEnd {
            temp[i] = nums[mergeRightPos];
            mergeRightPos += 1;
            i += 1;
        }
        i = 0;
        for j in leftStart ... leftEnd {
            nums[j] = temp[i];
            i += 1;
        }
        
        for j in rightStart ... rightEnd {
            nums[j] = temp[i];
            i += 1;
        }
    }
}
