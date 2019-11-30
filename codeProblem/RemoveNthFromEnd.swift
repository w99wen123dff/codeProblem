//
//  RemoveNthFromEnd.swift
//  codeProblem
//
//  Created by w99wen on 2019/11/30.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

/*
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

 示例：

 给定一个链表: 1->2->3->4->5, 和 n = 2.

 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：

 给定的 n 保证是有效的。

 进阶：

 你能尝试使用一趟扫描实现吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class RemoveNthFromEnd: NSObject {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n <= 0 {
            return head;
        }
        if head == nil {
            return head;
        }
        var formerTargetNodeFound = false;
        var count = 1;
        var endNode:ListNode = head!;
        var formerTargetNode:ListNode?;
        while endNode.next != nil {
            endNode = endNode.next!;
            if formerTargetNodeFound {
                formerTargetNode = formerTargetNode?.next;
            }
            if count == n {
                formerTargetNode = head;
                formerTargetNodeFound = true
            }
            count += 1;
        }
        if formerTargetNodeFound {
            let temp = formerTargetNode?.next;
            formerTargetNode?.next = formerTargetNode?.next?.next;
            temp?.next = nil;
            return head;
        } else {
            if count == n {
                return head?.next;
            }
        }
        return nil;
    }
}
