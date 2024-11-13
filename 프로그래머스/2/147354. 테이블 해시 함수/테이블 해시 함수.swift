import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var result: Int = 0
        
    var hashArray: [[Int]] = data.sorted { (first: [Int], second: [Int]) -> Bool in
        if Array(first)[col - 1] == Array(second)[col - 1] {
            return Array(first)[0] > Array(second)[0]
        } else {
            return Array(first)[col - 1] < Array(second)[col - 1]
        }                             
    }
                                                  
    for row in row_begin...row_end {
        var sum:Int = 0
        for idx in 0...(data[0].count - 1) {
            sum += hashArray[row - 1][idx] % row
        }
        if row == row_begin - 1 {
            result = sum
        } else {
            result = result ^ sum
        }
    }
    
    return result
}