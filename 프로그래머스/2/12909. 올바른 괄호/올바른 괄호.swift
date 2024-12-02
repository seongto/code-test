import Foundation

struct Stack<T> {
    var stack: [T] = []
    
    var count: Int {
        return stack.count
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        stack.append(element)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : stack.removeLast()
    }
}

func solution(_ s:String) -> Bool {
    var chars = Stack<Character>()
    
    for char in s {
        if char == "(" {
            chars.enqueue(char)
        } else {
            if chars.isEmpty || chars.stack.last == char {
                return false
            } else {
                chars.dequeue()
            }
        }
    }
    
    return chars.isEmpty ? true : false
}