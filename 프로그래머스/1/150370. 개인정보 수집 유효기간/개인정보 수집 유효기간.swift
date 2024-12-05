import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var todayArr = today.split(separator: ".").map {Int($0)!}
    var dict: [String:Int] = [:]
    var answer: [Int] = []

    
    terms.forEach {
        var temp = $0.split(separator: " ")
        dict[String(temp[0])] = Int(temp[1])! * 28
    }
    
    for i in 0..<privacies.count {
        var temp = privacies[i].split(separator: " ")
        var date: [Int] = temp[0].split(separator: ".").map {Int($0)!}
        var type: String = String(temp[1])
        var diff: Int = ((todayArr[0] - date[0]) * 12 * 28) + (todayArr[1] - date[1]) * 28 + (todayArr[2] - date[2])
                    
        if diff >= dict[type]! {
            answer.append(i + 1)
        }
    }
   
    return answer
}