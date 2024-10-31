import Foundation

func solution(_ numbers:[Int]) -> Double {
    var sum:Int = 0
    for num in numbers {
        sum += num
    }
        
    return Double(sum) / Double(numbers.count)
}