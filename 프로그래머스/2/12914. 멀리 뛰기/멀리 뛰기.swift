func solution(_ n:Int) -> Int {
    var before2: Int = 1
    var before1: Int = 2
    var answer: Int = 3
    
    if n <= 3 {
        return n
    }
    
    for num in 4...n {
        before2 = before1
        before1 = answer
        answer = (before1 + before2) % 1234567
    }

    return answer
}