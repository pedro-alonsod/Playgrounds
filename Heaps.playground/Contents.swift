import UIKit

public struct Heap<T: Comparable> {
    public var array: [Int]
    public var count: Int
    public var capacity: Int
    public var heapType: Int
    
    public init(capacity: Int, heapType: Int) {
        self.heapType = heapType
        self.capacity = capacity
        self.array = [Int](repeatElement(0, count: self.capacity))
        self.array.reserveCapacity(capacity)
        self.count = 0
    }
    
    public func parent(i: Int) -> Int {
        if i <= 0 || i >= self.count {
            return -1
        }
        return i-1/2
    }
    
    public func leftChild(i: Int) -> Int {
        var left = 2 * i + 1
        if left >= self.count {
            return -1
        }
        return left
    }
    
    public func rightChild(i: Int) -> Int {
        var right = 2 * i + 2
        if right >= self.count {
            return -1
        }
        return right
    }
    
    public func getMax() -> Int {
        if self.count == 0 {
            return -1
        }
        return self.array[0]
    }
    
    public mutating func percolateDown(i: Int) {
        var l: Int, r: Int, max: Int, temp: Int
        l = leftChild(i: i)
        r = rightChild(i: i)
        
        if l != -1 && self.array[l] > self.array[r] {
            max = l
        } else {
            max = i
        }
        if r != -1 && self.array[r] > self.array[max] {
            max = r
        }
        if max != i {
            // Swap i y max
            temp = self.array[i]
            self.array[i] = self.array[max]
            self.array[max] = temp
        }
        percolateDown(i: max)
    }
    
    public mutating func deleteMax() -> Int {
        var data: Int
        if self.count == 0 {
            return -1
        }
        data = self.array[0]
        self.array[0] = self.array[self.count -  1]
        self.count -= 1
        percolateDown(i: 0)
        return data
    }
    
    public mutating func insert(data: Int) {
        var i: Int
        if self.count == self.capacity {
            self.resizeHeap()
        }
        self.count += 1
        i = self.count - 1
        while i >= 0 && data > self.array[(i-1)/2] {
            self.array[i] = self.array[(i-1)/2]
            i = i  - 1 / 2
        }
        self.array[i] = data
    }
    
    public mutating func resizeHeap() {
        var old: [Int] = self.array
        old.reserveCapacity(self.capacity * 2)

        for i in 0..<self.capacity {
            self.array[i] = old[i]
        }
        self.capacity *= 2
        old = []
    }
}

var heapTest: Heap<Int> = Heap<Int>(capacity: 10, heapType: 1)
//heapTest.insert(data: 10)
//Wrong

class MinHeap {
    var count = 0
    var heap = [Int](repeating: -1, count: 10)
    
    func Add(value: Int) {
        heap[count] = value
        count += 1
        minHeapify()
    }
    
    func minHeapify() {
        var i = count - 1
        while i > 0 && heap[i] < heap[(i-1)/2] {
            swap(&heap[i], &heap[(i-1)/2])
            i = (i - 1)/2
        }
    }
    
    func contains(value: Int) -> Int {
        var i = 0
        while i < count && heap[i] != value {
            i += 1
        }
        if i < count {
            return i
        } else {
            return -1
        }
    }
    
    func delete(value: Int) -> Bool {
        var index = contains(value: value)
        if index < 0 {
            return false
        }
        count -= 1
        heap[index] = heap[count]
        
        var left = (2*index) + 1
        var right = (2*index) + 2
        while left < count && heap[index] > heap[left] || heap[index] > heap[right] {
            if heap[left] < heap[right] {
                swap(&heap[left], &heap[right])
                index = left
//                heap[count] = -1
            } else {
                swap(&heap[right], &heap[index])
                index = right
//                heap[count] = -1
            }
        }
        return true
    }
}

extension MinHeap: CustomStringConvertible {
    var description: String {
        return "\(self.heap):[\(self.count)]"
    }
}

var minHeap = MinHeap()
minHeap.Add(value: 3)
minHeap.Add(value: 9)
minHeap.Add(value: 12)
minHeap.Add(value: 7)
minHeap.Add(value: 1)

minHeap.delete(value: 1)
print(minHeap)