//
//  ArraySearchA.swift
//  codeProblem
//
//  Created by w99wen on 2019/12/4.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa
/*
 基本思路：
    数据是分两段严格递增的（注意，如果存在重复元素，以下结论不成立）
    设中间值为V，第一个值为V0，最后一个为Vn,假设转折点为Vx，目标值为Vt(target value)
    V0, V1, V2 ... Vx? ... V ... Vx? ... Vn
    
    if (V > V0) {
        说明V0 -> V为递增
    }
 
    if (V < V0) {
        说明V -> Vn为递增
    }
 
    所以以上两种情况可以直接知道Vt是否在连续区间内。如果在，直接二分查找，不再，其余部分同样的思路继续查找（递归）
 */
/*
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。

 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。

 你可以假设数组中不存在重复的元素。

 你的算法时间复杂度必须是 O(log n) 级别。

 示例 1:

 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 示例 2:

 输入: nums = [4,5,6,7,0,1,2], target = 3
 输出: -1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-in-rotated-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class ArraySearchNoRepeatNum: NSObject {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return searchV2(nums, target, 0, nums.count - 1)
    }
    
    func searchV2(_ nums: [Int], _ target: Int, _ start:Int, _ end:Int) -> Int {
        if start < 0 || end >= nums.count || start > end {
            return -1;
        }
        if start == end {
            if nums[start] == target {
                return start;
            } else {
                return -1;
            }
        } else if end - start == 1 {
            if nums[start] == target {
                return start;
            } else if nums[end] == target {
                return end;
            } else {
                return -1;
            }
        }
        let middleIndex = (start + end) / 2;
        let middleValue = nums[middleIndex];
        let startValue = nums[start];
        let endValue = nums[end];
        if middleValue > startValue {
            //说明V0 -> V为递增
            if middleValue >= target && startValue <= target {
                return binarySearch(nums, target, start, middleIndex);
            } else {
                return searchV2(nums, target, middleIndex + 1, end);
            }
        } else {
            //说明V -> Vn为递增
            if middleValue <= target && endValue >= target {
                return binarySearch(nums, target, middleIndex, end);
            } else {
                return searchV2(nums, target, start, middleIndex - 1);
            }
        }
    }
    
    func binarySearch(_ nums: [Int], _ target: Int, _ start:Int, _ end:Int) -> Int {
        if start > end {
            return -1;
        }
        let middleIndex = (start + end) / 2;
        let middleValue = nums[middleIndex];
        if middleValue == target {
            return middleIndex;
        } else if middleValue > target {
            return binarySearch(nums, target, start, middleIndex - 1);
        } else {
            return binarySearch(nums, target, middleIndex + 1, end);
        }
    }
}
