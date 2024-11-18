import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var is1First: Bool = false
    var card1Used: Int = -1
    var card2Used: Int = -1
    
    for idx in 0...goal.count - 1 {
        
        if (card1Used < cards1.count-1) && (goal[idx] == cards1[card1Used + 1]) {
            card1Used += 1
        } else if (card2Used < cards2.count-1) && (goal[idx] == cards2[card2Used + 1]) {
            card2Used += 1
        } else {
            return "No"
        }
    }
    
    return "Yes"
}