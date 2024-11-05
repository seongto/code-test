func solution(_ arr:[Int]) -> [Int] {
    var answer: [Int] = arr
    var tempArr: [Int] = arr.sorted()
    var numIndex: Int = answer.index(of: tempArr[0])!
    answer.remove(at: numIndex)
    
    if answer.count == 0 {
        return [ -1 ]
    } else {
        return answer
    }
    
}