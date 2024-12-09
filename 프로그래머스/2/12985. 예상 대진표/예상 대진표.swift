import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var aa: Int = min(a,b)
    var bb: Int = max(a,b)
    
    func makeWinner(_ num: Int) -> Int {
        var result: Int = num % 2
        
        return result == 1 ? num / 2 + 1 : num / 2
    }
    
    var round: Int = 1
    
    while round <= 20 {
        if aa + 1 == bb && bb % 2 == 0 {
            return round
        }
        
        aa = makeWinner(aa)
        bb = makeWinner(bb)
        round += 1
    }

    return 20
}