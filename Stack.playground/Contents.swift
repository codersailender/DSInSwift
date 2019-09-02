class Stack<Element> {
    fileprivate var items : [Element] = []
    
    func push( ele: Element) {
        items.append(ele)
    }
    
    func pop() -> Element? {
        return items.popLast()
    }
    
    func peek() -> Element? {
        return items.last
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    func count() -> Int {
        return items.count
    }
}

extension Stack : CustomStringConvertible {
    
    var description: String {
        let topDivider = "\n------------ Stack ---------- \n"
        let bottonDivider = "\n------------ End ---------- \n"
        
        let elements = items.map { "\($0)" }.reversed().joined(separator: "\n")
        return topDivider + elements + bottonDivider
    }
}

var stack = Stack<Any>()
stack.push(ele: "Element 1")
stack.push(ele: "Element 2")
stack.push(ele: "Element 3")
stack.push(ele: 4)
stack.push(ele: 14)
stack.push(ele: 43)
stack.push(ele: 24)
stack.push(ele: 77.00000)
stack.push(ele: 0.24)
stack.push(ele: 1.24)
stack.push(ele: 0)
stack.push(ele: -1)
stack.push(ele: -5)
stack.pop()
stack.count()
stack.isEmpty()
stack.peek()
print(stack)
