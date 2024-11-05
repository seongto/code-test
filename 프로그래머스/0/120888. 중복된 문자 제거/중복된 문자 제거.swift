import Foundation

func solution(_ my_string:String) -> String {
    var answer: String = ""
    var arr: [String] = my_string.map { String($0)}
    var wordSet: Set<String> = Set(arr)
    
    for char in arr {
        if wordSet.contains(char) {
            answer += char
            wordSet.remove(char)
        }
    }
                                       
    return answer
}