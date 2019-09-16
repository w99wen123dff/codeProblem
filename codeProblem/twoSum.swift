//
//  twoSum.swift
//  codeProblem
//
//  Created by 刘凡 on 2019/9/16.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa
/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 
 示例:
 
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class twoSum: NSObject {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]();
        if nums.count < 2 {
            return result;
        }else if nums.count == 2{
            if nums[0] + nums[1] == target{
                return [0, 1];
            }else{
                return [];
            }
        }else{
            var sortedNums = [[Int]]();
            for i in 0 ..< nums.count{
                sortedNums.append([nums[i], i]);
            }
            
            sortedNums = sortedNums.sorted { (a, b) -> Bool in
                if a[0] < b[0] {
                    return true;
                }else{
                    return false;
                }
            }
            
            let maxSum = sortedNums[sortedNums.count - 1][0] + sortedNums[sortedNums.count - 2][0];
            let minSum = sortedNums[0][0] + sortedNums[1][0];
            if minSum > target {
                return result;
            }else if maxSum < target{
                return result;
            }else{
                var lp:Int = 0;
                var rp:Int = sortedNums.count - 1;
                while lp != rp{
                    let sumNow = sortedNums[lp][0] + sortedNums[rp][0];
                    if sumNow == target{
                        result.append(sortedNums[lp][1]);
                        result.append(sortedNums[rp][1]);
                        return result;
                    }else if sumNow > target{
                        rp -= 1;
                    }else{
                        lp += 1;
                    }
                }
            }
        }
        return [];
    }
}
