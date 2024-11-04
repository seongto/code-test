import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer:Int = 0
    
    for i in 0...(signs.count - 1){
        if signs[i] {
            answer += absolutes[i]
        } else {
            answer -= absolutes[i]
        }
    }
    
    return answer
}