import Foundation

func solution(_ elements:[Int]) -> Int {
    var numSet: Set<Int> = []
    var array: [Int] = elements + elements
    
    for i in 0..<elements.count {
        var sum: Int = 0
        for j in 0..<elements.count {
            sum += array[i+j]
            numSet.insert(sum)
        }
    }
    
    return numSet.count
}