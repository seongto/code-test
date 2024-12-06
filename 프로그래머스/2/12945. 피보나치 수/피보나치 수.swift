func solution(_ n:Int) -> Int {
    var before2: Int = 0
    var before1: Int = 1
    var answer: Int = 1
    
    if n == 2 {
        return answer
    }
    
    for num in 3...n {
        before2 = before1
        before1 = answer
        answer = (before1 + before2) % 1234567
    }

    return answer
}