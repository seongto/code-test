import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var giftIndex: [String:Int] = [:]
    var giftToGet: [String:Int] = [:]
    
    // 선물지수 비교하여 선물 지급하기
    func indexCheck(_ name1: String, _ name2: String) -> Void {
        if giftIndex[name1]! > giftIndex[name2]! {
            giftToGet[name1]! += 1
        } else if giftIndex[name1]! < giftIndex[name2]! {
            giftToGet[name2]! += 1
        }
    }
    
    // 1. 개인의 선물지수 데이터 저장
    for name in friends {
        var plusIndex: Int = gifts.reduce(0) { $1.split(separator: " ")[0] == name ? $0 + 1 : $0 + 0}
        var minusIndex: Int = gifts.reduce(0) { $1.split(separator: " ")[1] == name ? $0 + 1 : $0 + 0}
        giftIndex[ name ] = plusIndex - minusIndex
        giftToGet[ name ] = 0
    }
    print(giftIndex)
    
    // 2. 개인별 순회하며 다른 멤버와의 선물 관계성 계산
    for idx1 in 0..<friends.count-1 {
        for idx2 in idx1 + 1..<friends.count {
            let name1: String = friends[idx1]
            let name2: String = friends[idx2]
            let gift1to2: String = name1 + " " + name2
            let gift2to1: String = name2 + " " + name1
            
            if  gifts.contains(gift1to2) || gifts.contains(gift2to1) {
                var sum: Int = gifts.reduce(0) { 
                    if $1 == gift1to2 {
                        return $0 + 1
                    } else if $1 == gift2to1 {
                        return $0 - 1
                    }
                    return $0
                }
                
                // 3. 선물 관계에 따른 다음달 받을 선물 계산하여 저장
                if sum > 0 {
                    giftToGet[name1]! += 1
                } else if sum < 0 {
                    giftToGet[name2]! += 1
                } else {
                    indexCheck(name1, name2)
                }
                    
            } else {
                indexCheck(name1, name2)
            }
        }
    }
    
    return giftToGet.values.max()!
}