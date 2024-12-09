func getGcf(_ a: Int, _ b: Int) -> Int {
    var rest: Int = 0
    var aa: Int = max(a, b)
    var bb: Int = min(a, b)
    
    while bb != 0 {
        rest = aa % bb
        aa = bb
        bb = rest
    }
    
    return aa
}

func solution(_ arr:[Int]) -> Int {
    var answer: Int = 1
    
    arr.forEach {
        answer = answer * $0 / getGcf(answer, $0)
    }
    
    return answer
}