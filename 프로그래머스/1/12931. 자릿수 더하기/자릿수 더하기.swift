import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0
    var numbers = String(n)
    
    for num in numbers {
        answer += Int(String(num))!
    }

    return answer
}