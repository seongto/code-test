func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer: [[Int]] = []
    
    for idxCol in 0...arr1.count-1 {
        var sumCol: [Int] = []
        
        for idxRaw in 0...arr1[0].count-1 {
            sumCol.append(arr1[idxCol][idxRaw] + arr2[idxCol][idxRaw])
        }
        answer.append(sumCol)
    }
    return answer
}