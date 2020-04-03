 
 import Foundation
 
 
 struct OptimizedArrayQueue<T>: Queue {
    
    fileprivate var array: [T?] = []
    fileprivate var head = 0
    
    init() {}
    
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {         // O(1) time
        self.array.append(element)
        return true
    }
    
    @discardableResult
    mutating func dequeue() -> T? {                             // O(1) time
        guard head < array.count,
            let element = array[head] else {
                return nil
        }
        array[head] = nil
        head += 1
        let percentage = Double(head)/Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        return element
    }
    
    var count: Int {
        return array.count - head
    }
    
    var isEmpty: Bool {                                       // O(1) time
        return count == 0
    }
    
    var peek: T? {                                            // O(1) time
        return isEmpty ? nil : array[head]
    }
    
    
 }
 
 
 
 
 
 
 // MARK: - ARRAY BASED (NON-OPTIMIZED)
 
 // The associated type ELEMENT is inferred by the type parameter T
 
 public struct QueueArray<T>: Queue {              // STRUCT                      // O(n) space
    
    //   public typealias Element = T
    
    private var array: [T] = []
    
    public init() {}
    
    // For enqueue - If array runs out of space, it needs to allocate more space, which is an O(n) operation. Must copy all existing data over to the new array. Since this doesn’t happen very often (thanks to doubling the size each time), the complexity still works out to be an ammortized O(1). Once the array gets full, it has to resize and may have unused space. This could increase your memory footprint over time.
    public mutating func enqueue(_ element: T) -> Bool {         // O(1) time - unless it needs to allocate
        self.array.append(element)
        return true
    }
    
    // Requires all remaining elements to be shifted in memory
    public mutating func dequeue() -> T? {                       // O(n) time - LINEAR - there are ways to optimize this
        self.array.removeFirst()
    }
    
    public var isEmpty: Bool {                                   // O(1) time
        return array.isEmpty
    }
    
    public var peek: T? {                                       // O(1) time
        return array.first
    }
    
    public var count: Int {
        return array.count
    }
    
 }
 
