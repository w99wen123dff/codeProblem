//
//  ListNodeSum.swift
//  codeProblem
//
//  Created by w99wen on 2019/11/27.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa
/*
 给出两个 非空 的链表用来表示两个非负的整数。
 其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class ListNodeSum: NSObject {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result: ListNode? = addTwoNumbers2(l1, l2, 0);
        return result;
    }
    
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?, _ extraNum: Int) -> ListNode? {
        if (l1 == nil && l2 == nil && extraNum <= 0) {
            return nil;
        }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + extraNum;
        let upperNum = sum / 10;
        let lowerNum = sum % 10;
        let result: ListNode? = ListNode(lowerNum);
        result?.next = addTwoNumbers2(l1?.next, l2?.next, upperNum);
        return result;
    }
}
