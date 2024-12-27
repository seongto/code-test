import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    let startRow: Int = Int(left) / n + 1
    let startIdx: Int = Int(left) % n
    let endRow: Int = Int(right) / n + 1
    let endIdx: Int = Int(right) % n
    var answer: [Int] = []
    var gap: Int = endRow - startRow 
        
    func getRow(start: Int, end: Int, number: Int) {
        for num in start...end {
            if num <= number {
                answer.append(number)
            } else {
                answer.append(num)
            }
        }
    }
        
    if gap == 0 {
        getRow(start: startIdx + 1, end: endIdx + 1, number: startRow)
    } else if gap == 1 {
        getRow(start: startIdx + 1, end: n, number: startRow)
        getRow(start: 1, end: endIdx + 1, number: endRow)
    } else {
        getRow(start: startIdx + 1, end: n, number: startRow)
        for i in (startRow + 1)...(endRow - 1) {
            getRow(start: 1, end: n, number: i)
        }
        getRow(start: 1, end: endIdx + 1, number: endRow)
    }
        
    return answer
}