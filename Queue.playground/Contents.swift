struct Queue<Element> {
    fileprivate var items : [Element] = []
    
    mutating func enqueue( ele: Element) {
        items.append(ele)
    }
    
    mutating func dequeue() -> Element? {
        if !isEmpty() {
            return items.remove(at: 0)
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    func peek() -> Element? {
        return items.first
    }
    
    func count() -> Int {
        return items.count
    }
}

extension Queue : CustomStringConvertible {
    var description: String {
        let start = "\n-------- Queue -------- \n"
        let end = "\n-------- End -------- \n"
        
        let elements = items.map { "\($0)" }.joined(separator: "\n")
        return start + elements + end
    }
}

class Person {
    fileprivate var firstName : String?
    fileprivate var lastName : String?
    fileprivate var age : Int = 0
    
    init(firstName: String?, lastName:String?, age:Int) {
        self.firstName = firstName
        self.lastName  = lastName
        self.age = age
    }
}

extension Person : CustomStringConvertible {
    var description: String {
        let first = self.firstName ?? ""
        let last = self.lastName ?? ""
        return "Name: \(first) \(last), Age: \(self.age)"
    }
}

//Queue with string elements
var queue = Queue<String>()
queue.enqueue(ele: "Element 1")
queue.enqueue(ele: "Element 2")
queue.enqueue(ele: "Element 3")
queue.enqueue(ele: "Element 4")
print(queue)
queue.dequeue()
print("Dequeued: \(queue.dequeue() ?? "nil" )")
print("Peek: \(queue.peek() ?? "nil" )")
print("Queue count: \(queue.count())")
print(queue)
queue.enqueue(ele: "Element 5")
queue.enqueue(ele: "Element 6")
queue.enqueue(ele: "Element 7")
print(queue)

//Queue with Any elements
var anyQueue = Queue<Any>()
anyQueue.enqueue(ele: 5)
anyQueue.enqueue(ele: 5.99)
anyQueue.enqueue(ele: -55.99)
anyQueue.enqueue(ele: "Hello world")

let person = Person(firstName: "John", lastName: "Bot", age: 30)
let person2 = Person(firstName: "Merry", lastName: nil, age: 25)
anyQueue.enqueue(ele: person)
anyQueue.enqueue(ele: person2)
anyQueue.enqueue(ele: 5)
print(anyQueue)

anyQueue.dequeue()
anyQueue.dequeue()
anyQueue.dequeue()
anyQueue.dequeue()
print(anyQueue)

