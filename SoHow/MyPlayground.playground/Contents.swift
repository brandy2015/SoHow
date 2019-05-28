import UIKit

var words = "Hello,playground"
print(words.count)

func StringRange(words:String,start:Int,lens:Int) -> String? {
    if 0 < words.count && lens <= words.count && lens <= words.count && start < words.count && (start + lens) <= words.count {
        return (words as NSString).substring(with: NSMakeRange(start,lens))
    }
    return nil
}
public extension String{
    
    func containsString(Contain:String) -> Bool {return NSString(string: self).contains(Contain)}
    
    
    
    func SubString(start:Int,lens:Int) -> String? {
        return StringRange(words: self, start: start, lens: lens)
    }
    
    //2，要使用NSString的情况
    ///2）String与Range配合比较麻烦，比如下面截取字符串的一部分，
    ////先转换成NSString
    //let rangeStr1 = (words as NSString).substringWithRange(NSMakeRange(4,2)) //ge
    
    ////不转换
    //let index =  words.index(words.startIndex, offsetBy: 6)
    //let index2 =  words.index(words.startIndex, offsetBy: 8)
    ////let index2 = words.startIndex.advancedBy(6)
    //let range:Range<String.Index> = Range<String.Index>(uncheckedBounds: (index,index2))
    //
    //let rangeStr2 = words.substring(with: range)
    subscript(i: Int) -> Character? {
        get {return self.SubString(start: i, lens: 1)?.first}
    }
//    f f是起点，t是长度
    subscript(start:Int,lens:Int) -> String? {
        get {return self.SubString(start: start, lens: lens)}
    }
    
//    r是一个区间
//    "hello world"[0...1] // "he"
//    "hello world"[0..<1] // "h"
//    "hello world"[0] // "h"
//    "hello world"[0...10] // "hello world"
    
    subscript(r: Range<Int>) -> String? {
        get {return self.SubString(start: r.startIndex, lens: r.endIndex - r.startIndex)}
    }

    
    subscript(r: (x1:Int,x2:Int)) -> String? {
        get {return self.SubString(start: r.x1, lens: r.x2 - r.x1)}
    }
    
//    let name = "Marie Curie"
//    let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
//    let firstName = name[..<firstSpace]
//    print(firstName)
    
//    print(Array(name.utf8[..<firstSpace]))
//    // Prints "[77, 97, 114, 105, 101]"
}




//先转换成NSString
let rangeStr1 = (words as NSString).substring(with: NSMakeRange(1,15))



let rangeStr2 = StringRange(words: words, start: 0, lens: 15)
let rangeStr3 = words.SubString(start: 2, lens: 1)


let rangeStr4 = words[15]
let rangeStr5 = words[0,16]


let rangeStr6 = words[0..<15]
