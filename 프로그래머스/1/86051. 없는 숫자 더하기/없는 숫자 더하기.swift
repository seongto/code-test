import Foundation

func solution(_ numbers:[Int]) -> Int {
    var numberSet: Set<Int> = [0,1,2,3,4,5,6,7,8,9]
    var subSet: Set<Int> = numberSet.subtracting(Set(numbers))
    
    return subSet.reduce(0, +)
}