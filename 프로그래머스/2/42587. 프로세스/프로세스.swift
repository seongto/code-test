import Foundation

struct Queue {
    private var array: [Int?]
    private var head: Int = 0
    private var size: Int
    
    init(_ initialArray: [Int]) {
        self.array = initialArray
        self.size = initialArray.count
    }
    
    var isEmpty: Bool {
        return size == 0
    }
    
    mutating func enqueue(_ element: Int) {
        array.append(element)
        size += 1
    }
    
    mutating func dequeue() -> Int? {
        guard !isEmpty else {return nil}
        
        let element = array[head]
        
        array[head] = nil
        head += 1
        size -= 1
        
        return element
    }
    
    func peek() -> Int? {
        guard !isEmpty else {return nil}
        return array[head]
    }
    
    func getLength() -> Int {
        return array.count
    }
    
    func getHead() -> Int {
        return head
    }
    
    func getArray() -> [Int?] {
        return array
    }
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    let sorted = priorities.sorted(by: >)
    var que = Queue(priorities)
    var sortedQue = Queue(sorted)
    var targetIdx = location
    var answer: Int = 0
    
    while true {
        var currentHead: Int = que.getHead()
        if let el = que.dequeue() {
            if el == sortedQue.peek() {
                if el == priorities[location] && currentHead == targetIdx {
                    answer += 1
                    break
                } 
                sortedQue.dequeue()
                answer += 1
                
            } else {
                que.enqueue(el)
                if currentHead == targetIdx {
                    targetIdx = que.getLength() - 1
                }
            }
        }
    }
    
    return answer
}