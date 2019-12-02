//
//  ThreeSum.swift
//  codeProblem
//
//  Created by w99wen on 2019/11/29.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa
/*
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

 满足要求的三元组集合为：
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class ThreeSum: NSObject {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return[];
        } else if nums.count == 3 {
            if nums[0] + nums[1] + nums[2] == 0 {
                return [nums];
            } else {
                return [];
            }
        }
        let sortedNums = nums.sorted();
        var result = [[Int]]();
        var lPos = 0;
        var mPos = 0;
        var rPos = sortedNums.count - 1;
        
        while rPos - lPos > 2 && sortedNums[lPos] + sortedNums[rPos] + sortedNums[rPos - 1] < 0 {
            lPos += 1;
        }
        
        while rPos - lPos > 2 && sortedNums[lPos] + sortedNums[lPos + 1] + sortedNums[rPos] > 0 {
            rPos -= 1;
        }
        
        if rPos - lPos == 2 {
            if sumOfRange(lPos, rPos, nums) == 0{
                return [Array(nums[lPos ... rPos])];
            } else {
                return [];
            }
        }
        
        while rPos - lPos > 2 {
            
        }
        
        return result;
    }
    
    func sumOfRange(_ left:Int, _ right:Int, _ nums:[Int]) -> Int{
        if left < 0 || right >= nums.count {
            return -1;
        } else {
            var sum = 0;
            for i in left ... right {
                sum += nums[i];
            }
            return sum;
        }
    }
}
