import UIKit

public class Node<T> {
    public var data: T?
    public var outEdges: [Edge<T>]
    public var visited: Bool
    
    public init(data: T? = nil) {
        self.data = data
        self.outEdges = []
        self.visited = false
    }
}

public class Edge<T> {
    public var toNode: Node<T>?
    public var fromNode: Node<T>?
    public var weight: Int
    
    public init(toNode: Node<T>? = nil, fromNode: Node<T>? = nil, weight: Int = 0) {
        self.toNode = toNode
        self.fromNode = fromNode
        self.weight = weight
    }
    
}

public class SwiftGraph<T> {
    public var canvas: [Node<T>]
    public var isDirected: Bool
    
    public init() {
        self.canvas = [Node<T>]()
        self.isDirected = true
    }
    
    public func addNode(data: T) -> Node<T>?{
        let node: Node<T> = Node<T>(data: data)
        print(node.data!)
        self.canvas.append(node)
        
        return node
    }
    
    public func addConnection(source: Node<T>, toNode: Node<T>, weight: Int) {
        let edge: Edge<T> = Edge<T>(toNode: toNode, fromNode: nil, weight: weight)
        
        source.outEdges.append(edge)
        
        if isDirected == false {
            
            let reverseEdge: Edge<T> = Edge<T>(toNode: source, fromNode: nil, weight: weight)
            
            toNode.outEdges.append(reverseEdge)
        }
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        var desc = ""
        desc += "Node: \(self.data!) Edges: \(self.outEdges) \n"
        return desc
    }
}

extension Edge: CustomStringConvertible {

    public var description: String {
        var desc = ""
        desc += "toNode: \(String(describing: self.toNode!)) weigth: \(self.weight)"
        return desc
    }
}

extension SwiftGraph: CustomStringConvertible {
    public var description: String {
        
        var desc = "\(self.canvas)"
        return desc
    }
}
var graphTest: SwiftGraph<Int> = SwiftGraph<Int>()

graphTest.addNode(data: 1)
graphTest.addNode(data: 2)
graphTest.addNode(data: 3)
graphTest.addNode(data: 4)

graphTest.addConnection(source: graphTest.canvas[0], toNode: graphTest.canvas[3], weight: 100)
graphTest.addConnection(source: graphTest.canvas[1], toNode: graphTest.canvas[3], weight: 50)
graphTest.addConnection(source: graphTest.canvas[2], toNode: graphTest.canvas[3], weight: 80)


print(graphTest)
graphTest.addNode(data: 5)
graphTest.addNode(data: 6)
graphTest.addNode(data: 7)

graphTest.addConnection(source: graphTest.canvas[4], toNode: graphTest.canvas[3], weight: 60)
graphTest.addConnection(source: graphTest.canvas[5], toNode: graphTest.canvas[3], weight: 70)
graphTest.addConnection(source: graphTest.canvas[6], toNode: graphTest.canvas[3], weight: 100)

print(graphTest)
graphTest.addNode(data: 8)
graphTest.addNode(data: 9)
graphTest.addNode(data: 10)

graphTest.addConnection(source: graphTest.canvas[7], toNode: graphTest.canvas[3], weight: 60)
graphTest.addConnection(source: graphTest.canvas[8], toNode: graphTest.canvas[3], weight: 70)
graphTest.addConnection(source: graphTest.canvas[9], toNode: graphTest.canvas[3], weight: 100)

print(graphTest)
graphTest.addNode(data: 11)
graphTest.addNode(data: 12)
graphTest.addNode(data: 13)

graphTest.addConnection(source: graphTest.canvas[10], toNode: graphTest.canvas[3], weight: 60)
graphTest.addConnection(source: graphTest.canvas[11], toNode: graphTest.canvas[3], weight: 70)
graphTest.addConnection(source: graphTest.canvas[12], toNode: graphTest.canvas[3], weight: 100)


//
//let array: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//
//for elem in array {
//    graphTest.addNode(data: elem)
//}
//
//graphTest.addConnection(source: graphTest.canvas[1], toNode: graphTest.canvas[3], weight: 245)
//graphTest.addConnection(source: graphTest.canvas[2], toNode: graphTest.canvas[3], weight: 245)
//graphTest.addConnection(source: graphTest.canvas[3], toNode: graphTest.canvas[3], weight: 245)
//graphTest.addConnection(source: graphTest.canvas[4], toNode: graphTest.canvas[3], weight: 245)
//graphTest.addConnection(source: graphTest.canvas[5], toNode: graphTest.canvas[3], weight: 245)
//graphTest.addConnection(source: graphTest.canvas[6], toNode: graphTest.canvas[3], weight: 245)
//graphTest.addConnection(source: graphTest.canvas[7], toNode: graphTest.canvas[3], weight: 245)
//graphTest.addConnection(source: graphTest.canvas[8], toNode: graphTest.canvas[3], weight: 245)
//graphTest.addConnection(source: graphTest.canvas[9], toNode: graphTest.canvas[3], weight: 245)
print(graphTest)
