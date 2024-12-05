import Foundation

func getSubstr(_ string: String, from: Int, to: Int) -> Substring {
    let startIndex = string.index(string.startIndex, offsetBy: from)
    let endIndex = string.index(string.startIndex, offsetBy: to)
    let substring = string[startIndex...endIndex]
    return substring
}

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var newPark: [String] = park
    var cx: Int = 0
    var cy: Int = 0
    var width: Int = park[0].count
    var height: Int = park.count
    var startFound: Bool = false
    
    for y in 0..<height {
        if park[y].contains("S") {
            print(park[y])
            for x in park[y].enumerated() {
                if x.1 == "S" {
                    cx = x.0
                    cy = y
                    startFound = true
                    break
                }
            }
            newPark[y] = park[y].replacingOccurrences(of: "S", with: "O")
        }
        if startFound { break }
    }
    
    func moveE(_ distance: Int){
        if cx + distance < width {
            var rest = getSubstr(newPark[cy], from: (cx + 1), to: cx + distance)
            if rest == String(repeating: "O", count: distance) {
                cx += distance
            }
        }
    }
    
    func moveW(_ distance: Int){
        if cx - distance >= 0 {
            var rest = getSubstr(newPark[cy], from: cx - distance, to: cx - 1)
            if rest == String(repeating: "O", count: distance) {
                cx -= distance
            }
        }
    }
    
    func moveS(_ distance: Int) {
        var strIdx = newPark[0].index(newPark[0].startIndex, offsetBy: cx)
        if cy + distance < height {
            for i in cy...cy + distance {
                if newPark[i][strIdx] == "X" {
                    return
                }
            }
            cy += distance
        }
    }
    
    func moveN(_ distance: Int) {
        var strIdx = newPark[0].index(newPark[0].startIndex, offsetBy: cx)
        if cy - distance >= 0 {
            for i in cy - distance...cy {
                if newPark[i][strIdx] == "X" {
                    return
                }
            }
            cy -= distance
        }
    }
    
    routes.forEach {
        var temp = $0.split(separator: " ")
        
        switch temp[0] {
        case "E":
            moveE(Int(temp[1])!)
        case "W":
            moveW(Int(temp[1])!)
        case "S":
            moveS(Int(temp[1])!)
        case "N":
            moveN(Int(temp[1])!)
        default:
            print("error?")
        }
    }
    
    return [cy, cx]
}