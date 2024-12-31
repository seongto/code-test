import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer: [Int] = []
    var durations: [Int] = Array(repeating:0, count: speeds.count)
    
    for i in 0..<speeds.count {
        var rest:Int = 100 - progresses[i]
        
        if rest % speeds[i] == 0 {
            durations[i] = rest / speeds[i]
        } else {
            durations[i] = rest / speeds[i] + 1
        }
    }
        
    var lastBigNumber: Int = durations[0]
    var currentPubs: Int = 1
    
    for i in 1..<durations.count {
        if durations[i] > lastBigNumber {
            lastBigNumber = durations[i]
            answer.append(currentPubs)
            currentPubs = 1
        } else {
            currentPubs += 1
        }
        
        if i == durations.count - 1 {
            answer.append(currentPubs)
        }
    }
        
    return answer
}