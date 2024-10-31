func solution(_ n:Int) -> Int {
    var answer:Int = 0
    guard n != 0 else { return 0 }
    
    for num in 1...n {
        if n % num == 0 {
            answer += num
        } 
    }
    return answer
}