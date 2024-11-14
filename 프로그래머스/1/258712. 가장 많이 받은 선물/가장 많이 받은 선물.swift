import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var giftIndex: [String: Int] = [:]
    var giftToGet: [String: Int] = [:]
    var giftMap: [String: Int] = [:] // 선물 관계를 빠르게 조회하기 위한 딕셔너리

    // 1. 선물 관계를 딕셔너리에 저장
    for gift in gifts {
        giftMap[gift, default: 0] += 1
    }

    // 2. 개인의 선물 지수 계산
    for name in friends {
        let plusIndex = gifts.filter { $0.split(separator: " ")[0] == name }.count
        let minusIndex = gifts.filter { $0.split(separator: " ")[1] == name }.count
        giftIndex[name] = plusIndex - minusIndex
        giftToGet[name] = 0
    }

    // 3. 선물 관계를 계산하여 다음 달 받을 선물 계산
    for idx1 in 0..<friends.count - 1 {
        for idx2 in idx1 + 1..<friends.count {
            let name1 = friends[idx1]
            let name2 = friends[idx2]
            let gift1to2 = "\(name1) \(name2)"
            let gift2to1 = "\(name2) \(name1)"

            // 선물 관계 점수 계산
            let sum = (giftMap[gift1to2] ?? 0) - (giftMap[gift2to1] ?? 0)

            if sum > 0 {
                giftToGet[name1]! += 1
            } else if sum < 0 {
                giftToGet[name2]! += 1
            } else {
                if giftIndex[name1]! > giftIndex[name2]! {
                    giftToGet[name1]! += 1
                } else if giftIndex[name1]! < giftIndex[name2]! {
                    giftToGet[name2]! += 1
                }
            }
        }
    }

    return giftToGet.values.max()!
}