import Foundation

func solution(_ citations:[Int]) -> Int {
    var sorted: [Int] = citations.sorted()
    var minNum: Int = sorted.first!
    var maxNum: Int = sorted.last!
    var lastCheckedIdx: Int = 0
    
    if sorted[0] >= sorted.count {
        return sorted.count
    }
    
    var answer: Int = 0
    
    print(sorted)
        
    for num in minNum...maxNum {
        for i in lastCheckedIdx..<sorted.count {
            if sorted[i] <= num {
                lastCheckedIdx = i
            } else {
                break
            }
        }
        
        print("lastIdx : \(lastCheckedIdx), num : \(num)")
        
        var count: Int = sorted.count - lastCheckedIdx
        if num < count {
            answer = num
        } else {
            break
        }
    }
    
    return answer
}