import Foundation

func solution(_ weights:[Int]) -> Int64 {
    let sortedWeights = weights.sorted(by: > )
    var countMap: [Int: Int] = [:] // 무게별 등장 횟수를 기록
    var result = 0

    for weight in sortedWeights {
        // 이전에 기록된 값 중 조건을 만족하는 경우를 확인
        result += countMap[weight, default: 0]               // w1 == w2
        result += countMap[weight * 2, default: 0]          // w1 * 4 == w2 * 2
        
        // w1 * 3 == w2 * 2
        if weight * 3 % 2 == 0 {
            result += countMap[weight * 3 / 2, default: 0]
        }
        
        // w1 * 4 == w2 * 3
        if weight * 4 % 3 == 0 {
            result += countMap[weight * 4 / 3, default: 0]
        }

        // 현재 무게를 해시맵에 기록
        countMap[weight, default: 0] += 1
    }

    return Int64(result)
}