import Foundation

func solution(_ num:Int) -> Int {
    var answer:Int = 0
    var number:Int = num
    
    func calculate() {
        guard answer < 500 else {
            return
        }
        
        if number != 1 {
            if number % 2 == 0 {
                number = number / 2
            } else {
                number = (number * 3) + 1
            }
            answer += 1
            calculate()
        }
    }
    
    calculate()
    return ( answer >= 500 ? -1 : answer )
}