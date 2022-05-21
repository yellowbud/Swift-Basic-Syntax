import UIKit
import Foundation

var str:String = "Hello, playground"
str = "" //如果一个Optional类型变量没有赋值，则其为nil，如果赋值为空字符串，则其并不是nil。

//String类型实际上是一个结构体，整型、浮点型和布尔型也是由结构体实现的。swift语言中的结构体十分强大，其可以像类一样进行属性和方法的定义，


//通过结构体构造方法来进行str变量的构造
str = String()              //构造空字符串      ""
str = String("hello")       //通过字符串构造     "hello"
str = String(666)           //通过整型数据构造    "666"
str = String(6.66)          //通过浮点型数据构造  "6.66"
str = String("a")           //通过字符构造       "a"
str = String(false)         //通过Bool值构造     "false"
str = String(describing: (1,1.0,true))  //通过元组构造       "(1,1.0,true)"
str = String(describing: [1, 2, 3])     //通过列表构造       "[1, 2, 3]"
str = String(format:"我是%@","珲少") //通过格式化字符串构造 "我是珲少"
str = String(describing: Int.self)           //通过类型来构造字符串 "Int"

/*Sting类型提供了很多重载的构造方法，开发者可以传入不同类型的参数来构造需要的字符串。string类型提供的构造方式十分宽泛，甚至可以将其他类型通过构造方法转换为字符串，示例如下：
 str = String(describing: Int.self) ///通过类型来构造字符串 "Int"
*/

//整型、浮点型数据可以使用构造方法的方式来实现互相转换，例如：
var a = Int(1.05)     //将1.05 转成1
var b = Float(a)      //通过整型数据a构造浮点型数据b

//字符串的组合
var c1 = "Hello"
var c2 = "World"
var c3 = c1+" "+c2  //"Hello World" 注意中间拼接了一个空格

//使用\()进行字符串插值
var d = "Hello \(123)"      //"Hello 123"
var d2 = "Hello \(c2)"      //"Hello World"
var d3 = "Hello \(1+2)"      //"Hello3"
// “\()”结构可以将其他数据类型转换为字符串类型并且插入字符串数据的相应位置，也可以进行简单的运算逻辑后将结果插入原字符串中，这种方法可以十分方便地进行字符串的格式化，

//3.2字符类型
//使用 Character来描述字符类型，Character类型和String类型都占16字节的内存空间，用MemoryLayout枚举来获取某个类型所占用的内存空间，单位为字节
MemoryLayout<String>.size // 16  获取string类型占用的内存空间
MemoryLayout<Character>.size // 16


//Character 用来描述一个字符，我们将一组字符组组合成一个数组，用于构造字符串：
//创建一个字符
var e:Character = "a"
//创建字符数组
var e2 : [Character] = ["H","E","L","L","O"]
//通过字符数组来构造字符串 "HELLO"
var e3 = String(e2)
//通过构造方法来创建字符类型变量
var e4 = Character("a")
//进行for-in遍历，可以将字符串中的字符拆解出来
let name = "China"
for character in name {
    print(character)//将依次打印C、h、i、n、a
}
// in 关键字后面需要为一种可选代的类型，in关键宇前面是每次循环从选代器中取出的元素，其类型会由 xcode 编译器自动推断出来

//3.2.2 转义字符

/*特殊用途的转义字符，用特殊的符号组合来表示特定的意义：
 \(): 用来表示空白符
 \\: 用来表示反斜杠
 \t: 用来表示制表符
 \n: 用来表示换行符
 \r: 用来表示回车符
 \': 用来表示单引号
 \": 用来表示双引号
 \u{} : 用Unicode码来创建字符

 */


//使用unicode码来创建字符,Unicode为21代表的字符为!
"\u{21}"

//换行符常用来处理多行文本的排版



//3.3

// String类型中封装了许多实用的属性和方法，例如字符串的检查，字符的追加、插入、删除操作，字符数的统计等

//String类型的实例通过使用isEmpty方法来判断宇符串的值是否为空宇符串
//判断字符串是否为空
var obj1 = ""
if obj1.isEmpty {
    print("字符串为空字符串")
}
//获取字符串中字符个数
obj1.count

/*当字符串变量中的字符数为0时，也可以认定此字符串为空字符串，即通过字符串的count属性判断其中的字符个数是否为0.示例如下：
if obj1.count == 0 {
 print("字符串为空字符串")
 }
*/


var com1 = "30a"
var com2 = "31a"
//比较两个字符串是否相等 只有两个字符串中的所有位置的字符都相等时 才为相等的字符串
com1==com2
//比较两个字符串的大小。在比较两个字符串的大小时，会逐个对字符的大小进行比较，直至遇到不相等的字符为止。
com1<com2

//可以通过下标的方式来访问字行串中的每一个字符
var string = "Hello-Swift"
//获取字符串首个字符的下标  0位置 startIndex是第一个字符的索引
var startIndex = string.startIndex
//获取最后一个字符后面的下标  11位置 endIndex是最后一个字符后面的索引 endIndex is the index after the last character
var endIndex = string.endIndex

//startIndex和endIndex获取到的值为index类型，并不是整数类型，它们不能直接进行加减运算，需要使用相应的方法进行下标的移动操作，示例如下：

//获取某个下标后一个下标对应的字符 char="e"
var char = string[string.index(after: startIndex)]
//获取某个下标前一个下标对应的字符 char2 = "t"
var char2 = string[string.index(before: string.endIndex)]

//上面的代码中，index(after：)方法用来获取当前下标的后一位下标，index(before：)方法用来获取当前下标的前一位下标。也可以通过传入下标范围的方式来截取字符串中的某个子串，示例如下：

//通过范围获取字符串中的一个子串 Hello
var subString = string[startIndex...string.index(startIndex, offsetBy: 4)]
var subString2 = string[string.index(endIndex, offsetBy: -5)..<endIndex] //Swift
// ...为范围运算符。offsetBy参数传入的是下标移动的位数，若向其中传入正数，则下标向后移动相应位数，若向其中传入负数，下标向前移动相应位数.使用这种方式来截取字符串十分方便。

//String类型中还封装了一些方法，可以便捷对字符串进行追加、插入、替换、删除


//追加一个字符
string.append(Character("!")) //string = "Hello-Swfit!"

//获取某个子串在父串中的范围
var range = string.range(of: "Hello")

//追加字符串操作
string.append(" Hello-World") //string = "Hello-Swfit!"

//在指定位置插入一个字符
string.insert("~", at: string.index(string.startIndex, offsetBy: 12)) //string = "Hello-Swift!~ Hello-World"

//在指定位置插入一组字符
string.insert(contentsOf: ["~","~","~"], at: string.index(string.startIndex, offsetBy: 12)) //string = "Hello-Swift!~~~~ Hello-World"

//在指定范围替换一个字符串
string.replaceSubrange(string.startIndex...string.index(string.startIndex, offsetBy: 4), with: "Hi")//string = "Hi-Swift!~~~~ Hello-World"

//在指定位置删除一个字符
string.remove(at: string.index(before:string.endIndex)) //string = "Hi-Swift!~~~~ Hello-Worl"

//删除指定范围的字符
string.removeSubrange(string.startIndex...string.index(string.startIndex, offsetBy: 2)) //string = "Swift!~~~~ Hello-Worl"

//删除所有字符
string.removeAll() //string = ""

var string2 = "My name is Jaki"
//全部转换为大写
string2 = string2.uppercased() //"MY NAME IS JAKI"
//全部转换为小写
string2 = string2.lowercased() //"my name is jaki"
//检查字符串是否有My前缀
string2.hasPrefix("My") //false
//检查字符串是否有jaki后缀
string2.hasSuffix("jaki") //true


//3种集合类型：数组 （Array）、集合（set）和字典 (Dictionary)
//集合(Set)是一组无序的数据，其中存入的数据没有编号，开发者可以使用遍历的方法获取其中所有的数据。

//3.4.1 数组（Array）类型
// 数组中能存放的元素并非只是数字，它可以存放任意类型的数据，但是所有数据的类型必须统一。
//数组中元素的类型决定了数组的类型，例如，一个存放整型数据的数组被称为整型数组，一个存放字符串型数据的数组被称为字符串型数组。在创建数组实例的时候，必须明确指定其中所存放元素的类型。
/*
 //Int型数组 两种声明方式
 var array1:[Int]
 var array2:Array<Int>
 
 上面两行代码都声明了一个int类型的数组实例.数组的创建可以使用两种方式，一种是使用数组的构造方法来创建，另一种是使用中括号来快捷创建，示例如下：
 创建空数组
 array1 = []
 array2 = Array() //数组构造的方式
 创建整型数组
 array1 = [1,2,3]
 通过一组元素创建数组
 array2 = Array(arrayLiteral: 1,2,3)
 
 
 
 和string类型类似，空数组的含义并非是变量为nil，而是数组中的元素为空,swift中只有optional类型的变量可以为nil
 
 
 
 
 数组采用结构体来实现，对于大量重复元素的数组，可以直接使用快捷方法来创建，示例如下：
 
 //创建大量相同元素的数组
 
 创建有 10个 String 类型元素的数组，并且每个元素都为字符串"Hello"
 var array3 = [String](repeating: "Hello", count: 10)
 
 创建有10个Int类型元素的数组，且每个元素都为 1
 var array4 = Array (repeating: 1, count: 10)
 
 数组在声明时必须要明确其类型，但是并不一定需要显式地指定类型，如果数组在声明时也设置了初始值，则编译器会根据赋值类型自动推断出数组的类型。
 
 数组相加拼接，数组类型必须相同
var array5 = [1,2,3] + [4,5,6]
 */

var array = [1,2,3,4,5,6,7,8,9]
array.count //获取数组中元素的个数

//检查数组是否为空数组
if array.isEmpty {
    print("array为空数组")
}

//通过下标获取数组中的元素
//var a = array[0]

//获取区间元素组成的新数组 [1,2,3,4]
var subArray = array[0...3]

//获取数组的第 1个元素
//var b = array.first

//获取数组的最后一个元素
//var c = array.last

//修改数组中某个位置的元素
array[0] = 0

//修改数组中区间范围的元素
array[0...3] = [1,2,3,4]

//向数组中追加一个元素
array.append(10)

//向数组中追加一组元素
array.append(contentsOf: [11,12,13])

//向数组中的某个位置插入一个元素
array.insert(0, at: 0)

//向数组中的某个位置插入一组元素
array.insert(contentsOf: [-2,-1], at: 0)

//移除数组中某个位置的元素
array.remove(at: 1)

//移除数组中首个位置的元素
array.removeFirst()

//移除最后一个位置的元素
array.removeLast()

//移除前几位元素 参数为要移除元素的个数
array.removeFirst(2)

//移除后几位元素 参数为要移除元素的个数
array.removeLast(2)

//移除一个范围内的元素
array.removeSubrange(0...2)

//替换一个范围内的元素
array.replaceSubrange(0...2, with: [0,1])

//移除所有元素
array.removeAll()

//判断数组中是否包含某个元素
if array.contains(1) {
    print(true)
}

//只有当数组实例为变量时，才可以使用增、删、改等方法，常量数组不能进行 修改相关的操作



//可以使用for-in遍历来获取数组中的元素，示例如下：

//Int 型数组
let arrayLet = [0,1,2,3,4]

//(Int,Int)型数组
let arrayLet2 = [(1,2),(2,3),(3,4)]

//直接遍历数组
for item in arrayLet {
    print(item)
}

//进行数组枚举遍历，将输出 (0,0） (1,1) (2,2） (3,3) (4,4)
for item in arrayLet.enumerated() {
    print(item)
}
//数组实例中有一个enumerated()方法，这个方法会返回一个元组集合，将数组的下标和对应元素返回。


//和string类型不同的是，数组中的下标可以是int类型，而String中的下标是严格的Index类型


//进行数组角标遍历     //数组类型中有一个indices 属性，这个属性将返回一个范围（Range），此范围就是数组下标的范围
for index in arrayLet2.indices{
    print(arrayLet2[index], separator: "")
}



//Swift中的for-in结构在遍历数组时会按照顺序进行遍历。


/*数组类型中还提供了一个排序函数
 如果数组中的元素为整型数据，则可以使用系统提供的sorted(by：)方法来进行排序操作
 如果是一些自定义的类型，也可以对sorted(by:)方法传入闭包参数实现新的排序规则
*/
//var arraySort = [1,3,5,6,7]
//从大到小排序
//arraySort = arraySort.sorted(by: >)

//从小到大排序
//arraySort = arraySort.sorted(by: <)



/*下列方法可以获取数组中的最大值与最小值：
var arraySort = [1,3,5,6,7]
获取数组中的最大值
 arraySort.max()
 
 获取数组中的最小值
 arraySort.min()
*/


//3.4.2集合（Set）类型
//集合类型不关注元素的顺序，但是其中的元素不可以重复，也可以将其理解为一个无序的集合。与数组一样，集合在声明时必须指定其类型，或者对其赋初值，使得编译器可以自行推断出集合的类型。

//创建set
var set1:Set<Int> = [1,2,3,4]
var set2 = Set(arrayLiteral: 1,2,3,4)

//由于集合并不关注其中元素的顺序，因此通过下标的方式来取值对集合来说不太有意义，但是集合类型依然支持通过下标来获取其中的元素，示例如下：

//获取集合首个元素〔顺序不定）
set1[set1.startIndex]

//进行下标的移动
//获取某个下标后一个元素
set1[set1.index(after: set1.startIndex)]
//获取某个下标后几个元素
set1[set1.index(set1.startIndex, offsetBy: 3)]

//集合的下标操作为不可逆的操作，只能向后移动，不能向前移动。

//获取元素个数
set1.count

//判断集合是否为空集合
if set1.isEmpty {
    print("集合为空")
}

//判断集合中是否包含某个元素
if set1.contains(1) {
    print("集合包含")
}

//获取集合中的最大值
set1.max()

//获取集合中的最小值
set1.min()

//集合同样支持进行增、删、改、查操作

set1.insert(5) //向集合中插入一个元素

set1.remove(1) //移除集合中的某个元素

set1.removeFirst() //移除集合中的第一个元素

set1.remove(at: set1.firstIndex(of: 3)!) //移除集合中某个位置的元素
//在使用remove（at：）方法删除某个位置的元素时，需要传入一个集合元素的下标值，通过firstIndex(of: )方法可以获取具体某个元素的下标值。需要注意，这个方法将会返回一个optional类型的可选值，因为要寻找的元素可能不存在，在使用时，需要对其进行拆包操作。


set1.removeAll() //移除集合中所有的元素




//集合还有一个独有的特点：可以进行数学运算，intersection（交集） symmmetricDifference（交集的补集） union（并集）和 subtracting（补集）
var set3:Set<Int> = [1,2,3,4]
var set4:Set<Int> = [1,2,5,6]

var setInter = set3.intersection(set4) //返回交集 {1，2}

var setEx = set3.symmetricDifference(set4) //返回交集的补集{3，4，5，6}

var setUni = set3.union(set4) //返回并集{1，2，3， 4，5, 6}

var setSub = set3.subtracting(set4) //返回第二个集合的补集{3， 4}。  补上set4中没有的


//使用比较运算符“==”可以比较两个集合是否相等，当两个集合中的所有元素都相等时，两个集合才相等。

var set5: Set = [1,2]
var set6: Set = [2,3]
var set7: Set = [1,2,3]
var set8: Set = [1,2,3]

set5.isSubset(of: set7) //判断是否是某个集合的子集，set5是set7的子集，返回ture

set7.isSuperset(of: set5) //判断是否是某个集合的超集，set7是set5的超集，返回 ture

set5.isStrictSubset(of: set7) //判断是否是某个集合的真子集，set5 是set7的真子集，返回ture

set7.isStrictSuperset(of: set8) //判断是否是某个集合的真超集，set7不是set8的真超集，返回 false

//与数组类似，集合也可以通过for-in遍历的方式来获取所有集合中的数据,可以通过3种方法来进行遍历：遍历元素、遍历集合的枚举与遍历集合的下标。
//集合枚举会返回一个元组，元组中将集合下标和其对应的值一同返回：

/*
 遍历元素
 for item in set7 {
    print(item)
}
 
 
 遍历集合的枚举。集合枚举会返回一个元组，元组中将集合下标和其对应的值一同返回
 for item in set7.enumerated() {
    print(item)
 }
 
 遍历集合的下标
 for index in set7.indices {
    print(set7[index])
 }
 
 
 集合虽然不强调元素顺序，但是在遍历时，可以对其进行排序后再遍历，示例如下：
 //从大到小排序再遍历集合
 for item in set7.sorted(by: >) {
 print(item)
 }
 */
 




 //3.4.3 字典（Dictionary）类型
 
 //字典在使用时是由一个索引找到一个结果，这种数据的存储模式被称为键值映射模式，即通过一个确定的键可以找到一个确定的值。在英汉词典中，英文单词就是键，汉语释义就是值。
 
 //由于字典中的一个元素实际上是由键和值两部分组成的，因此在声明字典时，也需要明确其键和值的类型。有两种方式可以进行字典的声明和创建：

var dic1:[Int:String] //声明字典[param1:param2],这种结构用于表示字典类型，param1为键类型，param2为值类型
 
var dic2:Dictionary<Int,String> //这种方式和上述效果一样，dic2 与dic1 为相同的类型
 
 //字典创建与赋值
dic1 = [1:"1",2:"2",3:"3"]
dic2 = Dictionary(dictionaryLiteral: (1,"1"),(2,"2"),(3,"3"))
 
//在创建字典时，也可以不显式声明字典的类型，可以通过赋初值的方式来使编译器自动推动
var dic3 = ["1":"one"]

//创建空字典
var dic4:[Int:Int] = [:]
var dic5:Dictionary<Int,Int> = Dictionary()

//字典通过键来找到特定的值，在字典中值可以重复，但是键必领唯一

//字典类型也文持使用isEmpty与count来判断是否为空并获取元素个数，示例代码如下：

dic1.count //获取字典中元素个数

//判断字典是否为空
if dic4.isEmpty {
    print("字典为空")
}

//通过具体键可以获取与修改对应的值，示例如下：
dic1[2] //通过键操作值,获取值
dic1[1] = "0" //修改值
dic1[4] = "4" //添加一对新的键值

// dic1[1] = "0" 与 dic1[4] = "4" 实际上完成了相同的操作：在对某个键进行赋值时，如果这个键存在，则会进行值的更新，如果这个键不存在，则会添加一对新的键值。

//但是，很多情况下需要对一个存在的键进行更新操作，如果这个键不存在，则不添加新键值对，要实现这种效果，可以使用字典的更新键值方法：

dic1.updateValue("1", forKey: 1) //对键值进行更新
//updateValue(value:forkey:)方法用于更新一个已经存在的键值对，其中第1个参数为新值，第2个参数为要更新的键。这个方法在执行时会返回一个Optional类型的值，如果字典中此键存在，则会更新成功，并将键的旧值包装成Optional值返回，如果此键不存在，则会返回nil。在开发中，常常使用if-let结构来处理，示例如下：

//使用 if let 处理 updatevalue 的返回值
if let oldValue = dic1.updateValue("One", forKey: 1) {
    print("Old Value is \(oldValue)") // Old Value is 1
}
//其实在通过键来获取字典中的值时，也会返回一个Optional类型的值,如果键不存在，则此Optional值为nil，因此也可以使用if-let结构来保证程序的安全性，示例如下：

//通过键获取的数据也将返回 optional 类型的值，也可以使用 if let
if let value = dic2[1] {
    print("The Value is \(value)") //The Value is 1
}

//下面的方法可以实现对字典中键值对的删除操作：

//通过键删除某个键值对
dic1.removeValue(forKey: 1)
//删除所有键值对
dic1.removeAll()

//在对字典进行遍历操作时，可以遍历字典中所有键组成的集合，也可以遍历字典中所有值组成的集合，通过字典实例的keys属性与values属性分别可以获取字典的所有键与所有值，示例代码如下：
//通过键来遍历字典
for item in dic2.keys {
    print(item)
}

//通过值来遍历字典
for item in dic2.values {
    print(item)
}

//直接遍历字典
for item in dic2 {
    print(item)
}
//(key: 1, value: "1")     (key: 2, value: "2")    (key: 3, value: "3")



for (key,value) in dic2 {
    print("\(key):\(value)")
}
//1:1 2:2 3:3
//如以上代码所示，也可以直接对字典实例进行遍历，遍历中会返回一个元组类型包装字典的键和值

//在进行字典键或者值的遍历时，也支持对其进行排序遍历，实例如下：
for item in dic2.keys.sorted(by: >) {
    print(dic2[item]!)
}



//章节练习
/*
 1.分别创建字符串变量China和MyLove，将这两个变量拼接成为一句话并且对拼接后的新字符串变量进行遍历，并检查其中是否有L字符，有则进行打印操作。
 */
var str1 = "China"
var str2 = String("MyLove")
var str3 = str1 + str2
for chara in str3 {
    if chara == "L" {
        print(chara)
    }
}

/*
 2.删除下面字符串中的所有“!”和“?”符号
 swsvr!vrfe?123321!!你好!世界？
 */
var stringOri2 =  "swsvr!vrfe?123321!!你好?世界!"
//创建一个空字符串用于进行接收
var stringRes2 = String()
for index in stringOri2.indices {
    if stringOri2[index] != "?" && stringOri2[index] != "!" {
        stringRes2.append(stringOri2[index])
    }
}
print(stringRes2)

/*
 3.将字符串abcdefg进行倒序排列
 */
var stringOri3 = "abcdefg"
var index3 = stringOri3.endIndex
var stringRes3 = String()
while index3>stringOri3.startIndex {
    index3 = stringOri3.index(before: index3)
    stringRes3.append(stringOri3[index3])
}
print(stringRes3)
/*
 
 
 4.将”*“符号逐个插入下面字符串的字符中间
 我爱你中国
 */
var stringOri4 = "我爱你中国"
var stringRes4 = String()
for index in stringOri4.indices {
    stringRes4.append(stringOri4[index])
    if index<stringOri4.index(before: stringOri4.endIndex) {
        stringRes4.append(Character("*"))
    }
}
print(stringRes4) // 我*爱*你*中*国

/*
 5.将下面字符串中所有的abc替换成Hello
 abc中国abc美国abc英国~德国abc法国abc
 */
var stringOri5 = "abc中国abc美国abc英国~德国abc法国abc"
var range5 = stringOri5.range(of:"abc")
while range5 != nil {
    stringOri5.replaceSubrange(range5!, with: "Hello")
    range5 = stringOri5.range(of:"abc")
}
print(stringOri5)

/*
 6.进行正负号翻转 
 将 -123 转换为+123
 将 +456 转换为-456
 */
var stringOri6 = "-123"
var stringOri_6 = "+456"

if stringOri6.hasPrefix("-"){
    stringOri6.replaceSubrange(stringOri6.startIndex..<stringOri6.index(after: startIndex), with: "+")
}

if stringOri_6.hasPrefix("+"){
    stringOri_6.replaceSubrange(stringOri_6.startIndex..<stringOri_6.index(after: startIndex), with: "-")
}
print(stringOri6,stringOri_6)

/*
 7.将下列数组中的0去掉，返回新的数组，并打印输出。
 [1,13,45,5,0,0,16,6,0,25,4,17,6,7,0,15]
 */
var arrayOri1 = [1,13,45,5,0,0,16,6,0,25,4,17,6,7,0,15]
var arrayRes1 = Array<Int>()
for index in arrayOri1.indices {
    if arrayOri1[index] == 0 {
        continue //The continue statement is used to skip the current iteration of the loop and the control flow of the program goes to the next iteration
        //Continue 语句用于跳过循环的当前迭代，程序的控制流进入下一次迭代。
    }
    arrayRes1.append(arrayOri1[index])
}
print(arrayRes1)

/*
 8.定义一个包合10个元素的数组，对其进行赋值，使每个元素的值等于其下标，然后输出，最后将数组倒置后输出。
 */

var arrayOri2 = Array<Int>()
for index in 0...9{
    arrayOri2.append(index)
}
print(arrayOri2)

//进行倒置排序
arrayOri2.sort(by:
                { (a,b) -> Bool in
    return a > b
}
)
print(arrayOri2)

/*
 9.工程测量到两组数据，分别为2、4 3 5与3、4、7、1。对两组数据进行整合，使其合成一组数据，重复的数据只算一次，使用代码描述此过程。
 */
var setOri3:Set<Int> = [2,4,3,5]
var setOri32:Set<Int> = [3,4,7,1]
var setRes3 = setOri3.union(setOri32)

/*
 10.期末考试中，王晓成绩为98，邹明成绩为86，李小伟成绩为93，用字典结构来对三人的成绩进行存储，并以从高到低的排序输出。题在解析时使用到了排序闭包
 */
var dicOri4 = ["王晓":98,"邹明":86,"李小伟":93]
for item in dicOri4.sorted(by: { (student1, student2) -> Bool in
    return student1.value > student2.value
}){
    print(item)
}


/*
 一  简述Array、Set和Dictionary的异同点，并说明各自的应用场景
 
1.首先Array、Set和Dictionary 都是Swift的集合类型，所谓集合类型，是指一组数据集合,Swift是一种强类型语言，集合中的数据类型必须保持一致。

 2.Array有序，set无序。由于Array的有序性，因此在存储时，Array中的每一个元素都会被分配一个下标，我们可以通过下标来获取具体位置的数据，因此Atray的存储灵活性和查询速度相比set会略差。
 
 如果在开发中，我们需要的仅仅是一个数据池，并不特别在意数据的顺序，可以选择set类型，否则可以选择array类型。
 
 3.Array和Dictionary最大的区别在于Array是通过递增的整数索引来关联元素的，而Dictionary则是使用任意数据类型作为索引来关联元素的。Dictionary要 比Array更加灵活，同样其对 “顺序”的描述能力没有Array强。
 
 二 开发中的字符串解析是指什么，有什么用？
 
 1.字符串解析是指使用相关函数对字符串进行处理，比如截取、拼接、替换、部分删除、分解等。在swift中提供了丰富的原生函数来对字符串进行处理。
 
 2.字符串解析在实际开发过程中应用非常广，比如音乐类软件对歌词(LRC）文件的解析，实际上就是使用字符串解析技术来从LRC歌词文件中解析出歌曲名称、歌手名、时间等信息。字符
 串解析技术也常常可以用来进行文本的格式整理，比如去掉多余的空格和换行符等。
 
 3.关于字符串解析，重中之重是JSON数据处理，在移动端，几乎所有和网络相关的数据交换都是采用JSON数据格式，JSON解析就是一种基础的字符串解析技术。

*/
