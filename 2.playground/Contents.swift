import Foundation
import UIKit
import libkern
import Security

let date = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
print(dateFormatter.string(from: date))

//locale是用来处理不同语系格式化相关的一个结构
dateFormatter.locale = Locale(identifier: "en")

//Calendar 用于处理时间与时间之间的计算

let calendar = Calendar.current //取得使用者的日历
let netDate = calendar.date(byAdding: .day, value: 3, to: date) //当前日期加上三天

dateFormatter.dateFormat = "yyyy/MM/dd"

/*
 UIVisualEffectView 的基础知识
 
 Visual Effects 是一整套的视觉特效，包括了UIBlurEffect和 UIVibrancyEffect，这两者都是UIVisualEffect的子类，前者允许在应用程序中动态地创建实时地雾玻璃效果，而后者则允许在雾玻璃上“写字”。
 
 为了创建一个特殊效果，先创建一个UIVisualEffectView视图对象。我们可以把这个对象看作效果的一个容器，实际效果会影响到该视图对象底下的内容，或者添加到该视图对象的contentView中的内容。

 */

class Person {
    var name: String
    var age:Int
    init(name:String,age:Int){
        self.name = name
        self.age = age
    }
}

extension Person:CustomStringConvertible {
    var description: String {
        get {
            return "\(name) age \(age)"
        }
    }
}

let zhangsan = Person(name: "zhangsan", age: 28)
//-----------------------------------//

/*
Swift 提供了一个额外的整数类型：Int，它拥有与当前平台的原生字相同的长度
 
同时 Swift 也提供 Uint 类型，来表示平台长度相关的无符号整数
 
建议在用到整数的地方都使用 Int
 
 Double：64 位浮点数，至少有15位数字的精度
  Float：32 位浮点数，至少有6位数字的精度
 在两种类型都可以的情况下，推荐使用 Double 类型
 
*/

/*
 类型别名
 •类型别名是一个为已存在类型定义的一个可选择的名字
 •你可以关键字 typealias 定义一个类型的别名
 •当你想通过在一个在上下文中看起来更合适可具有表达性的名字来引用一个已存在
 的类型时，这时别名就非常有用了
 
 
 */

typealias AudioSample = UInt8
let sample:AudioSample = 32



/*
 Tuple
 元组把多个值合并成单一的复合型的值
 元组内的值可以是任何类型，而且可以不必是同一类型
 
 Tuple 修改
 用var 定义的元组就是可变元组，let 定义的就是不可变元组
 不管是可变还是不可变元组，元组在创建后就不能增加和删除元素
 可以对可变元组的元素进行修改，但是不能改变其类型
 any 类型可以改为任何类型
 
 Tuple 分解            tulip郁金香
 以将一个元组的内容分解成单独的常量或变量
 如果只需要使用其中的一部分数据，不需要的数据可以用下滑线（_）代替
 
 */

let error = (1,"没有权限")
print(error)
print(error.0)
print(error.1)

let(_, errorMessage) = error
print(errorMessage)

//元组的分解
let error3 = (1, "没有权限")
let (errorCode3,errorMessage3) = error
print(errorCode3)
print(errorMessage3)

//修改元组元素
var error2 = (errorCode2:1, errorMessage2:"没有权限")
error2.errorCode2 = 2
print(error2)
//元组元素只能修改成同一类型

//定义为Any类型，则可以修改任意类型
var error4:(errorCode4:Int, errorMessage4:Any) = (errorCode4: 1, errorMessage4:"没有权限")
error4.errorMessage4 = 3


//元组作为返回值，为函数返回多个返回值
func writeFile(content:String) -> (ec:Int, em:String) {
    return(1,"没有权限")
}
let error5 = writeFile(content: "")
print(error5)


//可选绑定可以与 if 和while 的语句使用来检查可选项内部的值，并赋值给一个变量或常量
//同一个i 语句中包含多可选项绑定，用逗号分隔即可。如果任一可选鄉定结果是nil 或者布尔值为 false，那么整个计判断会被看作 false

//optional 可选链
let str:String? = "abc" // 等同 var str:Optional<String> = "abc" 泛型是string
let count = str?.count //count也是可选值
if count != nil {
    let lastIndex = count! - 1 //隐式展开
    print(lastIndex)
}


/*
 有些可选项一旦被设定值之后，就会一直拥有值，在这种情况下，就可以去掉检查的需求，也不必每次访问的时候都进行展开
 
 通过在声明的类型后边添加一个叹号（String!）来书写隐式展开可选项
 
 隐式展开可选项主要被用在 Swift 类的初始化过程中
 */
let str2:String! = "abc" //隐式展开
let count2 = str2?.count

//看源码
let str3:Optional<String> = "abc"
if str3 != nil {
    let count = str.unsafelyUnwrapped.count
    print(count)
}

//------多行字面量-------//

//多行字符串字面量把所有行包括在引号内，开始和结束默认不会有换行符


var emost = "" // 字面量初始化空串
var anoteherE = String()//初始化器语法


//如果你想要使用换行符来让你的代码易读,不想让换行符成为字符串的值，那就在那些行的未尾使用\
let sW1 = """
gdhjchdh    cbdsjhbchjs \
csdcvsdjbvjks \
                     
dvcdvd
""" // //在多行字符串字面量里包含了换行
print(sW1)

let sW = """
4
34
1
2
"""
print(sW)

let numbers = """

1
2
3

4
5
"""
print(numbers) //换行

let number11 = """
1\
2\
3\
5
6
7
"""
print(number11) // 加入 \ 忽略换行


    let nu1 = """
    1
    2
        3
    4
    5
    """
print(nu1) //最后一个“”“前的缩紧都会被忽略

//扩展字符串分隔符 (Raw String)

let vddsfs = "1\n2\n3" // \n换行符起作用
print(vddsfs)

let vddsfs1 = #"1\n2\n3"# // 放置扩展分隔符来在字符串中包含特殊字符而不让它们真的生效
print(vddsfs1) // 1\n2\n3

let vddsfs2 = #"1\#n2\n3"# //   \#n成为换行符       如果你需要字符串中某个特殊符号的效果，使用匹配你包裹的井号数量的井号并在前面写转义符号\
print(vddsfs2)

//如果字符串里有"#，则首尾需要两个#
let dfsd = ##"1"#2\n3"## //1"#2\n3
print(dfsd) //

let ddsf = ##"6"#7\##n8"##
print(ddsf)

let dsf = ##"6"#7\#n8"## //   6"#7\#n8
print(dsf)


//字符串是值类型
//使用加赋值符号 += 在已经存在的 String 值未尾追加一个 String 值

let strin = "6 * 7 = /(6 * 7)"
print(strin) // 6 * 7 = 42

let ghg = #"6 * 7 = \(6 * 7)"#
print(ghg) // 6 * 7 = \(6 * 7)

let fdf = #"6 * 7 = \#(6 * 7)"#
print(fdf) // 6 * 7 = 42

//--------如何使用索引访问和修改字符串-----------//

var welcome = "hello"
welcome[welcome.startIndex] // h 第一次字符

welcome[welcome.index(before: welcome.endIndex)] //o 最后一个字符

//插入字符，使用 insert(_:at:) 方法
welcome.insert("!", at: welcome.endIndex) // "hello!" endIndex 最后一位索引的后一位

//插入另一个字符串的内容到特定的索引，使用 insert(contentsOf:at) 方法
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex)) //"hello there!"

//删除字符，使用 remove(at:)方法
welcome.remove(at: welcome.index(before: welcome.endIndex)) //删除最后一位字符
print(welcome) //hello there


//删除一小段特定范围的字符串，使用removeSubrange(_:)方法
let range = welcome.index(welcome.endIndex, offsetBy: -7)..<welcome.endIndex
welcome.removeSubrange(range)
print(welcome) // hell



//使用 index(before:）和 index(after:）方法来访问给定索引的前后

//要访问给定索引更远的索引，你可以使用 index(_:offsetBy:)

//使用 indices 属性来访问字符串中每个字符的索引





let numb = "01234567"
let index = numb.index(numb.startIndex, offsetBy: 7) // 索引7
numb[index] //7


/*
 子字符串
 
 使用下标或者类似 prefix(_）的方法得到的子字符串是Substring 类型
 Substring 拥有 String 的大部分方法
 Substring 可以转成 String 类型
 
 */


let welcome1 = "hello, world"
let index1 = welcome1.firstIndex(of:",") ?? welcome1.endIndex
let subString1 = welcome1[..<index]
print(subString1)


//如果赋值符号右侧是拥有多个值的元组，它的元素将会一次性地拆分成常量或者变量。

//Swift 的赋值符号自身不会返回值。

/*
 
 余数运算符
 
 当a是负数时也使用相同的方法来进行计算。
 
 当b为负数时它的正负号被忽路掉了。这意味着a%b与a％-b能够获得相同的答案。
 
*/

let c1 = 9 % 4 // 1
let c2 = 9 % -4 // 1

let c3 = -9 % 4 // -1


/*
 
 &+ 溢出加法          &- 溢出减法          &* 溢出乘法
 
 合并空值运算符
 
 合并空值运算符（a ？？b）如果可选项a 有值则展开，如果没有值，是nil，则返回默认值b
 
 表达式a必须是一个可选类型。表达式b必须与a的储存类型相同。
 
 实际上是三元运算符作用到 Optional 上的缩写 (a != nil ? a!:b)
 如果 a 的值是非空的，b的值将不会被考虑，也就是合并空值运算符是短路的。

 */



func addT(num1: Int?, num2: Int?) -> Int {
    return (num1 ?? 0) + (num2 ?? 0)
}



let a1:Int? = 3
let a2 = 4
print(a1 ?? a2) //3

let a3:Int? = nil
let a4 = 5
print(a3 ?? a4) // 5


let range1 = ...5
range1.contains(7) //false
range1.contains(4) //true
range1.contains(-1) //true


//倒序索引 reversed()方法
for i in (0..<10).reversed(){
    print(i)
}

let names = ["ds","gf","gb","df"]
for name in names[...2] {
    print(name)
}

for name in names[..<1] {
    print(name) //ds
}

//区间运算符可以作用在 Comparable 类型上，返回闭区间和半闭区间

let wel = "fsdf,fdsf"
let interval = "a"..."z" //Comparable 区间
for c in wel {
    if !interval.contains(String(c)) {
        print("\(c)不是小写字母")
    }
}

// 位取反运算符（~）是对所有位的数字进行取反操作

let number1: UInt8 = 255
let number2 = ~number1 // 0 取反。 UInt8 1字节 区间值 0到255


//与运算符（&） 只有当这两个数都是1的时候才能返回 1
let number3 = number1 & number2 // 0


//位或运算符（|） 任意一位为1 ，为 1
let number4 = number1 | number2 // 255

// 异或运算符，或者说"互斥或”（^）.不相同为1，相同为0
let number5 = number1 ^ number2 // 255



//将一个数左移一位相当于把这个数翻倍
let number6: Int8 = 8
print(number6 << 1) //16
//将一个数右移一位相当于把这个数减半
print(number6 >> 1) //4

let number61: Int8 = -8
print(number61 << 1) //-16
print(number61 >> 1) //-4


//两个数字交换
//不借助临时变量，交换两个变量的值。
var a = 10
var b = 8
a = a ^ b
b = a ^ b
a = a ^ b
print(a)
print(b)


/*
求无符号整数二进制中1的个数
给定一个无符号整型 （UInt）变量，求其二进制表示中“1”的个数，要求算法的执行效率尽可能的高。
 
 思路：看一个八位整数 10 100 001，先判断最后一位是否为 1，而“与"操作可以达到
 目的。可以把这个八位的数字与 00000001 进行“与“操作。如果结果为 1．则表示当前
 八位数的最后一位为 1，否则为0。怎么判断第二位呢？向右移位，再延续前面的判断即可。
*/

func countOfOnes(num: UInt) -> UInt {
    var count: UInt = 0
    var temp = num
    var loopCount = 0
    while temp != 0 {
        count += temp & 1
        temp = temp >> 1
        loopCount += 1
    }
    print("loopcount\(loopCount)")
    return count
}
countOfOnes(num: 0) //0
countOfOnes(num: 8) //1
countOfOnes(num: 255) //8
/*
 如果整数的二进制中有较多的 0，那么我们每一次右移一位做判断会很浪费，怎么改进
 前面的算法呢？ 有没有办法让算法的复杂度只与“1”的个数有关？
 
 思路：为了简化这个问题，我们考虑只有高位有 1的情况。例如：11 000000，如何跳过前面低
 位的6个0，而直接判断第七位的1？我们可以设计 11000000 和10119 111 （也就是 11 000
 000-1） 做"与"操作，消去最低位的 1。如果得到的结果为 0，说明我们己经找到或者消去里面最
 后一个1。如果不为 0，那么说明我们消去了最低位的 1，但是二进制中还有其他的 1，我们的
 计数器需要加 1，然后继续上面的操作。
 
 计数器 count =0
 步骤一：
 整数不为 0，说明二进制里肯定有 1，count =1
 11 000 000 & 10111 111= 10 000 000（消去第七位的 1）
 
 步骤二：结果不为 0，说明二进制里还有1， count =2
 10 000 000 & 01111 111= 0（消去第八位的 1）
 
 步骤三：结果为0，终止，返回count为2。
 
 */

func countOfOnes2(num: UInt) -> UInt {
    var count: UInt = 0
    var temp = num //临时变量
    var loopCount = 0
    while temp != 0 {
        count += 1
        temp = temp & (temp - 1)
        loopCount += 1
    }
    print("loopcount\(loopCount)")
    return count
}

countOfOnes2(num: 0) // 0
countOfOnes2(num: 8) // 1
countOfOnes2(num: 255) // 8
print(countOfOnes2(num: 0x100010))

/*
 如何判断一个整数为 2的整数次幂
 
 给定一个无符号整型 （UInt）变量，判断是否为 2的整数次幂。
 
 思路：一个整数如果是2的整数次方，那么它的二进制表示中有且只有一位是1，而
 其它所有位都是0。
 根据前面的分析，把这个整数减去1后再和它自己做与运算，这个整数中唯一的 1就变成0了，也就是得到的结果为0
 
*/

func isPowerOfTwo(num: UInt) -> Bool {
    return (num & (num - 1)) == 0
}
print(isPowerOfTwo(num: 512))
print(isPowerOfTwo(num: 1023)) //fasle


/*
 
 很多成对出现的正整数保存在磁盘文件中，注意成对的数宇不一定是相邻的，如2,3，4,3,4,2........，由于意外有一个数字消失了，如何尽快找到是哪个数字消失了?
 
 思路：考虑"异或”操作的定义，当两个操作数的对应位不相同时，该数的对应位就为1。也就是说如果是相等的两个数"异或”，得到的结果为 0，而0与任何数字“异或”得到的是那个数字本身。所以我们考虑将所有的数字做“异或”操作，因为只有一个数字消失，那么其他两两出现的数宇“异或"后为 0，0与仅有的一个的数字做“异或”，我们就得到了消失的数字是哪个。
 
 */

func findLostNum(nums:[UInt]) -> UInt {
    var lostNum: UInt = 0
    for num in nums {
        lostNum = lostNum ^ num
    }
    return lostNum
}
print(findLostNum(nums: [1,1,2,3,4,3,2])) //4 只出现一次






/*
 
 如果有两个数字意外丢失了 （丢失的不是相等的数字），该如何找到丢失的两个数字？
 
 思路：设题目中这两个只出现 1次的数字分别为 A和B，如果能将A，B分开到二个数组
 中，那显然符合"异或"解法的关键点了。因此这个题目的关键点就是将 A，B分开到二个数
 组中。由于 A，B肯定是不相等的，因此在二进制上必定有一位是不同的。根据这一位是0
 还是1可以将A和B 分开到 A组 和 B组。而这个数组中其它数字要么就属于 A组，要么就
 属于B组。再对 A组 和B组 分别执行“异或”解法就可以得到 A，B了。而要判断A，B 在哪
 一位上不相同，只要根据“A 异或 B”的结果就可以知道了，这个结果在二进制上为 1的位都
 说明 A，B在这一位上是不相同的。
 

 */
func findTwoLostNums(nums:[UInt]) -> (UInt,UInt) {
    var lostNum1: UInt = 0
    var lostNum2: UInt = 0
    
    // 计算两个数的异或结果
    var temp: UInt = 0
    for num in nums {
        temp = temp ^ num
    }
    //找到第一个为1的位
    var flag: UInt = 1
    while ((flag & temp) == 0) {
        flag = flag << 1
    }
    
    //找两个丢失的数字。分组计算
    for num in nums {
        if (num & flag) == 0 {
            lostNum1 = lostNum1 ^ num
        } else {
            lostNum2 = lostNum2 ^ num
        }
    }
    return(lostNum1,lostNum2)
}
findTwoLostNums(nums: [1,1,2,3]) // (2,3) 只出现一次的数字
