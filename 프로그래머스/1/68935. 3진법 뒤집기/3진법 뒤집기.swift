import Foundation

func solution(_ n:Int) -> Int {
    let binary:String = String(n ,radix: 3)
    var numArr: [String] = binary.map { String($0) }.reversed()
    
    var answer: Int = 0
        
    for ( idx, num ) in numArr.enumerated() {
        if num != "0" {
            answer += Int(num)! * Int(NSDecimalNumber(decimal: pow(3, numArr.count - (idx + 1))))
        }
    }
    
    return answer
}