import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var count: Int = k
    var answer: [String] = []
    var numArr: [String] = Array(number.map { String($0)})
    
    for num in numArr {
        while answer.count > 0 && (answer.last! < num) && (count > 0) {
            answer.popLast()
            count -= 1
        }
        
        answer.append(num)
    }
    
    var result: [String] = Array(answer[0...answer.count - 1 - count])
    
    return String(result.joined())
}