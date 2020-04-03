public class TreeNode<T> {                                      // CLASS
    
    public var value: T
    public var childrenOfTree: [TreeNode] = []
    
    // MARK: - INIT
    
    public init(_ value: T) {
        self.value = value
    }
     
    // MARK: - ACTIONS
    
    public func add(_ child: TreeNode) {                                 // add a node to the tree
        childrenOfTree.append(child)
    }
     
    // MARK: - ACTIONS (iterate through the nodes)
    
//    public func forEachDepthFirst(visit: (TreeNode) -> Void) {        // DFS
//        visit(self)
//        self.childrenOfTree.forEach {
//            $0.forEachDepthFirst(visit: visit)                        // recurse
//        }
//    }
    
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {        // level order traversal
        visit(self)
        var queue = QueueStack<TreeNode>()                                   // using TWO STACK QUEUE; not a simple stack
        self.childrenOfTree.forEach {
            queue.enqueue($0)
        }
        while let node = queue.dequeue() {
            visit(node)
            node.childrenOfTree.forEach {
                queue.enqueue($0)
            }
        }
    }
    
}


extension TreeNode where T: Equatable {
    
    public func search(_ value: T) -> TreeNode? {   // searching for a node that has a certain value
        var result: TreeNode?
        forEachLevelOrder { node in                     // Level Order Traversal
            if node.value == value {
                result = node
            }
        }
        return result
    }
 
}

//    public func search(_ value: T) -> TreeNode? {   // searching for a node that has a certain value
//        var result: TreeNode?
//        forEachDepthFirst { node in                     // DFS
//            if node.value == value {
//                result = node
//            }
//        }
//        return result
//    }
    
    
//}





func testTree() {
    func example(of description: String, action: () -> Void) {
         print("---Example of: \(description)---")
         action()
         print()
     }
     
    example(of: "creating a tree") {
        let beverages = TreeNode("Beverages")
        
        let hot = TreeNode("Hot")
        let cold = TreeNode("Cold")
        
        beverages.add(hot)
        beverages.add(cold)
    }
     
    func makeBeverageTree() -> TreeNode<String> {
        let tree = TreeNode("Beverages")
        
        let hot = TreeNode("hot")
        let cold = TreeNode("cold")
        
        let tea = TreeNode("tea")
        let coffee = TreeNode("coffee")
        let chocolate = TreeNode("cocoa")
        
        let blackTea = TreeNode("black")
        let greenTea = TreeNode("green")
        let chaiTea = TreeNode("chai")
        
        let soda = TreeNode("soda")
        let milk = TreeNode("milk")
        
        let gingerAle = TreeNode("ginger ale")
        let bitterLemon = TreeNode("bitter lemon")
        
        tree.add(hot)
        tree.add(cold)
        
        hot.add(tea)
        hot.add(coffee)
        hot.add(chocolate)
        
        cold.add(soda)
        cold.add(milk)
        
        tea.add(blackTea)
        tea.add(greenTea)
        tea.add(chaiTea)
        
        soda.add(gingerAle)
        soda.add(bitterLemon)
        
        return tree
    }
    
     
//    example(of: "depth-first traversal") {
//        let tree = makeBeverageTree()
//        tree.forEachDepthFirst {
//            print($0.value)
//        }
//    }
    
     
    example(of: "level-order traversal") {
        let tree = makeBeverageTree()
        tree.forEachLevelOrder {
            print($0.value)     // returns a node
        }
    }
    
     
    example(of: "searching for a node") {
        let tree = makeBeverageTree()
        if let searchResult1 = tree.search("ginger ale") {
            print("Found node: \(searchResult1.value)")
        }
        if let searchResult2 = tree.search("WKD Blue") {
            print(searchResult2.value)
        } else {
            print("Couldn't find WKD Blue")
        }
    }
    
    
    

    
}
