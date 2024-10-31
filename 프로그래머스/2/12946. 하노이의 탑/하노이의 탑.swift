import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result:[[Int]] = []
    
    func hanoiMove(num:Int, tw1:Int, tw2:Int, tw3:Int){
        if num == 1 {
            result.append([tw1,tw3])
        } else {
            hanoiMove(num: num-1, tw1: tw1, tw2: tw3, tw3: tw2)
            result.append([tw1, tw3])
            hanoiMove(num: num-1, tw1: tw2, tw2: tw1, tw3: tw3)
        }
    }
    
    hanoiMove(num: n, tw1:1, tw2:2, tw3:3)
    
    return result
}