// leverages arrays
// space complexity - O(n)
// elements are in a contiguous memory block - could lead to less cache misses which decreases access time

import Foundation

// MARK: - 2 STACK QUEUE

struct QueueStack<T>: Queue {                             // STRUCT
    
    private var leftStack: [T] = []                       // when you dequeue, you remove items from the leftStack
    private var rightStack: [T] = []                      // when you enqueue, the item is added to the rightStack
     
    init() {}
     
    
    // MARK: - ACTIONS
    
    @discardableResult
    mutating func enqueue(_ element: T) -> Bool {           // append element to right stack
        rightStack.append(element)
        return true
    }
    
    @discardableResult
    mutating func dequeue() -> T? {                         // removes the top element from the left stack
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeFirst(rightStack.count)
        }
        return leftStack.popLast()
    }
    
    var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    var peek: T? {
        return leftStack.last ?? rightStack.first
    }
    
    
}

extension QueueStack: CustomStringConvertible {
    
    var description: String {
        let printList = leftStack.reversed() + rightStack
        return String(describing: printList)
    }
    
}

//var queue = QueueStack<String>()
//queue.enqueue("Ray")
//queue.enqueue("Brian")
//queue.enqueue("Eric")
//queue
//queue.dequeue()
//queue
//queue.peek

