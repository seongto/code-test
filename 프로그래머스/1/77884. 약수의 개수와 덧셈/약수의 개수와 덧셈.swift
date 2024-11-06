import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var answer: Int = 0
    
    for num in left...right {
        var sum: Int = 0
        for n in 1...num {
            if num % n == 0 {
                sum += 1
            }
        }
        
        if sum % 2 == 0 {
            answer += num
        } else {
            answer -= num
        }
    }
    
    return answer
}