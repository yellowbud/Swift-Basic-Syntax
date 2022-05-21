import UIKit

//-----------------关联类型可以添加 where 约束子句------------------------//

/*
 
 associatedtype 是Swift协议的关键字，也是swift泛型编程思想的一种实现
 
 associatedtype的功能，其可以使用where子句进行更加精准的约束 ：
 
 */

//容器协议
protocol Container {
    //约束item 泛型为 Int类型
    associatedtype Item where Item == Int
    func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
class MyIntArray: Container {
    //这个地方必须指定为Int否则会报错
    typealias Item = Int
    func append(_ item: Int) {
        self.innerArray.append(item)
    }
    var count: Int{
        get{
            return self.innerArray.count
        }
    }
    subscript(i: Int) -> Int {
        return self.innerArray[i]
    }
    var innerArray = [Int]()
}

//-------------------增强字符串和区间运算符的功能---------------------------------//

/*
 
 引入了字面量创建多行文本的语法
 
 
 
 */

// 多行字符串
var multiLineString = """
abcd
jaki
24
"""
print(multiLineString)

/*
 这种方式可以大大减少在创建字符串时人为添加换行符。
 
 引入了字符串界定符的语法，其可以指定哪些位置为字符串的边界，使用符号“#”来定义边界。例如，当我们的字符串中有单引号、双引号这类特殊字符时，通常需要使用转义符来进行处理。
 比如：
 */
var string1 = "这里有一个双引号\""

//如果使用字符串界定符，就可以去掉转义的烦恼

var string2 = #"这里有一个双引号""#

//字符串界定符也可以用来界定多行文本，如果界定的文本中本身有转义字符，则其会被原封不动地输出，例如：
//将输出"1\n2\n3\n”
var string4 = #"""
1\n2\n3\n
"""#
// 1\n2\n3\n

//如果我们需要让转义字符在字符串界定符中保持原有的作用，则需要使用 “\#”进行转义，如下


var string3 = #"""
1\#n2\#n3\#n
"""#

/*
 1
 2
 3
 */



let array = ["1","2","3"]
for item in array[0...]{
    print(item)
}
