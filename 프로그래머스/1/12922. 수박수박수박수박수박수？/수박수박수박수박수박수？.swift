func solution(_ n:Int) -> String {
    var answer: String = String(repeating: "수박", count: n/2)
    
    if n % 2 == 1 {
        answer += "수"
    }
    
    return answer
}