func solution(_ s:String) -> String {
    var wordIndex: Int = 1
    var answer: String = ""
    
    for ( i, v) in s.enumerated() {
        if v == " " {
            wordIndex = 1
            answer += String(v)
        } else if wordIndex % 2 == 0 {
            answer += String(v).lowercased()
            wordIndex += 1
        } else {
            answer += String(v).uppercased()
            wordIndex += 1
        }
    }
    
    return answer
}