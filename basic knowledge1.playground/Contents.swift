import UIKit
import CoreGraphics

let label = "The width is"
let width = 94
let widthLabel = label + String(width)
//第一种：把一个值转换成其他类型，显式转换。explicitly make an instance of the desired type.

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
// 第二种方法：更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠（\）




let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
//使用三个双引号（"""）来包含多行字符串内容。每行行首的缩进会被去除，直到和结尾引号的缩进相匹配。





var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
shoppingList.append("blue paint")
//数组增加元素
print(shoppingList)
print(occupations)


let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print (informalGreeting)
//处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。




func sum(v1:Int , v2 :Int) -> Int {
    v1 + v2
}
func difference(v1: Int , v2 :Int) ->Int {
    v1 - v2
}
func printResult(_ mathFn: (Int,Int) -> Int,_ a:Int ,_ b:Int){
    print("Result: \(mathFn(a,b))")
}
printResult(sum, 5 ,2)
printResult(difference, 5 , 2)
//函数类型作为函数参数


var optionalString: String? = "Hello"
print(optionalString == nil)
//var girlFriend:String? = "Wendy"
//girlFriend = "可爱的" + girlFriend!
// ! force-unwrap

//var  girlFriend:String? = "Wendy"
//if girlFriend != nil {
//    girlFriend = "可爱的" + girlFriend!
//}
//想预防因为从无值的optional变数(常数)强迫取值造成的闪退，其实很简单。只要在取值前先用if判断它是否不等于nil。若是不等于nil，即表示目前有值，才可放心地取值。
//
///invites.html
//var  girlFriend:String?
//if let girlFriendName = girlFriend {
//    girlFriend = "fvdv" + girlFriendName
//}else{
//    var message = "fsdsdfsfsdfsgebfnh"



var bookCollection = ["tool", "fdf", "fdsd"]
bookCollection[0]
bookCollection.append("AUyhot")
bookCollection.count

for index in 0...3 {
    print(bookCollection[index])
}

for index in 0...bookCollection.count - 1 {
    print(bookCollection[index])
}

for book in bookCollection {
    print(book)
}

var bookCollectDict = ["2232334": "fsdf", "233423":"ghff",  "67888999324":"fsdfsd" ]
bookCollectDict["2232334"]

for (key, value) in bookCollectDict {
    print("ISBN: \(key)")
    print("Title: \(value)")
}





var emojiDict: [String:String] = ["👻": "Ghost",
                                  "💩": "Poop",
                                  "😤": "Angry",
                                  "👾": "Alien monster"
                                  
]

var wordToLookup = "👻"
var meaning = emojiDict[wordToLookup]
if let meaning = meaning {
    print(meaning)
}


let containView = UIView(frame: CGRect(x:0, y: 0, width: 300,height:300))
containView.backgroundColor = UIColor.orange
let emojiLabel = UILabel(frame: CGRect(x: 95, y: 20, width: 150, height: 150))
emojiLabel.text = wordToLookup
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)

containView.addSubview(emojiLabel)


let meaningLabel = UILabel(frame: CGRect(x: 110, y: 100, width: 150, height: 150))
meaningLabel.text = meaning
meaningLabel.font = UIFont.systemFont(ofSize: 30.0)
meaningLabel.textColor = UIColor.white

containView.addSubview(meaningLabel)

//使用系统关键字当名称
let `let` = 123
var `var` = 123
`var` = 456


//定义多个值
var x = 0, y = 0 , z = 0
var red, green, blue: Double

//字串中包含值 用反斜线\()加入到字符串中
//let apples = 3
//let banana = 5
//let appleSummary = " 我有 \(apples) 個蘋果 "
//let fruitSummary = " 我有 \(apples + banana) 個水果 "
//print(appleSummary) // 我有 3 個蘋果
//print(fruitSummary) // 我有 8 個水果

//将字串转换成大写
//let hello = "Hello, World!"
//let newHello = hello.uppercased()

//将字符串转换成小写 hello.lowercased()
//hello.count字符串长度

//多行文字
let hello = """
Hello,
  World!!
    你好，
      世界 !!
"""

//将字符串转换成数字，转换失败
let stringValue = "我不是数字"
let intValue = Int(stringValue) //intValue的值为nil，也就是没有任何值

//将字串转换成数字，转换成功并且解包。很确定该值一定能成功转换成整数，可以在最后面加 ！，进行解包（Unwrapped）,让它从可选类型（optional）变成一般类型
//let stringValue = "1"
//let intValue = Int(stringValue)!

//类型别名 Type aliases 就是给已经存在的数据类型定义另一个名称，使用关键字typealias来定义类型别名，有时比起原本的数据类型，使用自定义的类型别名可以让代码更好懂

//定义一个类型别名，数据类型为Int
typealias Age = Int
//使用类型别名来取代原本资料的类型名称
var age: Age = 10


//元组 tuples 命名
//let http404Error = (statusCode: 404, statusMessage: "NotFound")
//print(http404Error.statusCode) //404
//print(http404Error.statusMessage) //NotFound


//取出元组内容 将元祖分解成单独的常数或变数
//let http404Error = (statusCode: 404, statusMessage: "NotFound")
//let (statusCode, statusMessage) = http404Error
//print(statusCode)      //404
//print(statusMessage)   //NotFound


//忽略某个元组内的值
let http404Error = (statusCode: 404, statusMessage: "NotFound")
let (statusCode, _) = http404Error
print(statusCode) //404

//整数随机数  在random(in:)函数中输入指定范围
let randomIntValue = Int.random(in: 1...6)
print(randomIntValue)

//浮点随机数
let randomDoubleValue = Double.random(in: 1.0...6.0)
print(randomDoubleValue)

//let firstName = "Johh"
//let lastName = "Smith" 等于元组
 let person = (firstName: "John", lastName: "Smith")
print(person.firstName)
print(person.lastName)

//取余运算的符号是由第一操作数来决定的
print(5%2) //1
print(-5%2) //-1
print(5%(-2)) //1
print(-5%(-2))//-1







//属性协议
protocol Name { //声明一个名为Name的协议，其中定义了一个字符串变量name，并以get表示获得属性，set表示设置属性。
    var name:String{get set}
}
struct Person:Name{ //其次，声明了一个名为Person的Name协议类型的结构体，其成员为字符串型变量name。
    var name: String
}
var someone = Person(name: "张三")//接着声明了一个结构体变量someone，并通过get获得成员值“张三”，用print输出
print(someone.name) //张三
someone.name = "李四" //成员值“李四”直接通过结构体变量someone访问结构体成员name而获得，并通过print输出
print(someone.name) //李四





//----------方法协议----------//
protocol Area{ //
    func getArea()->Double
}

struct Circle:Area{
    var rad = 0.0
    init(rad:Double)
    {
        self.rad = rad
    }
    func getArea() -> Double {
        return rad*rad*3.14159
    }
}

let circleObject = Circle(rad:10.0)
print("圆面积：\(circleObject.getArea())")
//首先用protocol声明了一个名为Area的getArea（）方法的协议，此方法无参数，返回值类型为Double。接着声明了一个方法协议类型名为Circle的结构体。结构体成员为变量rad，其初始值为0.另一个成员是名为init的方法，其参数为rad，其功能是接受被调用传来的参数值。第三个成员是被protocol声明过的一个名为Area的getArea（）方法的协议。其方法体是返回圆的面积值rad*rad*3.14159

//最后定义了一个名为circleObject的结构体变量，其获得成员rad值为10.0 。 用circleObject.getArea()调用getArea（）方法，返回圆面积值314.159，由print输出

//-------类的封装 继承和多态-----------//
/*
 类则是一个抽象的概念，用来描述某一类对象所共有的、本质的属性和类的操作与行为。对象则是类的一个具体实现，又称为实例。以杯子为例，它是描达这类对象共有
 的、本质的属性和操作、行为的抽象体，而大杯子和小杯子则是杯子类的某个实例，或者说是杯子类的具体对象
 
 类是具有共同特征的对象的抽象，例如，教师一类人;学生一类人。教师和学生同属于人类，
 他们是人类的两个属性和行为各不相同的对象（也可称实例）。
 
 类（class）就是“设计图”。例如，在启动任何一个桌面应用程序后，都会显示其图形用户界面的窗口，这个窗口就是根据“窗口类”这
 个设计图创建的。另外，窗口上一定会有按钮，按钮也是根据“按钮类”的设计图生成的。
 
 为了在程序中生成窗口、按钮这些东西，首先需要创建窗口以及按钮的设计图，称
 之为类。“东西”就是所谓的对象 object
 
 对象是类的实例
 
 类就是对象的模型，而对象就是类的一个实例。类是一种逻辑结构，而对象是真正
 类具有抽象性、隐蔽性和封装性的特征。
 
 类的隐蔽性体现在外界不能直按访问私有成员。
 
 封装性使对象的数据得到了保护，所以说封装性是面向对象程序设计的重要特征。
 类是一个封装体，在其中封装了该对象的属性和操作。通过限制对属性和操作的访问权
 限，可以将属性 “隐藏”在类的内部，公有函数作为对外的接口，在对象之外只能通过这一接口对对象进行具体的操作。
 
 面向对象的程序设计就是通过建立数据类型——类 来支持封装和数据隐藏。封装性增加了对象的独立性，从而保证了数据的可靠性。一个定义完好的类可以作为独立模块使用。
 
 对象的属性和行为总是紧密联系在一起的，属性用数据（即变量）来描述，行为则是数据的处理，要通过函数来实现。
 在面向过程程序设计中，数据和对数据的处理，是分离的，而在面向对象的程序设计中两者是合一的，都封装在类体中。
 
 封装性就是指将数据 （变量）和数据处理（函数）都封装在类体内。我们可以理解为是把变量和相关的函数集中在一个有孔的容器中，只有在孔的边缘处的数据与函数才能与外界相通（这便是指所有的公有的成员） ，而其余的私有性成员（指包括私有和保护成员）均不受外界的影响，这个容器就是类。
 
 每个对象都具有状态（即数据）和行为（即对数据的操作）
 
 根据类生成的被称为 实例instance 将类实例化后
 
 在类中使用称方法，在类外使用称函数

 
子类可以继承父类（超类）的所有功能，并可以对这些功能进行扩展。 子类与父类相比只是增加或者修改了部分属性和操作。
 
继承的过程是从一般到特殊的过程，通过使用继承一个对象只需要定义它所属类的属性即可，因为它可以从父类那继承所有的通过属性。

 子类继承父类的语法格式如下：
 
 修饰符 class SubClass：SuperClass
 {
      //类的定义部分
 }
 */
 
 


//-----------初始化--------//
 
 /*初姶化 initialization 用于完成实例的构造过程，是设置类、结构以及枚举成员值为实例中的每个存储属性设置初始值和执行必要的准备任务的过程。
 
 当创建一个类或对象时，将会调用构造器 (initializer），用来初始化变量的值。Swift构造器是以 init 为关键字来表示的，构造器又称构造方法，此方法可带参数，也可不带参数，视情况而定。
 */

//构造器初始化示例

class Score
{
    var yourScore:Double
    init()
    {
        yourScore = 60
    }
}

let scoreObj = Score()
print("Yours score is:\(scoreObj.yourScore)")//Yours score is: 60.0

//上述程序中，当创建 scoreObj 时，将自动调用 init() 函数将 yourScore 初始化设置为60，当然，也可以不使用 inito 函数，而是使用默认属性值，直接在定义变量时就加入处值。实例如下：

/*
 class Score
 {
   varyyouScore = 60
 }
 let scoreObj = Score()
 print("Yours score is\(scoreObj.yourScore)") //Yours score is: 60.0
 
 */

//构造器带参数示例

//初始化本地和外部参数
class Kilometer
{
    var kilo:Double
    init(fromMile mile:Double) //程序中有外部参数名称是fromMile,使用外部参数名称能提高可读性。但这不是必须做的，因为 Swift 将构造器的每个参数都默认为外部参数名称。此处为了更易于了解所处理的事项，有意加上额外的外部参数名称。注意，当建立对象并加以初始化时，若没有写上外部参数名称将会产生错误信息。例如，将var runner = Kilometer(fromMile:96) 写成  var runner = Kilometer(96)就会产生错误信息。
    {
        kilo = mile*1.6
    }
}
var runner = Kilometer(fromMile: 96)
print("You run\(runner.kilo) kilometer") //You run 153.6 kilometer


//self 关键字总是指向方法的调用者。在实例方法中，self代表调用该方法的类型本身。根据 self 出现位置的不同，self代表谁也略有区别：方法中的 self 代表该方法的调用者；构造器中的 self 代表构造器正在初始化的实例。self 关键字的主要作用是一个方法访问同一个类的另一个方法或属性。
class Resolution
{
    var width = 0, height = 0
    init(width:Int,height:Int) //在init（）函数主体中self表示对象，由于 init（）函数内的参数与对象本身的属性变量使用了相同的名称，所以加上self是很重要的，因为只有这样才有办法区分它是属于对象本身的，还是属于参数的。
    {
        self.width = width
        self.height = height
    }
}

let monitor = Resolution(width: 1024, height: 768) // width 与 height 都被视为外部参数名称，所以建立 monitor 对象时要将外部参数名称标识出来，否则将会得到错误的信息。
print("My monitor resolutions: \(monitor.width)*\(monitor.height)") // My monitor resolutions: 1024*768

//当属性是选项类型时，此时的默认值是nil。这是一个很重要的概念，凡是要赋值nil给变量时，此变量的先决条件必须是选项的类型。


//------------类的继承与初始化--------//
//继承是类所独有的，因此在初始化时动作较为复杂。


//---------1.指定构造器与便捷构造器的创建---------//
/*指定构造器是类的主要构造器，每一个类至少有一个指定构造器，用来指定类中有关的属性值。指定构造器用如下方式创建：

init(parameters)
{
   statements
}

//便捷构造器是类中第二种或者称辅助型构造器，可以借助调用指定构造器来设置默认值。便捷构造器用如下方式创建：也就是在指定构造器的前面加上 convenience 关键字。
convenience init(parameters)
{
    statements
}
*/


//-------2.指定构造器与便捷构造器的创建的调用-----//

/*
 指定构造器必须直接调用其父类的指定构造器
 
 便捷构造器必须在同一类中调用另一构造器
 
 便捷构造器必须调用指定构造器来结束
 
 指定构造器是向上调用的，而便捷构造器是平行调用的，在便捷构造器中会调用指定构造器，而在指定构造器中会调用父类的指定构造器。
 */

//便捷构造器中调用指定构造器实例

//指定构造器和便捷构造器
/*
class Fruits
{
    var fruitName:String
    init(fruitName:String) //指定构造器
    {
        print("call designated initialize")
        self.fruitName = fruitName
    }
    convenience init() //便捷构造器
    {
        print("call convenience initializer")
        self.init(fruitName:"Apple")
    }
}

let yoursFruits = Fruits() //创建 yoursFruits 时，let yoursFruits= Fruits（）将会调用便捷构造器。
print(yoursFruits.fruitName)

let myFruits = Fruits(fruitName: "Mango") //当创建 myFruits 常量名时,let myFruits = Fruits(fruitName:"Mango") 会调用指定构造器。
print(myFruits.fruitName)
*/


/*
 程序运行结果如下：
 call convenience initializer
 call designated initializer
 Apple
 call designated initializer
 Mango
*/



//------析构------//
/*
 析构（deinitializaion）是在类实例中释放之前所执行的动作，在实例销毁之前释放它所占有的物理资源。
 
 在类实例释放前将会调用析构器 （deinitializer）。析构器只用于类，一般用 deinit告知这是析构器。析构器不加任何参数，所以没有小括号。其创建方式如下：
 
 deinit
 {
    statements
 }
 在父类和子类中，有关析构器的步骤是：子类先析构处理，父类再析构处理。

 */

//析构器处理步骤示例
class Fruits
{
    var fruitName:String
    init(fruitName:String)
    {
        self.fruitName = fruitName
    }
    func display()
    {
        print("I buy some\(fruitName)s")
    }
    deinit
    {
        print("Execute deinitializer")
    }
}

var oneObject2:Fruits? = Fruits(fruitName: "Kiwi") //定义 oneObject2 是 Fruits? 的类型，这样可以赋值 nil 给 oneObjec2，否则无法运行。当程序执行到最后一行时，将执行析构器，然后才将此变量释放。
oneObject2!.display() //I buy someKiwis
oneObject2 = nil //Execute deinitializer


//-------重写------//
/*子类可以为继承的实例方法、类方法、实例属性或由附属脚本自己提供的实现，我们把这种行为称为重写。重写某个特性时，需要在重写定义的前面加上 override 关键字。任何缺少override关键字的重写都会在编译时提醒swift编译器去检查该类的父类是否有匹配重写版本的声明。这个检查可以确保重写的定义是正确的。

可以通过使用 super 前缀来访问父类版本的方法、属性或附属脚本：
 
 方法：super.someMethod（）
 属性：super.someProperty
 附属脚本：super[someIndex]
 
*/

//------重写方法-----//
/*在子类中，可以重写继承的实例方法或类方法，提供一个定制或替代的实现方法。
class overrideClass:Base
{
    override func getBaseName() -> String
    {
        return "New Base Class"
    }
}
 
 上述程序定义了基类 Base 的一个名称为 overrideClass 的子类，它重写了从 Base 类继承来的 getBaseName() 方法。
 
*/

//------重写属性--------//

/*
 可以提供定制的getter（或setter）来重写任意继承来的实例属性或者类属性，无论继承来的属性是存储型还是计算型的。子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有
 一个名字和类型。所以重写一个属性时，必须将它的名字和类型都写出来，这样才能使编译器检查重写的属性是否与父类中同名同类型的属性相匹配。
 
 可以将一个继承来的只读属性重写一个读写属性，只要在重写的属性中提供getter（读）和setter（写）即可。但是，不可以将一个继承来的读写属性重写为一个只读属性。
 */





//-----swift内存管理------//
/*swift提供了强大的内存管理机制：swift通过自动引用计数（Automatic Reference Counting，ARC）可以很好地管理对象的回收。大部分情况下，程序员无须关心 swift对象的回收，但在某些特殊情识下，Swift 要求程序员进行一些对内存管理的处理。
 
 ARC是一种非常优秀的内存管理技术，它的思路非常简单：当程序在内存中创建-个对象之后，ARC 将会自动完成两件事情。
 
 第一件事情：ARC 自动统计该对象被多少个引用变量所引用，这个值就被称为引用计数。简言之，ARC 相当于为每个对象额外增加一个 Int 类型的属性，该属性总能正确地记录有多少个引用变量引用了该对象。
 
 第二件事：每当一个对象的引用计数变为0时，ARC 会自动回收该对象。
 使用 ARC 之后，程序甚至不允许直接访问对象的引用计数，但依然可以通过示例来推测一个对象的引用计数的值。
 
 总之，ARC 的原理就是类对象的指针被引用时计数增加，被释放时计数减少，若为0则自动释放。
 
 类对象的内存一旦被释放，该对象就不能再被使用，否则程序会崩溃或者会发生对象错误。
 
 引用计数仅仅作用于实例上。结构和枚举是值类型而非引用类型，所以不能被引用存储和传递。
 
 Swift 使用 ARC 来管理应用程序的内存使用，这表明内存管理己经是 Swift 的重要部分。在大多数情况下，并不需要考虑内存的管理。当实例不再需要时，ARC 会自动不需要考虑内存的管理。当实例不再需要时，ARC 会自动
 释放这些实例所使用的内存。
 
 
 
 自动引用计数的工作机制
 
 每当创建一个类的实例时，ARC 会分配一个内存块来存储这个实例的信息，包括类型信息和实例的属性值信息。当实例不再被使用时，ARC 才会释放这些实例所占用
 的内存。为了保证需要实例时实例还是存在的，ARC 对每个类的实例都会追踪有多少属性、常量、变量指向这些实例。当有活动引用指向实例时，ARC 是不会释放这个实例的。
 为了能实现这一点，将实例赋值给属性、常量和变量时，指向实例的一个强引用将会被构造出来。
 之所以被称为强引用是因为它稳定地持有这个实例，当这个强引用存在时，实例就不能够被释放。有强就有弱，被weak修饰的变量对赋值的类对象有弱引用。
*/

//------类实例之问的循环强引用及解決方法-----//
//虽然 ARC 减少了很多内存管理工作，但是 ARC 并不是绝对安全的。如果两个类实例都有一个强引用指向对方，构成强引用循环，将会导致内存泄漏。
//徧环强引用解決方法示例。
/*class Teacher
{
    var tName:String
    var student:Student? //添加学生对象，初始化时为 nil
    
    init(name:String)
    {
        tName = name
        print("教师\(tName)实例初始化完成.")
    }
    func getName()->String
    {
        return tName
    }
    
    deinit
    {
        print("教师\(tName)实例反初始化完成")
    }
}

class Student
{
    var sName:String
    var teacher:Teacher? //添加教师对象，初始化时为 ni1
    
    init(name:String)
    {
        sName = name
        print("学生\(sName)实例初始化完成")
    }
    
    func getName()->String
    {
        return sName
    }
    
    deinit
    {
        print("学生\(sName)实例反初始化完成")
    }
    
}

var teacher:Teacher?
var student:Student?

teacher = Teacher(name: "刘老师") //创建实例老师，并初始化，name 引用计数是1
student = Student(name: "李明同学") //创建实例学生，并初始化，name 引用计数是1
print("类实例之问的循环强引用一-内存泄漏测试结束")
结果
 教师 刘老师 实例初始化完成
 学生 李明同学 实例初始化完成
 类实例之间的循环强引用 一一 内存泄漏测试结束
 */


/*上面定义了一个 Teacher 类和一个 Student类，两个类之间相互包含对方的类型属性，这是一个很明显的类实例之间的循环强引用。下面分别初始化这两个类，得到实例之后，再设置 nil。
var teacher:Teacher?
var student:Student?
teacher = Teacher(name:"刘老师")  //创建实例老师，并初始化，name引用时数是1
student = Student（name：“李明同学”） //创建实例学生，并初始化,name引用计数是1
 
teacher!.student = student //教师实例中的学生对象引用计数+1
student!.teacher = teacher //学生实例中的教师对象引用计数+1
 
 print("类实例之间的循环强引用--内存泄露测试结束")
 
 结果
 教师 刘老师 实例初始化完成
 学生 李明同学 实例初始化完成
 类实例之间的循环强引用 -- 内存泄漏测试结束
 
 从中可以看出，两者都执行了初始化函数，虽然写了teacher=nil、student=nil，但是自始至终都没有调用deinit。因此内存会泄露，此时不能采用任何措施来释放这两个对象了，只有等App生命周期结束。
*/

/*
 swift提供了两种方法解决实例属性间的强引用循环：弱引用和无主引用。弱引用和无主引用使得一个引用循环中的实例并不需要强引用就可以指向循环中的其他实例，互相引用的实例就不会形成一个强引用循环。当引用可能变为nil时使用弱引用。相反，当引用在初始化期间被设置后不再为nil时使用无主引用。
 */

//--------弱引用-------//
/*弱引用不保持对所指对象的持有，因此不阻止 ARC 对引用实例的回收。这个特性保证了引用不成为强引用循环。声明引用为弱引用只需要在属性或变量前面加上关键字weak。弱引用不能被声明为常量，必须声明为变量，指明它们的值在运行期间可以改变。

 实际上只需要将上例 Teacher 类中的 var teacher.Teacher? 修改成 weak var teacher: Teacher?或者将 Student 类中的var student:Student？修改成weak var student:Student?即可解决类实例属性间的强引用循环。
 运行程序，当两个变量分别被设置为nil时，将会调用各自的反初始化函数，输出提示信息。
 
*/

//弱引用示例
/*
class Teacher
{
    var tName:String
    var student:Student? //添加学生对象，初始化时为nil
    
    init(name:String)
    {
        tName = name
        print("教师\(tName)实例初始化完成")
    }
    
    func getName()->String
    {
        return tName
    }
    
    deinit
    {
        print("教师\(tName)实例反初始化完成.")
    }
}

class Student
{
    var sName:String
    var teacher:Teacher?  //添加教师对象，初始化时为 ni1
    
    init(name:String)
    {
        sName = name
        print("学生\(sName)实例初始化完成")
    }
    
    func getName()->String
    {
        return sName
    }
    
    deinit
    {
        print("学生\(sName)实例反初始化完成")
    }
}

weak var teacher:Teacher?
weak var student:Student?
teacher = Teacher(name: "刘老师") //创建实例老师，并初始化，name 引用计数是1
student = Student(name: "李明同学") //创建实例学生，并初始化，name 引用计数是1
teacher = nil
student = nil

print("类实例之间的循环强引用--内存泄露测试结束")
*/
/*
 程序运行结果如下：
 教师 刘老师 实例初始化完成
 学生 李明同学 实例初始化完成
 类实例之间的循环强引用一—内存泄漏测试结束
 教师 刘老师 实例反初始化完成
 学生 李明同学 实例反初始化完成
 */

//总之，当A类中包含B类弱引用的实例且B类中存在A类的强引用实例时，A释放，不会影响B的释放，但A的内存回收要等B的实例释放后才可以。当A类中包含B类的强引用实例时，A 释放，不会影响B 的释放。

//---------------无主引用-------------//
/*
 同弱引用一样，无主引用也并不持有实例的强引用。和弱引用不同的是，无主引用通常都有一个值。因此，无主引用并不定义成可选类型。在属性或变量声明时，在前面加上关键字unowned即可指明为无主引用。
 
 无主引用非可选类型，使用无主引用时，通常可以直接访问。但是当无主引用所指实例被释放时，ARC并不能将引用值设置为nil，这是因为非可选类型不能设置为nil
 
 重新修改Student类，teacher类型定义为无主引用。
 */

//无主引用作用示例
class Student
{
    var name:String
    var coach:Coach?
    
    init(name:String)
    {
        self.name = name
        print("\(self.name)实例初始化完成")
    }
    
    deinit
    {
        print("\(self.name)实例反初始化完成")
    }
}

class Coach
{
    var name:String
    var skill:String
    unowned let student:Student //无宿主引用，不可设置为nil
    
    init(name:String,skill:String,student:Student)
    {
        self.name = name
        self.skill = skill
        self.student = student //因为无宿主引用不能设置为可选类型，所以必须要初始化
        
        print("\(self.name) 实例初始化完成")
        print("\(self.name)\(self.skill)")
    }
    deinit
    {
        print("\(self.name)实例反初始化完成")
    }
}

//测试无宿主引用
var stu:Student? = Student(name: "李明")
var coach:Coach? = Coach(name: "教师",skill: "任教程序设计课程",student: stu!)
stu?.coach = coach
stu = nil
coach = nil

print("类实例之间的循环强引用 -- 内存泄露测试结束")
/*
 程序运行结果如下：
 李明实例初始化竞成
 教师实例初始化完成
 教师任教程序设计课程
 李明实例反初始化完成
 教师实例反初始化完成
 类实例之间的循环强引用一-肉存泄漏测试结束
 */

//由程序运行可以看到，两个实例都被反初始化，不存在内存泄漏。使用无宿主引用时，需要特别小心，以防一个对象在释放时一起释放了强引用对象。所以，要想在释放时不影响到原实例，可以使用弱引用，这样就算是nil，也不会被影响。



//-------- 闭包引起的循环强引用及解决方法-------//
/*将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了实例，也会发生强引用循环。这个闭包体中可能访问了实例的某个属性，例如 self somnePropetty，或者闭包中调用了实例的某个方法，例如 self.someMethod。这两种情况都导致了闭包“捕获”self，因为闭包也是引用类型，从而产生了强引用循环。这个强引用循环的存在是因为闭包和类一样都是引用类型。当将闭包赋值给属性时，就给这个闭包赋值了一个引用。这在本质上和前面的问题相同 —— 两个强引用都互相指向对方。与两个实例不同的是，这是一个类与一个闭包。swift为这个问题提供了一个解决方法 —— 闭包捕获列表。
 
 下面的例子展示了使用闭包引起self时产生的强引用循环，定义了一个名为JsonElement的类
*/
/*闭包捕获列表作用示例
 class Student{
    var name:String
    var age:Int
    lazy var stuInfo:()->String =
 {
    [unowned self]in
    "\(self.name),\(self.age)"
 }
 
 init(name:String,age:Int)
 {
    self.name = name
    self.age = age
    print("\(self.name)对象初始化完成")
 }
 
 deinit
 
 {
    print("学生名为：\（self.name），年龄为：\(self.age)")
    print("\(self.name)对象反初始化完成，实例对象即将被释放")
 }
 
 }
 
 var stu：Student？=Student（name：“李明”，age：20）
 var info:(() ->String)? = stu!.stuInfo
 stu = nil
 info = nil
 
 程序运行结果如下：
 李明对象初始化完成
 学生名为：李明，年龄为：20
 李明对象反初始化充成，实例对象即将被释放
 
 这个 Student 类定义了一个表示元素名称的属性 name 和一个可选属性 age，另外还定义了一个lazy属性stuInfo.这个属性引用了一个闭包，这个闭包结合了 name 与age形成一个Student代码字符串。这个属性的类型是（）-> String,它表达一个函数不需要任何参数，返回一个字符串值。
 
 Student类提供了单一的构造器，传递一个name和一个age参数，定义了一个析构器，输出Student实例的析构信息。
 
 通过为闭包的一部分定义捕获列表可以解决闭包和类实例之间的强引用循环，捕获列表定义了在闭包内何时捕获一个或者多个引用类型的规则。像解决两个类实例之间的强引用循环一样，声明每个捕获引用为弱引用或者无主引用。捕获列表中的每个元素由一对weak/unowned关键字和类实例（self或someI instance）的引用组成，这些内容由方括号括起来并由空格分隔。
 
 将捕获列表放在闭包参数列表和返回类型的前面。
*/

/*
 lazy var oneClosure:(Int,String) ->String = {
    [unowned self] (index:Int,StringT:String) -> String in
 
    return " "
}
*/

//如果闭包没有包含参数列表和返回值，但是可以从上下文推断出来，就可以将捕获列表放在闭包的前面，后面+关键字in
/*
 lazy var tempClosure：（）——> String =
 {
    [unowned self] in
    //其他执行代码
 
 
        return “ ”
 }
 */

//当闭包和实例之间总是引用对方并且同时释放时，定义闭包捕获列表为无主引用。当捕获引用可能为 nil 时，定义捕获列表为弱引用。弱引用通常是可选类型，并且在实例释放后被设置为nil

//在实例BaseClass类中，可以使用无主引用来解决强引用循环。

//使用无主引用来解决强引用循环示例
class BaseClass
{
    func base()
    {
        print("父类的普通方法")
    }
    
    func text()
    {
        print("父类的被覆盖的方法")
    }
}

class SubClass:BaseClass
{
    override func text() {
        print("子类的覆盖父类的方法")
    }
    func sub()
    {
        print("子类的普通方法")
    }
}

let bc:BaseClass = BaseClass()
bc.base()
bc.text()

let sc:SubClass = SubClass()
sc.base()
sc.text()

let polymophicBc:BaseClass = SubClass()
polymophicBc.base()
polymophicBc.text()

/*程序运行结果如下：
 
 父类的普通方法
 父类的被覆盖的方法
 父类的普通方法
 子类的覆盖父类的方法
 父类的普通方法
 子类的覆盖父类的方法
 
*/


//----------------多态--------------//
/*
 多态是指同一操作作用于不同的实例，会产生不同的执行结果的现象。
 
 多态性是考虑在不同层次的类中以及在同一个类中同名的成员的关系问题。
 
 多态性允许不同类型的对象对相同成员的调用有不同的反映。
 
 利用多态性技术，可以调用同一名字的方法，实现完成不同的功能。
 
 若程序设计语言不支持多态，不能称为面向对象的语言。多态是面向对象程序设计的关键技术之一，是面向对象程序设计最有力的标志性特征。
 
 在swift中引用变量有两种类型：一种是编译时的类型：另一种是运行时的类型。
 
 编译时的类型由声明该变量时使用的类型决定，编译器只认每个变量编译时的类型；
 
 运行时的类型由实际赋给该变量的实例决定。
 
 如果编译时的类型和运行时的类型不一致，就可能出现多态。
 */

//多态示例
/*
class BaseClass
{
    func base()
    {
        print("父类的普通方法")
    }
    
    func test（）
    {
        print("父类的被覆盖的方法")
    }
}
 
class SubClass:BaseClass
{
    override func test()
    {
        print("子类的覆盖父类的方法")
    }
    func sub() {
        print("子类的普通方法")
    }
 }
 
 //下面编译时类型和运行时类型完全一样，不存在多态
 let bc:BaseClass = BaseClass()
 
 //下面两次调用将执行 BaseClass 的方法
 bc.base()
 bc.test()
 
 //下面编译时类型和运行时类型完全一样，不存在多态
 let sc:SubClass = SubClass()
 
 //下面调用将执行从父类继承到的 base()方法
 sc.base()
 
 //下面调用将执行当前类的test ()方法
 sc.test()
 
 //下面编译时类型和运行时类型不一样，发生多态
 let ploymophicBc:BaseClass = SubClass()
 
 //下面调用将执行从父类继承到的base()方法
 polymophicBc.base()
 
 //下面调用将执行当前类的test()方法
 polymophicBc.test()
 
 //下面调用若执行则编译时出错
 polymophicBc.sub()
 
 上面程序中显式创建了三个引用变量，对于前两个引用变量bc和sc，它们的编译时类型和运行时类型完全相同，因此调用它们的方法完成没有任何问题。但第三个引用变量polymophicBc则比较特殊，它的编译时的类型是BaseClass，而运行时的类型是SubClass，当调用该变量的test（）方法时，由于BaseClass类定义了该方法，子类SubClass用override关键字覆盖了父类的该方法，所以执行的是SubClass类中覆盖后的test（）方法，这就可能出现多态。
 
因为子类其实是一个特殊的父类，所以swift允许把一个子类实例直接赋给一个父类引用变量，不需要任何类型转换，这被称为向上转型。向上转型都是由系统自动完成的。
 
 引用变量在编译阶段只能调用其编译时的类型所具有的方法，运行阶段只能执行其运行时的类型所具有的方法。
 
 总而言之，引用变量只能调用声明该变量时所用类中包含的方法。
*/






/*
 
 当用户操作视图时，应该如何向控制发出通知？
 
 解决这个问题的是插座(outlet）与动作(action），使用这两项可以实现视图与控制间的关联。这一关联过程可以可视化操作，这正是 Cocoa 编程的最大特点。在现实生活中插座常见于家里的墙壁上，接上插头后就能给电器提供电源。Cocoa 编程的情况与此类似，只是需要注意的是淮备在哪里等待视图进行连接。
 
 插座是访问视图的接口，与此相对应的是由动作负责接收来自视图的通知，这样就能对用户的操作做出反应。
 
 如果事先在视图中注册了动作，当用户进行有关操作时，就会调用已注册的动作，进行与用户操作相对应的处理。
 
 插座的本质是实例变量，动作的本质是方法。在各自的前头加上@IB之后，插座和动作在 xcode 及 Interface Builder 中能被自动识别。
 
 */

//-----------------cocoa程序设计的两种框架----------------//
/*
 提供图形化界面的框架统称为 Cocoa，它包含两个框架：基础框架和应用工具AppKit框架。应用工具框架提供了窗口、按钮、滚动条、文本框等图彤化对象。
 
 iphone/iPad 所运行的操作系统称为 ios，在Cocoa这一层叫作 Cocoa Touch。
 
 在Cocoa Touch上，另一个框架是UIKit，而不是AppKit。可以说，UIKit是ios上的AppKit的变种，专门用于为ios应用程序提供界面对象和控制器。
 
 组件又称控件，是可视化程序设计中非常重要的设计元素，借助于已经封装好的组件，可以使应用程序设计过程变得更加快捷、方便。
 
 文本提供类组件：UITextField UILabel等
 命令按钮类组件：如 UIButton
 选择类组件：UITableView
 */


//--------标签组件------//
/*
 标签组件，也即 Label 组件。标签组件中显示的文本分为静态文本和动态文本两种。动态文本是指标签组件中显示的文本内容是实时变化的，例如气温显示等。
 
 标签组件对应 UILabel 类，其继承关系是：NSObject ---> UIResponder ----> UIView ------->UILabel,一般用于显示一行或者多行固定的文本数据，可以通过标签属性来进行设置文本的显示风格、控制文本字体的高度等。
 
 numberOfLines 是标签组件的一个重要属性，它用于指定标签栏中可以显示的最大文本行数。默认值是1，即为一行。当该值设置为0时，就可以显示任意多的行数，并且不受行数的限制。标签属性的设置通常是多项相结合。如果要显示的行数大于所设定的最大行数，需要设置 lineBreakMode 属性。
 */


//-----按钮组件----//
/*
 
 可以说按钮组件也即 Button 组件，是最常用的执行控件，它的最主要的作用是实现单击触发操作。按钮组件对应UIButton类，其继承关系是：
 NSObject -> UIResponder -> UIView ——> UIControl ——>UIButton。仅以字符串作为 Button 标题时，标题字符串可以直接写在 Title 属性中，输入按钮要显示的标题。按钮是一个组件，可以设置按钮的属性
 也可以调用按钮的方法。当单击按钮时，将引发一个 Action 事件，通过设置其属性来处理按钮的单击事件。
 */
 
 //-----文本框组件---//
 /*
  文本框组件也即 Text Field 组件
  
  文本框组件对应于UITextField类，其继承关系是：NSObject ——> UIResponder ——> UIView ——> UIControl ——> UITextField
 
  Placeholder字段：用于指定在文本字段中以灰色显示文本，但前提是 Text 字段为空。
  
  --------日期选择组件----------
  
  1. Mode属性
  设置 DatePicker 组件 Mode 属性的语法为：
  DatePicker 组件.datePickMode = UIDatePickerMode.模式
  
  
  模式有四种值： DateAndTime、 Date 、Time 、 CountDownTimer
  
  设置名称为“日期选择器” 项目的 DatePickerMode 组件的 Mode 属性为：
  datePicker.datePickerMode = UIDatePickerMode.DateAndTime
  
  2.Locale 属性
 DatePicker组件显示的文字会随着Locale属性设置值的不同而异，程序的设置语法为：
  DatePicker 组件.locale = NSLocale(localeIndentifier:"地区代码")
  
  en英文 zh_TW繁体中文 zh_CN简体中文
  
  设置名称为“日期和时间选择器，项目的 DatePickerMode 组件使用简体中文显示，代码为
  datePicker.locale = NSLocale(localIdentifier:"zh_CN")
  
 */
 

//---------表视图组件----------//
 /*
  Table View 组件称为表视图组件，它以一行一行的方式显示数据，每一行数据称为一个单元格（cell），每一个单元格可以包含一个或多个不同类型的组件。
  
  Table View 继承自View 类
  
  代理方法：
  
  numberOfSectionsInTableView(_:)
  设置表格视图中章节的数量，默认值为 1。如果需要添加多个章节，只返回一个更大的整数即可
  
  
  tableView(_:numberOfRowsInSection:)
  设置指定章节中单元格行的数量
  
  tableView（_:titleForHeaderInSection：）
  设置章节的标题文字，返回结果为字符串。若返回结果为nil， 则章节没有标题
  
  sectionIndexTitlesForTableView（_:）
  设置在表格右侧显示的索引序列的内容，返回结果为一个字符串数组
  
  tableView(_:cellForRowAtIndexPath:)
  初始化和复用单元格
  
  */
 
/*
 iPhone使用 UIImageView 支持图片格式 JPG PNG GIF
 
 Image View 对应UIImageView 类，其继承关系：NSObject -> UIResponder ->UIView -> UIImageView
 
 框架位于 /System/Library/Frameworks/UIKit.framework
 */

/*
 一个框架（Framework）就是一个软件包，它包含许多类。Mac操作系统提供了几十个框架，从而帮助软件人员快速地在 Mac 系统上开发应用程序
 
 基础框架就是为所有程序开发提供基础的框架，其中的类包括数字类 （NSNumber）、字符串类 （NSString）、数组类（NSArray）、字典类 (NSDictionary)、集合类(Nsset）
 
 所有基础框架上的类都与用户界面无关，也不用来构建用户界面，这是基础框架和非基础框架的重大区别
 
 为了使用这些类，Swift 需要在程序中使用下述语句来导入基础框架的头文件：
 
 import UIKit
 
 
 设计音频播放器和视频播放器都要使用 AVFoundation 框架，A 代表 Audio, 表示音频，V代表 Video，表示视频，Foundation 意为基础，所以 AVFoundation 框架即为音频和视频基础框架
 */
 

 //---------AVAudioPlayer 类--------//
 
/*
 项目中的音频文件是使用 AvAudioPlayer类来播放的,AVAudioPlayer类位于 AVFoundation 程序库（框架）中，因此必须先导入 AVFoundation 程序（框架）库。
 
 由于音频文件位于项目中，所以获取项目中音频文件的方法是：
 
 路径变量 = NSBundle.mainBundle().pathForResource(文件名，ofType：文件扩展名)
 
 */

/*
 
 iphone SDK 提供了比位置类方便的工具来完成所有位置和地图相关的操作，就是地图工具框架， MapKit框架
 
 MapKit框架主要提供4个功能：显示地图 CLLocation和地址之间的转换 支持在地图上做标记 把一个位置解析成地址
 
 MapKit框架下主要的类有 MKMapView、MKPlacemark、MKUserLocation 和 MKReverseGeocoder
 
 地图视图MKMapView组件主要完成下述功能：
 显示地图
 提供多种显示方式
 支持地图放大和缩小
 在地图上做标记
 在地图上显示手机所在的当前位置
 
 MKMapView类的常用属性和方法
 
 mapType 属性                地图的模式，Standard（默认）为通用地图，Satellite 为卫星模式，Hybrid为混合模式
 region 属性                 地图的显示区域
 showUserLocation 属性       设置是否显示定位图标，true 为显示定位图标，默认为false，表示不显示定位图标
 zoomEnabled属性             设置是否允许缩放，默认为允许。在仿真器中可按住 option 键后，单击地图进行缩放
 userLocation属性            用户的位置
 annotation属性              地图的坐标
 setRegion()方法             设置地图的显示区域、中心点和缩放比例
 addAnnotation()方法         加上地图上的坐标
 
 导航栏组件NavigationController
 标签栏组件TabBarController
 
 面向对象编程典型的三大特征是封装、继承和多态。
 封装指的是把对象的状态数据、实现细节隐藏起来，然后再暴露合适的方法允许外部程序改变对象的状态，这些暴露的方法可以保证修改之后对象的完整性。swift语言提供了 private、internal 和 public 等访问权限控制符来实现封装。
 
 继承是指子类继承父类，即可获得父类的属性和方法。因此，通过继承可以重复使用已有的类。与此同时，继承关系是一种从一般到特殊的关系，这种过程被称为类继承。
 Swift 语言提供了很好的单继承支持，即每个子类最多只能有一个直接父类。Swift 语言通过协议弥补了单继承灵活性不足的缺陷。
 
 多态可以充分利用面向对象的灵活性，调用同一名字的方法，实现完全不同的功能。
 
 Swift 语言的面向对象支持不仅提供了类，还提供了结构体和枚举，这是有别于其他高级语言的重要特征。Swift 语言重新定义了结构和枚举，赋予了它们面向对象的功能。
 
 由于 Swift 语言把结构体和枚举只当成值类型处理，无论赋值还是参数传递，值类
 型的实例都需要被复制副本，因此 Swift 语言必须将结构体和枚举设计成“轻量级”的面向对象类型，所以结构体和枚举都不支持继承。
 
 从功能上来看，Swift 语言的类、结构体、枚举具有完全平等的地位，类、结构体、枚举、扩展和协议同为 Swift 语言的五种面向对象的程序单元。
 
 */

/*
即使是移植的程序，也会因编译器的不同而出现一些意想不到的问题。
 
 编译器给出的提示信息分为两种类型，即错误信息与警告信息。
 
 错误（error）是由于程序代码中出现语法方面的问题，若不进行修改，程序是无法进行下去的。
 
 出现警告（warning）时，首先可以肯定语法方面没有什么问题，但是编器认为会出现潜在的问题。由于语法上没有问题，就算出现了警告信息，程序暂时是
 能够运行下去的。但是否能如期望的那样得出正确的结果就很难说了。有启动后立即停止的警告，也有没有任何问题能正常运行的警告。
 
 在使用某一个变量时，如果使用前还没有定义，会出现错误。在 Swift 语言中，使用变量前必须先定义它，以便系统为其预留存储空间。
 
 在未编写 Swift 文件之前，需要的库或者框架都必须先包含到工程中
 
 
 //---------经常会出现的警告信息--------//
 
 在调用某一个类中的方法时，类声明中并没有包含此方法时出现此信息，首先最可能的原因是方法名输入错误，可以仔细检查一下方法名称，以确保正确。
 
 在某一个类调用自己定义的方法时，如果方法追加在类声明中，则不会出现任何问题。如果实际调用的地方在方法定义的前方，则会出现这种警告信息。这是因为编译器对方法定义的检查是从文件的开始处顺序进行的。利用这个特性，如果不想其他类调用此方法，可以不用追加在类的声明中。
 
 变量已经定义，但是一次都没有被使用时会出现警告信息。经常出现的情况是，曾经使用过的变量经过修改后不再使用它了，但定义还保存着。此时，只用删除变量的定义即可，不理会也是没有问题的。
 
 没有给类声明中的某个方法编写执行代码时，会显示警告信息。出现警告后，该完成的执行代码应该完成，如果觉得这个方法不需要了，可以在类的声明文件中删除此方法的定义。另外，如果实际代码处的方法名与定义的方法名出现不一致时，也会出现警告信息。
 
 方法或函数需要返回值的情况下，没有设置任何返回值时出现警告信息。返回值为void以外的方法中，务必要返回一个具体的值。如果不需要返回值，要将方法的返回值类型修改为void。相反，如果返回值设置为void类型，而在函数或方法中返回了某个值时，会显示“（返回void 的两数中，返回了值）”的警告。
 
 当向方法传递参数，传递过来的参数对象与方法中声明的参数类型不一致时，会出现相应的警告信息。例如，声明的是 NSEnumerator 类型，传递进来的是 NSString 类型，则会显示警告信息.
 
 方法的参数较多，设置时不小心将顺序弄错了也会出现警告信息。在使用参数较多的方法而出现警告信息时，可仔细检查一下参数的顺序。
 
 错误处理的主要步骤有抛出错误、捕获错误和处理错误，其关键字包括 throws（抛出）、try（捕获）和catch（处理）
 
 如果要想在一个函数或方法中抛出错误，需要在声明时写上throws关键字，该关键字需要写在无返回值的函数或方法的参数的后面。如果函数或方法有返回值类型，则该关键字需要出现在返回箭头的前面。
 
 */

/*
 
 捕获错误和处理错误。可以使用do-catch 语句实现错误的捕获和处理，其语法格式如下：
 
 do
 {
 try 抛出错误的函数或方法 //捕获
 语句
 }
 catch 模式
 {
 语句  //处理
 }
 
 注意，模式可以是错误情况的模式，也可以是变量、常量或者没有内容。
 
 
 */
