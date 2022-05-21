import UIKit

//多种进制进行数据的定义与计算
var type_10 = 17//十进制的17
var type_2 = 0b10001//二进制的17
var type_8 = 0o21//八进制的17
var type_16 = 0x11//十六进制的17

/*计算机内存中最小的数据运算单元是一个二进制（bit），只有0和1两个状态
 1B = 8bit
 1KB = 2^10B
 1MB = 2^10KB
 字节（B）是最小的数据单元，1字节由8个二进制运算位组成
 1字节最大可以表示的数为二进制11111111，即十进制256个字符
 */



//2.3.2 整型数据
/*有符号整型数据与无符号整型数据。即 分正负号 与 不分正负号
 
 对于无符号整型，swift中提供了5种类型4种存储空间的数据类型，4种存储空间分别占用内存8位、16位、32位、64位
 */


//8位无符号整型数的最大值 255
var a1 = UInt8.max
//16位无符号整型数的最大值 65535
var a2 = UInt16.max
//32位无符号整型数的最大值 4294967295
var a3 = UInt32.max
//64位无符号整型数的最大值 18446744073709551615
var a4 = UInt64.max
//整型数据类型是采用结构体的方式实现的，其中max属性可以获取当前类型的最大值

//MemoryLayout是swift标准库中定义的一个枚举，用于获取内存相关信息。MemoryLayout<UInt>则是一种泛型用法，调用size属性可以获取某种数据类型所占内存空间的字节数。
//获取数据类型所占位数 在64位机器上UInt占8字节64位
var a5 = MemoryLayout<UInt>.size


//有符号整型数据与无符号整型数据十分类似，只是首位二进制为符号位，不纳入数值计算。min属性用于获取整型数据的最小值
var maxInt8 = Int8.max     //127
var mimInt8 = Int8.min    //-128
var maxInt16 = Int16.max  //32767
var minInt16 = Int16.min  //-32768
var maxInt32 = Int32.max  //2147483647
var minInt32 = Int32.min  //-2147483648
var maxInt64 = Int64.max  //9223372036854775807
var minInt64 = Int64.min  //-9223372036854775808
var intSize = MemoryLayout<Int>.size //8位
/*如果我们明确当前场景不会出现负数，可以使用UInt类型，如果不能保证，最好使用Int类型，即我们存储的数据是非负的。
 对数值统一使用Int类型有助于数据间的传递和转换*/

//2.3.3 浮点型数据
//浮点型数据分为 单精度浮点型Float 与 双精度浮点型Double。Double类型比Float类型有着更高的精度，除了某些特殊场景外，我们更推荐使用Double类型来定义浮点数
var b = MemoryLayout<Float>.size    //4个字节
var b1 = MemoryLayout<Float32>.size //4个字节
var b2 = MemoryLayout<Float64>.size //8个字节
var c = MemoryLayout<Double>.size  //8个字节

//在十进制中，用e来表示10的n次方，在十六进制中，用P来表示2的n次方
var sum = 1.25e3 //1.25*(10^3) = 1250
var sun2 = 0x1p3 //1*(2^3) = 8


//都可以在数字前加任意个0来进行位数填充，也可以在数字中加入下划线进行分隔，不会影响原始数值
var num1 = 001.23 //1.23
var num2 = 1_000 //1000
var num3 = 1_000.1_001 //1000.1001

//2.3.4布尔型数据
var bool1 = true    //创建布尔真变量
var bool2 = false   //创建布尔假变量


//2.4 元组类型和可选值类型
/*元组可以创建出任意数据类型组合的自定义数据类型。可选值类型让swift对数值为空进行了严格的把控*/

//创建钢笔元组类型 其中有两种类型组成 字符串类型的名称 和整数类型的价钱
var pen:(name:String,price:Int) = ("钢笔",2)
//在创建元组类型的同时指定了其中参数的名称，即名称参数为name，价格参数为price，可以使用参数名称来获取元组中参数的值


//获取pen变量名称
var name = pen.name
//获取pen变量价格
var price = pen.price
//不指定参数名称的元组，元组会自动为每个参数分配下标，下标值将从0开始依次递减
var car:(String,Int) = ("奔驰",2000000)//不指定参数名称的元组
//通过下标来去元组中各个组成元素的值
var carName = car.0
var carPricr = car.1


/*
 元组实例被创建后，可以通过指定的变量或常量来进行元组的分解
 var car:(String,Int) = ("奔驰",2000000) //不指定参数名称的元组
 var (theName,thePrice) = car //进行元组分解，theName变量赋值为“奔驰”，thePrice变量被赋值为2000000
 print(theName,thePrice)
 */

//有时候并不需要获取某个元组实例中所有元素的值，这种情况下，开发者也可以将某些不需要获取的元素使用匿名的方式来接收
//不指定参数名称的元组 var car:(String, Int) = ("奔驰"，2000000)
//进行元组的分解，将Int型参数进行匿名
var (theName,_) = car
//此时 theName变量被赋值为"奔驰" thePrice变量被赋值为2000000
print(theName)
//使用_来表示匿名的概念，匿名标识符。上面的代码只分解出元组car中的第一个元素（String类型）
//元组只适合简单数据的组合，对于结构复杂的数据，要用结构体/类来实现



//2.4.2可选值类型

// ？ 可以出现在类型后面，也可以出现在实例后面。 类型？ 此类型对应的Options类型。 实例？代表可选链的调用
// 类型！ 隐式解析的语法结构 实例！ 对Optional类型实例的拆包

//在用！进行optional值拆包时，必要保证要拆包的值不为nil，否则程序运行会出错，在拆包前使用if语句进行安全判断
//声明obj为String?类型
var obj:String? = "HS"
if obj != nil {
    obj!
}

var obj0:String
obj0 = "HS"
print(obj0)

//进行if-let绑定
if let tmp = obj {
    print(tmp)
}else{
    obj = "HS"
    print(obj!)
}
//如果obj有值，则if-else结构将创建一个临时常量tmp来接收obj拆包后的值，并且执行if为真时所对应的代码块。在执行的代码块中,可以直接使用拆包后的obj值tmp。如果obj为nil，则会进入if为假的代码块中，可以在else代码块中将obj重新赋值使用。这种if-let结构体实际上完成了判断、拆包、绑定拆包后的值到临时常量3个过程。


/*if-let也可以同时进行多个Optional值绑定，之间用 ，隔开
var obj1:Int? = 1
var obj2:Int? = 2
if let tmp1 = obj1,let tmp2 = obj2 {
    print(tmp1,tmp2)
 }
*/


//在同时进行多个optional类型值的绑定时，只有所有optional值都不为nil，绑定才会成功，代码执行才会进入if为真的代码块中。如果开发者需要在if语句的判断中添加更多业务逻辑，可以通过追加子句的方式来实现，如下
var obj1:Int? = 1
var obj2:Int? = 2
if let tmp1 = obj1,let tmp2 = obj2, tmp1<tmp2 {
    print(tmp1,tmp2)//在obj1不为nil、obj2不为nil并且obj所对应的拆包值小于obj2对应的拆包值时，才会进入if为真的代码块中
}


//对于一个可选值类型的变量，每次使用时我们都要为其进行拆包操作。其实还有一种语法： 隐式解析：适用于这样的场景 当我们明确某个变量初始时为nil，并且在之后使用之前一定会被赋值时，我们可以将其声明为隐式解析的可选值，再对这个变量进行使用，就不需要进行拆包操作了。例如下面代码会产生运行错误
//var obj4:Int?
//obj4 = 3
//print(obj4 + 1)  //会编译异常，因为obj4没有进行拆包

//修改为如下 可运行
// 声明Obj4为隐式解析的变量
var obj4:Int!
obj4 = 3
// 在使用时，无需再进行拆包操作，Swift会自动帮我们做拆包
print(obj4 + 1)

//用typealias关键字为类型取别名。为Int类型取一个别名Price
typealias Price = Int
//使用Price代替Int 效果完全一样
var penPrice:Price = 100
//章节练习
/*
 1.分别创建用二进制、八进制、十进制与十六进制表示的变量25。
 */
var count1 = 25         //十进制
var count2 = 0o31       //八进制
var count3 = 0x19       //十六进制
var count4 = 0b00011001 //二进制
/*
 2.小文到文具店买文具，其需要购买铅笔、橡皮和文具盒三种文具，3种文具的标价分别为2元、1元、15元，使用元组来模拟这3种文具组成的套装。
 */
var bundle:(pencil:Int,eraser:Int,pencilCase:Int) = (2,1,15)
/*
 3.编写一个样品检测器，当样品的质量大于30单位的时候，输出合格，输入样品可能为空，使用if-let语句来实现。
 */
var product:Int? = 100
if let weight = product, weight > 30  {
    print("产品合格")
}

/* “！”出现在类型后表示默认隐式解析，出现在实例后表示强制拆包。
 
 “？”出现在类型后表示Optional类型，出现在实例后表示可选链调用。
 
 Optional类型是Swif语言强调安全性的一种方式，某个变量可不可以为空应该是逻辑上决定的，而不是不可预知、不可控的。
 
 八进制和十六进制实际上是二进制的聚合方式，在八进制中，每位数字可以表示二进制中的3位，在十六进制中，每位数字可以表示二进制的4位，大大缩短了二进制数的长度，并且便于阅
 读。常常使用十六进制来表示颜色数据。
 
 swift的数据类型有基本数据类型和引用数据类型，基本数据类型中又包含整型、浮点型、布尔型、元组
*/
