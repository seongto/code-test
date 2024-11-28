import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var answer = [Int]( repeating: 0, count: number + 1 )

        for num in 1...number {
            var current = num

            while current <= number {
                answer[current] += 1
                current += num
            }
        
            // print("num: \(num), \(answer)")
        }
    
    answer = answer.map { $0 > limit ? power : $0 }
    
    return answer.reduce(0, +)
}