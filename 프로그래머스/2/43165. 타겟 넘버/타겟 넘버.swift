import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer: Int = 0
    let childs: [Int] = [1, -1]
    
    func dfsRecur(current: Int, depth: Int) {
        if depth >= numbers.count {            
            if current == target {
                answer += 1
            }
            return
        }
        
        for num in childs {
            var cur:Int = current
            cur += numbers[depth] * num
            dfsRecur(current: cur, depth: depth + 1)
        }
    }
    
    dfsRecur(current: 0, depth: 0)
    
    return answer
}