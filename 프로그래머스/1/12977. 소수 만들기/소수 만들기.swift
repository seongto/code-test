import Foundation

func makePrimeNumbers(_ num: Int) -> [Int] {
    var arr = Array(repeating: true, count: num+1)
    var primes = [Int]()
    
    for i in 2...num {
        if arr[i] == true {
            for j in stride(from: i, through: num, by: i) {
                    arr[j] = false
            }
            primes.append(i)
        }
    }
    
    return primes
}


func solution(_ nums:[Int]) -> Int {
    var sorted = nums.sorted(by: >)
    var maxSum: Int = sorted[0] + sorted[1] + sorted[2]
    var primeNumbers: [Int] = makePrimeNumbers(maxSum)
    
    var answer = 0

    for idx1 in 0 ..< nums.count - 2 {
        for idx2 in idx1 + 1 ..< nums.count - 1 {
            for idx3 in idx2 + 1 ..< nums.count {
                if primeNumbers.contains(nums[idx1] + nums[idx2] + nums[idx3]) {
                    answer += 1
                }
            }
        }
    }

    return answer
}