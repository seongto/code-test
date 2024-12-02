import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var wrongAmount: Int = 0
    var zeroAmount: Int = 0
    
    lottos.forEach {
        if $0 == 0 {
            zeroAmount += 1
        } else {
            if !win_nums.contains($0) {
                wrongAmount += 1
            }
        }
    }
    
    if wrongAmount == 0 && zeroAmount == 0 {
        return [1, 1]
    }
    
    func calScore(_ num: Int) -> Int {
        return num > 5 ? 6 : num + 1
    }
    
    return [ calScore(wrongAmount), calScore(wrongAmount + zeroAmount)]
}