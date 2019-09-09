struct Heap {
    //By default min heap
    private var items: [Int] = []
    
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1)/2
    }
    
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2*parentIndex + 1
    }
    
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2*parentIndex + 2
    }
    
    private func hasParent(_ childIndex: Int) -> Bool {
        let index = getParentIndex(childIndex)
        return index >= 0
    }
    
    private func hasLeftChild(_ parentIndex: Int) -> Bool {
        let index = getLeftChildIndex(parentIndex)
        return index < items.count
    }
    
    private func hasRightChild(_ parentIndex: Int) -> Bool {
        let index = getRightChildIndex(parentIndex)
        return index < items.count
    }
    
    private func getParent(_ childIndex: Int) -> Int {
        if hasParent(childIndex) {
            return items[getParentIndex(childIndex)]
        }
        return Int.max
    }
    
    private func getLeftChild(_ parentIndex: Int) -> Int {
        if hasLeftChild(parentIndex) {
            return items[getLeftChildIndex(parentIndex)]
        }
        return Int.max
    }
    
    private func getRightChild(_ parentIndex: Int) -> Int {
        if hasRightChild(parentIndex) {
            return items[getRightChildIndex(parentIndex)]
        }
        return Int.max
    }
    
    mutating private func swap(_ indexOne:Int, _ indexTwo:Int) {
        let placeHolder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeHolder
    }
    
    // Place added element at corrent position to satisfy min heap property
    mutating private func heapifyUp() {
        var childIndex = items.count - 1;
        // If current child has parent &&
        // If current parent greater than child
        while hasParent(childIndex) && getParent(childIndex) > items[childIndex] {
            let parentIndex = getParentIndex(childIndex)
            swap(parentIndex, childIndex)
            childIndex = parentIndex
        }
    }
    
    // Rearrange elements in the heap to satisfy min heap property.
    mutating private func heapifyDown() {
        var parentIndex = 0;
        
        //Checking for left child because, first left child is added. If no left child there cannot be right child.
        while hasLeftChild(parentIndex) {
            let currentParent = items[parentIndex]
            
            // If current parent has right child &&
            // If right child is smaller than left child (Since min element should be at the top) &&
            // If right child is smaller than current parent, it should move up.
            if hasRightChild(parentIndex) && getRightChild(parentIndex) < getLeftChild(parentIndex) && getRightChild(parentIndex) < currentParent {
                // swap parent and right child
                swap(parentIndex, getRightChildIndex(parentIndex))
                parentIndex = getRightChildIndex(parentIndex)
                
            } else if (getLeftChild(parentIndex) < currentParent) { // If Left child is smaller than parent
                // swap parent and left child
                swap(parentIndex, getLeftChildIndex(parentIndex))
                parentIndex = getLeftChildIndex(parentIndex)
            } else {
                //Mean min heap property is satisfied i.e parent is smaller that both left & right child. Hence break out of while loop
                break
            }
        }
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    mutating func poll() -> Int {
        var ele = Int.max
        if !items.isEmpty {
            ele = items[0]
            items[0] = items.last!
            items.removeLast()
            heapifyDown()
        }
        return ele
    }
    
    mutating func add(_ key: Int) {
        items.append(key)
        heapifyUp()
    }
}

extension Heap : CustomStringConvertible {
    var description: String {
        let start = "\n--------- Heap ---------\n"
        let end = "\n--------- End ---------\n"
        
        let element = items.map { "\($0)" }.joined(separator: " ")
        if element.isEmpty {
            return "Heap is empty!!!"
        }
        return start + element + end
    }
}

//Sample test case
var heap = Heap()
heap.add(3)
heap.add(1)
heap.add(6)
heap.add(5)
heap.add(2)
heap.add(4)
heap.add(4)
heap.add(0)
heap.add(-1)
heap.add(-99)
heap.add(1000)
heap.add(-935898)
print(heap)

if !heap.isEmpty() {
    heap.poll()
}
print(heap)

if !heap.isEmpty() {
    heap.poll()
}
print(heap)



