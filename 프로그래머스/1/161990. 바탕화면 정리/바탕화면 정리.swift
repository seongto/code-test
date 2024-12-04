import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var minX: Int = wallpaper[0].count // min은 비교로 값이 주어지므로 기본값을 최대값으로 설정
    var minY: Int = 0
    var maxX: Int = 0
    var maxY: Int = 0
    
    var reversed: [String] = wallpaper.reversed()
    
    for y in 0..<wallpaper.count {
        if wallpaper[y].contains("#") {
            minY = y
            break
        }
    }
    
    for y in 0..<reversed.count - minY {
        if reversed[y].contains("#") {
            maxY = reversed.count - y
            break
        }
    }
    
    for y in minY..<maxY {
        if wallpaper[y].contains("#") {
            for x in wallpaper[y].enumerated() {
                if x.1 == "#" {
                    minX = min(x.0, minX)
                    maxX = max(x.0 + 1, maxX)
                }
            }
        }
    }
        
    return [minY, minX, maxY, maxX]
}