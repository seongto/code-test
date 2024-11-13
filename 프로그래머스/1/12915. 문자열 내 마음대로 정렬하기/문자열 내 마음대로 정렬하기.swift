func solution(_ strings:[String], _ n:Int) -> [String] {
    var answer: [String] = strings
    var strN = String.Index(encodedOffset: n)
    var isDone:Bool = false
    
    while !isDone {
        var count:Int = 0
        for idx in 0...strings.count-2 {
            if answer[idx][strN] > answer[idx+1][strN] {
                answer.swapAt(idx, idx+1)
                count += 1
            } else if answer[idx][strN] == answer[idx+1][strN] {
                if answer[idx] > answer[idx+1] {
                    answer.swapAt(idx, idx+1)
                    count += 1
                }
            }
        }
        if count == 0 {
            isDone = true
        }
    }
    
    return answer
    
}
