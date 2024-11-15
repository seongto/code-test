import Foundation

func changeTimeToSec(_ time: String) -> Int {
    var timeArr: [String] = Array(time.split(separator: ":").map { String($0)})
    
    return (Int(timeArr[0])! * 60) + Int(timeArr[1])!
}

func changeSecToTime(_ sec: Int) -> String {
    guard sec != 0 else {
        return "00:00"
    }
    
    var mm: String = String(sec / 60)
    var ss: String = String(sec % 60)
    
    if mm.count < 2 {
        mm = "0" + mm
    }
    
    if ss.count < 2 {
        ss = "0" + ss
    }
    
    return "\(mm):\(ss)"
}



func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    var length: Int = changeTimeToSec(video_len)
    var opStart: Int = changeTimeToSec(op_start)
    var opEnd: Int = changeTimeToSec(op_end)
    
    func checkOp(_ cur:Int) -> Int {
        var curSec:Int = cur
        if curSec < 0 {
            curSec = 0
        } else if curSec > length {
            curSec = length
        }
        
        if (curSec >= opStart) && (curSec < opEnd) {
            return opEnd
        } else {
            return curSec
        }
    }
    
    var result: Int = checkOp(changeTimeToSec(pos))
    
    for com in commands {
        if com == "next" {
            result += 10
        } else {
            result -= 10
        }
        
        result = checkOp(result)
    }
    
    return changeSecToTime(result)
}
