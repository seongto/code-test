import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var row: [Int] = Array(repeating: 0, count: arr2[0].count)
    var answer: [[Int]] = Array(repeating: row, count: arr1.count)
        
    for arr1rowIdx in 0..<arr1.count {
        for arr2colIdx in 0..<arr2[0].count {
            for i in 0..<arr1[0].count {
                answer[arr1rowIdx][arr2colIdx] += arr1[arr1rowIdx][i] * arr2[i][arr2colIdx]
            }
        }
    }
        
    return answer
}