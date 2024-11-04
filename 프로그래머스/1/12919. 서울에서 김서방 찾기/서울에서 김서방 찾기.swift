func solution(_ seoul:[String]) -> String {
    var loc:Int = seoul.index(of: "Kim")!
    return "김서방은 \(loc)에 있다"
}