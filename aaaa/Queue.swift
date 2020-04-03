 
import Foundation


// MARK: - A PROTOCOL FOR QUEUES

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool       // return true if successful
    mutating func dequeue() -> Element?                     // remove from front of queue
    var isEmpty: Bool { get }                               // check if queue's empty
    var peek: Element? { get }                              // check element at top of queue
    // var count: Int { get }                                  // check count
}


