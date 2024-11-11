import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var answer:Int = 0
    var tArr:[String] = t.map { String($0) }
    
    for idx in 0...t.count - p.count {
        var number:String = tArr[idx...idx + p.count - 1].joined()
        
        if Int(number)! <= Int(p)! {
            answer += 1
        }
        
    }
    return answer
}