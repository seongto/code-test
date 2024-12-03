import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var answer: Int = 0
    
    
    for item in ingredient {
        stack.append(item)
        
        if stack.count >= 4 {
            if stack[stack.count-4...stack.count-1] == [1,2,3,1]{
                answer += 1
                stack.removeLast(4)
            }
        }
    }
    
    
    
    return answer
}