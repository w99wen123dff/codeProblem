//
//  ArraySearchRange.swift
//  codeProblem
//
//  Created by w99wen on 2019/12/4.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa
/*
 基本思路：
 二分查找的变体，每次二分查找的结果，有两种情况
 1. 如果没找到：那就不用找了，肯定没有了
 2. 如果找到了：设最后一次二分的时候，左边的index值为leftIndex，右边的为rightIndex，找到的位置为targetValueIndex，目标值为target
    那么index小于等于leftIndex的元素肯定都是小于target的，index大于等于rightIndex的元素都肯定大于target。
    那么就只需要继续查找左区间： leftIndex < index < targetValueIndex 和右区间： targetValueIndex < index < rightIndex这两个区间中，是否存在target，如果存在，说明需要继续以上过程，直到左边的区间找不到target， 右区间也找不到target。
    由此就得到了最终的leftIndex，rightIndex
 */
/*
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 你的算法时间复杂度必须是 O(log n) 级别。

 如果数组中不存在目标值，返回 [-1, -1]。

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: [3,4]
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: [-1,-1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class ArraySearchRange: NSObject {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var leftIndex = nums.count;
        var rightIndex = -1;
        let result = binarySearch(nums, target, 0, nums.count - 1);
        if result.count == 1 && result[0] == -1 {
            return [-1, -1];
        } else {
            var leftResult = result;
            while !(leftResult.count == 1 && leftResult[0] == -1) {
                if leftResult[1] < leftIndex {
                    leftIndex = leftResult[1];
                }
                leftResult = binarySearch(nums, target, leftResult[0], leftResult[1] - 1);
            }
            
            
            var rightResult = result;
            while !(rightResult.count == 1 && rightResult[0] == -1) {
                if rightResult[1] > rightIndex {
                    rightIndex = rightResult[1];
                }
                rightResult = binarySearch(nums, target, rightResult[1] + 1, rightResult[2]);
            }
        }
        return [leftIndex, rightIndex];
    }
    
    func binarySearch(_ nums: [Int], _ target: Int, _ start:Int, _ end:Int) -> [Int] {
        if start > end {
            return [-1];
        }
        let middleIndex = (start + end) / 2;
        let middleValue = nums[middleIndex];
        if middleValue == target {
            return [start, middleIndex, end];
        } else if middleValue > target {
            return binarySearch(nums, target, start, middleIndex - 1);
        } else {
            return binarySearch(nums, target, middleIndex + 1, end);
        }
    }
}
