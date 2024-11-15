import Foundation

func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    var len: Int = diffs.count
        
    func calculateTime(_ lv: Int) -> Int64 {
        var sum: Int64 = Int64(times[0])
        
        for idx in 1..<len {
            let mul = diffs[idx] - lv
            if mul <= 0 {
                sum += Int64(times[idx])
            } else {
                sum += Int64(times[idx] + times[idx - 1]) * Int64(mul)
                sum += Int64(times[idx])
            }
        }
        
        return sum
    }
    
    var low = 1
    var high = diffs.max() ?? 0
    var answer = 0

    while low <= high {
        let mid = (low + high) / 2
        let time = calculateTime(mid)
        
        if time <= limit {
            answer = mid // 조건을 만족하는 레벨 저장
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return answer
}