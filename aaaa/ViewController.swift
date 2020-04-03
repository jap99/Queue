import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.test2StackQueue()
//        self.testArray()
    }
    
    func test2StackQueue() {
        var queue = QueueStack<String>()
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        print(queue)
        queue.dequeue()
        print(queue)
        queue.dequeue()
        queue.dequeue()
        queue.dequeue()
        print(queue)
//        queue.peek
    }
    
    func testArray() {
        var queue = OptimizedArrayQueue<Int>()
        for x in 1...50 {
            queue.enqueue(x)
        }
        print(queue)
        print(queue.enqueue(55))
        print(queue)
        print(queue.dequeue()!)
        print(queue.dequeue()!)
        print(queue.dequeue()!)
        print(queue.dequeue()!)
        print(queue)
//        queue.dequeue()
//        queue.dequeue()
//        queue.dequeue()
    }
}

 
