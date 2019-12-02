//
//  NextPermutation.swift
//  codeProblem
//
//  Created by w99wen on 2019/12/3.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa
/*
 实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。

 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。

 必须原地修改，只允许使用额外常数空间。

 以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/next-permutation
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class NextPermutation: NSObject {
    func nextPermutationBetter(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }

        for i in (0..<(nums.count - 1)).reversed() {
            if nums[i] < nums[i + 1] {
                for j in ((i + 1)..<nums.count).reversed() {
                    if nums[j] > nums[i] {
                        nums.swapAt(i, j)
                        break
                    }
                }
                var j = i + 1
                var k = nums.count - 1
                while k > j {
                    nums.swapAt(j, k)
                    j += 1
                    k -= 1
                }
                return
            }
        }
                var j = 0
                var k = nums.count - 1
        while k > j {
                nums.swapAt(j, k)
                j += 1
                k -= 1
            }
    }
    
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count == 0 || nums.count == 1 {
            return;
        } else if nums.count == 2 {
            swapAll(&nums);
        } else {
            var isDesc = true;
            var lastTurningPoint = 0;
            var lastNum = nums[0];
            
            var lastFitNum = 0;
            var lastFitNumPoint = 0;
            var minNum = nums[0];
            var maxNum = nums[0];
            for (index, value) in nums[1 ..< nums.count].enumerated() {
                if value > lastNum {
                    isDesc = false;
                    lastTurningPoint = index + 1;
                    minNum = nums[index];
                    maxNum = value;
                    lastFitNum = value;
                    lastFitNumPoint = index + 1;
                }
                if value > minNum && value < maxNum && value < lastFitNum {
                    lastFitNumPoint = index + 1;
                }
                lastNum = value;
            }
            
            if isDesc {
                swapAll(&nums);
            } else {
                swap1(&nums, lastFitNumPoint, lastTurningPoint - 1);
                sortAfter(&nums, lastTurningPoint);
            }
        }
    }
    
    func swap1(_ nums: inout [Int], _ source:Int, _ target:Int) {
        if nums.count > source && nums.count > target && source >= 0 && target >= 0 {
            let hold = nums[source];
            nums[source] = nums[target];
            nums[target] = hold;
        }
    }
    
    func swapAll(_ nums: inout [Int]) {
        if nums.count == 0 {
            return;
        }
        var source = 0;
        var target = nums.count - 1;
        var hold = 0;
        while source < target {
            hold = nums[source];
            nums[source] = nums[target];
            nums[target] = hold;
            source += 1;
            target -= 1;
        }
    }
    
    func sortAfter(_ nums: inout [Int], _ pos:Int) {
        let tmp = nums[pos ..< nums.count].sorted();
        for (index, value) in tmp.enumerated() {
            nums[index + pos] = value;
        }
    }
}
