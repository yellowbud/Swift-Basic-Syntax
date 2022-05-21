import UIKit



//enum关键字来进行枚举的创建
////创建一个姓氏类型枚举
//enum Surname {
//    //使用case进行枚举值的设置
//    case 张
//    case 王
//    case 李
//    case 赵
//}定义了4个枚举值


//创建一个姓氏枚举类型
enum Surname {
    //也可以在一条case语句中定义多个枚举值
    case 张,王,李,赵
}

//可以在声明变量时将变量的类型指定为某个枚举类型，也可以通过对变量初始化来使编译器自动推断出变量的类型。枚举中定义的枚举值，可以使用点语法来获取，示例如下：

//创建一个姓氏枚举类型的变量
var sur:Surname
//对sur变量进行赋值
sur=Surname.张

//实际上，如果一个变量的类型已经确认为某个枚举类型，那么在进行变量赋值的时候，是可以将枚举类型省略掉的，直接使用点语法获取枚举值即可，示例如下
//对sur进行修改
sur = .王



//枚举类型经常与switch-case结合使用以实现选择结构，对枚举类型的变量进行switch选择结构
switch sur {
    case .张:
        print("姓氏张")
    case .王:
        print("姓氏王")
    case .李:
        print("姓氏李")
    case .赵:
        print("姓氏赵")
}

/*
 枚举为一组相关的值定义了一个共同的类型，使你可以在你的代码中以类型安全的方式来使用这些值。
 
 Swift 中的枚举更加灵活，不必给每一个枚举成员提供一个值。
 如果给枚举成员提供一个值（称为原始值），则该值的类型可以是字符串、字符，或是一个整型值或浮点数。
 */

enum SomeEnumeration {
    //枚举定义放在这里
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}
//枚举中定义的值（如 north，south，east 和 west）是这个枚举的成员值（或成员）。你可以使用 case 关键字来定义一个新的枚举成员值。这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型。

//多个成员值可以出现在同一行上，用逗号隔开：
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//每个枚举定义了一个全新的类型。像 Swift 中其他类型一样，它们的名字（例如 CompassPoint 和 Planet）以一个大写字母开头。给枚举类型起一个单数名字而不是复数名字，以便于：
var directionToHead = CompassPoint.west
//directionToHead 的类型可以在它被 CompassPoint 的某个值初始化时推断出来。一旦 directionToHead 被声明为 CompassPoint 类型，你可以使用更简短的点语法将其设置为另一个 CompassPoint 的值
directionToHead = .east
//当 directionToHead 的类型已知时，再次为其赋值可以省略枚举类型名。在使用具有显式类型的枚举值时，这种写法让代码具有更好的可读性。


//---------枚举的原始值与相关值-----------//

//枚举的原始值特性可以将枚举值与另一种数据类型进行绑定，相关值则可以为枚举值关联一些其他数据。通过相关值，可以实现复杂的枚举类型。


//------------枚举的原始值---------//

//为枚举类型指定一个原始值类型
enum CharEnum:Character{
    //通过赋值的方式来为枚举值a设置一个原始值“a”
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
}

//如果开发者要指定枚举的原始值类型为Int类型，那么可以只设置第一个枚举值的原始值，其后的枚举值的原始值会在第一个枚举值的原始值的基础上依次递增，示例如下：

enum IntEnum:Int {
    //第一个枚举值的原始值设置为1
    case 一 = 1
    //默认原始值为2
    case 二
    //默认原始值为3
    case 三
    //默认原始值为4
    case 四
}

//通过枚举类型中的rawValue属性来获取枚举的原始值，示例如下：

//创建枚举变量
var char = CharEnum.a
//获取char枚举变量的原始值 "a"
var rawValue = char.rawValue

//在枚举变量初始化时，开发者可以使用枚举类型加点语法的方式，如果这个枚举有指定的原始值，也可以通过枚举值的原始值来完成枚举实例的构造
//通过原始值构造枚举变量 一
var intEnum = IntEnum(rawValue: 1)
//通过原始值进行枚举实例的构造时，是有可能构造失败的，因为传入的原始值不一定会对应某一个枚举值。因此，这个方法实际上返回的是一个optional类型的可选值，如果构造失败，则会返回nil


//---------枚举的相关值-------//
//枚举类型的设计思路是将一些简单的同类数据进行整合。一个例子，在游戏类软件的开发中经常会使用到各种物理模型，以形状为例，开发者通常会定义一系列的枚举值进行物理形状的枚举，如圆形、三角形、矩形等。不同的形状需要不同的参数。例如，圆形需要圆心和半径来确定，矩形需要中心点与宽高来确定，三角形需要3个顶点来确定。如果对枚半类型进行实例化，可以根据不同的形状设置不同的参数，设置相关值就可以完成这样的需求。

//在定义枚举值时，可以为其设置一个参数列表，这个参数列表被称为 枚举的相关值

//定义形状枚举
enum Shape {
    //圆形 设置圆心和半径 为相关值
    case circle(center:(Double,Double),radius:Double)
    //矩形 设置中心 宽 高 为相关值
    case rect(center:(Double,Double),width:Double,height:Double)
    //三角形 设置3个顶点 为相关值
    case triangle(point1:(Double,Double),point2:(Double,Double),point3:(Double,Double))
}

//在创建相关值枚举的时候，开发者需要提供参数列表中所需要的参数，示例如下：
//创建圆形枚举实例 此圆的圆心为(0,0)，半径为3
var circle = Shape.circle(center: (0, 0), radius: 3)
//创建矩形枚举实例 此矩形的中心点为(1,1)，宽度10，高度15
var rect = Shape.rect(center: (1, 1), width: 10, height: 15)
//创建三角形枚举实例 此三角形的3个顶点为(2,2),(3,3),(2,5)
var triangle = Shape.triangle(point1: (2, 2), point2: (3, 3), point3: (2, 5))

//在switch-case结构语句中，匹配到枚举后，可以通过参数捕获的方式来获取枚举实例的相关值，这里捕获到的相关值参数可以在开发者的代码中使用，示例如下：

//写一个匹配函数 参数为Shape枚举类型
func shapeFunc(param:Shape){
    switch param {
        //进行参数捕获
    case let .circle(center,radius): //如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，你可以只在成员名称前标注一个 let 或者 var
        print("此圆的圆心为：\(center)，半径为：\(radius)")
    case let .rect(center,width,height):
        print("此矩形的中心为：\(center)，宽为：\(width)，高为：\(height)")
    case let .triangle(point1,point2,point3):
        print("此三角形的3个顶点分别为：\(point1)，\(point2)，\(point3)")
    }
}
shapeFunc(param: circle)
shapeFunc(param: rect)
shapeFunc(param: triangle)

//--------递归枚举-----------// 枚举值的参数列表：相关值

//1.存储简单的算术表达式,可以存储三种算数表达式：纯数字、两个表达式相加、两个表达式相乘。
//枚举成员 addition 和 multiplication 的关联值也是算术表达式——这些关联值使得嵌套表达式成为可能。例如，表达式 (5 + 4) * 2，乘号右边是一个数字，左边则是另一个表达式。因为数据是嵌套的，因而用来存储数据的枚举类型也需要支持这种嵌套——这意味着枚举类型需要支持递归。
indirect enum ArithmeticExpression { //有3种不同情况
    case number(Int) //成员值/枚举值（number）具有（Int）类型关联值
    case addition(ArithmeticExpression,ArithmeticExpression)
    case multiplication(ArithmeticExpression,ArithmeticExpression) //在addition、multiplication的情况下，只接受ArithmeticExpression类型的值
}

//2.使用 ArithmeticExpression 这个递归枚举创建表达式 (5 + 4) * 2
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

//3.要操作具有递归性质的数据结构，使用递归函数是一种直截了当的方式。例如，下面是一个对算术表达式求值的函数：
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
// 打印“18”

//该函数如果遇到纯数字，就直接返回该数字的值。如果遇到的是加法或乘法运算，则分别计算左边表达式和右边表达式的值，然后相加或相乘。



//-----------------------------------------------------//
//递归是一种代码算法技巧。递归就是程序调用自身的编程技巧。针对函数来说，递归函数就是在函数内部进行了此函数本身的调用。递归算法效率十分高，但是其性能资源的耗费也十分严重。在大多数情况下，开发者应该尽量避免使用递归。


//使用递归算法来实现计算正整数的阶乘
func mathsFunc(param:Int)->Int{
    let tmp = param-1
    if tmp>0 {
        //递归
        return mathsFunc(param: tmp) * param
    }else{
        return 1
    }
}
mathsFunc(param: 5)

//函数的功能是进行数据的计算，递归函数只是使用递归的算法来进行数据的计算。而枚举则不同，枚举的功能是数据的描述。例如创建的形状枚举，其中只是对几种形状的数据结构进行描述和定义，并不具备数据计算的功能。递归枚举其实就是使用递归的方式来进行数据描述，使用枚华描述加减乘除四则表达式的示例代码如下：

//使用枚举来模拟加减乘除四则运算
/*enum Expression {
 
    case add(param1:Int,param2:Int) //表示加法运算，两个相关值 param1 与 param2 代表进行加法运算的两个参数
 
    case sub(param1:Int,param2:Int) //表示减法运算，两个相关值 param1 与 param2 代表进行减法运算的两个参数
 
    case mul(param1:Int,param2:Int) //表示乘法运算，两个相关值 param1 与 param2 代表进行乘法运算的两个参数
 
    case div(param1:Int,param2:Int) //表示除法运算，两个相关值 param1 与 param2 代表进行除法运算的两个参数
 }
 
 //使用上面创建的枚举来描述四则运算表达式，示例如下：
 
 var exp1 = Expression.add(param1: 5, param2: 5)  表示表达式5+5
 
 var exp2 = Expression.sub(param1: 10, param2: 5) 表示表达式10-5
 
 var exp3 = Expression.mul(param1: 5, param2: 5)  表示表达式5*5

 var exp4 = Expression.div(param1: 10, param2: 2) 表示表达式10/2
 
 变量expl、exp2、exp3、cxp4只是四则运算表达式的描述，并没有运算功能。Expression枚举模拟的是一种四则运算表达式类型，如果要进行运算，还需要实现具体的功能函数。
 
 Expression能够描达的表达式只是单运算表达式，它不能够进行复合表达式的描述， 例如不能描述（（5+5）*2 - 8）/2 表达式。分析这类复合表达式，其实质只是将单运算表达式作为计算的参数传入另一个单运算表达式。类比Swift语言中的枚举，一个枚举值的相关值类型可以设置为这个枚举本身的类型，通过这种递归的方式就可以实现复合表达式的描达，将前面创建的Expression枚举修改如下：

*/

//使用枚举来模拟加减乘除四则运算
 enum Expression {
    //描述单个数字
    case num(param:Int)
    //表示加法运算 将Expression作为相关值参数类型
    indirect  case add(param1:Expression,param2:Expression)
    //表示减法运算
    indirect  case sub(param1:Expression,param2:Expression)
    //表示乘法运算 
    indirect  case mul(param1:Expression,param2:Expression)
    //表示除法运算
    indirect  case div(param1:Expression,param2:Expression)
}
//使用indicrt关键字修饰的枚举值表示这个枚举值是可递归的，即此枚举值中的相关值可以使用其枚举类型本身。使用修政后的Expression枚举来描述复合表达式(（5+5)*2-8）/2的代码如下：

//创建单值5
var num5 = Expression.num(param: 5)
//进行表达式5+5描述
var exp1 = Expression.add(param1: num5, param2: num5)
//创建单值2
var num2 = Expression.num(param: 2)
//进行表达式(5+5)*2的描述
var exp2 = Expression.mul(param1: exp1, param2: num2)
//创建单值8
var num8 = Expression.num(param: 8)
//进行表达式(5+5)*2-8的描述
var exp3 = Expression.sub(param1: exp2, param2: num8)
//进行表达式((5+5)*2-8)/2的描述
var expFinal = Expression.div(param1: exp3, param2: num2)

//最后得到的变量expFinal就是对(（5+5)*2-8）/2的描述。另外，读者可以为这个四则表达式枚举类型Fxpression实现一个函数来进行运算，在开发中将描述与运算结合，能够编写出十分优美的代码。处理递归枚举通常会采用递归函数，函数方法实现示例如下：

//这个递归函数的作用是将Expression描述的表达式进行运算 结果返回
func expressionFunc(param:Expression) -> Int {
    switch param {
       
    case let .num(param): //单值直接返回
        return param
        
    case let .add(param1, param2): //返回加法运算结果
        return expressionFunc(param: param1)+expressionFunc(param: param2)
        
    case let .sub(param1, param2): //返回减法运算结果
        return expressionFunc(param: param1)-expressionFunc(param: param2)
        
    case let .mul(param1, param2)://返回乘法运算结果
        return expressionFunc(param: param1)*expressionFunc(param: param2)
        
    case let .div(param1, param2)://返回除法运算结果
        return expressionFunc(param: param1)/expressionFunc(param: param2)
    }
}
//进行((5+5)*2-8)/2运算 结果6
expressionFunc(param: expFinal)

/*如果一个枚举中所有的枚举值都是可递归的，可以直接将整个枚举类型声明为可递归的。示例如下：
indirect enum Expression {
    
    case num(param:Int) //描述单个数字
 
    case add(param1:Expression,param2:Expression) //表示加法
 
    case sub(param1:Expression,param2:Expression)
 
    case mul(param1:Expression,param2:Expression)
 
    case div(param1:Expression,param2:Expression)
}

*/


//模拟设计一个交通工具枚举 将速度与乘坐价钱作为枚举的相关值
enum Transport{
    case car(price:Int,speed:Float)
    case boat(price:Int,speed:Float)
    case airport(price:Int,speed:Float)
}
//创建一个汽车交通工具 价钱2 速度80
var car = Transport.car(price: 2, speed: 80)


/*
 怎样理解枚举？ Swift中的枚举有什么特别之处？
 
 1.枚举也是一种数据类型，数据类型的作用就是用来描述数据，枚举通常用来描述一组简单的、属性一致的数据。
 
 2.枚举在swift中被设计得非常强大，其可以通过继承某个数据类型
 来为每一个枚举值指定原始值，其也可以在定义枚举值时定义一组与之有联系的相关值。通过相关值，枚举可以描述的数据的灵活性大大增强了。
 

 
 */
