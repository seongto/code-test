import Foundation

func checkText(_ array: [Character]) -> Bool{
    var current: [Character] = []
    
    for char in array {
        switch char {
            case "]":
                if current.last == "[" {
                    current.removeLast()
                } else {
                    return false
                }
            case "}":
                if current.last == "{" {
                    current.removeLast()
                } else {
                    return false
                }
            case ")":
                if current.last == "(" {
                    current.removeLast()
                } else {
                    return false
                }
            default:
                current.append(char)
        }
    }
    
    return current.isEmpty ? true : false
}


func solution(_ s:String) -> Int {
    let array: [Character] = s.map { $0}
    var count: Int = 0
    
    for i in 0..<array.count - 1 {
        if i == 0 {
            if checkText(array) {
                count += 1
            }
        } else {
            var arr: [Character] = array
            
            for j in 0..<i {
                arr.append(array[j])
                arr.removeFirst()
            }
                        
            if checkText(arr) {
                count += 1
            }
        }
    }
    
    
    return count
}