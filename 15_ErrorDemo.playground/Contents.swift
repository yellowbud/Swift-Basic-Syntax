//: Playground - noun: a place where people can play

import UIKit

//----------------异常的抛出与传递--------------------------//

/*
 在swift中，所有错误和异常都由Error协议来指定。例如，开发者可以编写自定义的枚举类型，使其遵守Error协议来描述所需求的异常类型。
 
 通过Error协议来自定义异常类型，示例代码如下：
 
 */


//自定义的异常类型
enum MyError:Error {
    //定义3种程度的异常
    case DesTroyError
    case NormalError
    case SimpleError
}
print("should error")
//进行异常的抛出
//throw MyError.DesTroyError
print("finish")


/*
 上面的示例代码中自定义了一种异常类型，之后在代码中通过throw关键宇进行了异常的抛出。
 需要注意，抛出的异常如果不进行捕获解决，程序会断在抛出异常的地方，如以上代码将不会打印"finish"
 
 函数在执行时，也可能会产生异常，默认情況下，函数中产生的异常只能在函数内部解决，开发者也可以使用trows关键字将此函数声明为可抛异常函数，如此声明则允许开发者在函数外解决函数内部拋出的异常，创建一
 一个可拋出异常的函数示例代码如下：
 
 
 
 */

func MyFunc(param:Bool)throws->Void {
    if param {
        print("success")
    }else{
        throw MyError.NormalError
    }
}

/*
 上面的函数需要传入一个布尔类型的参数，当此参数为true时，执行正常的打印操作。
 当参数为false，函数将抛出异常。
 
 对于执行可抛异常的函数，swift语言中要使用到try关键字。try关键字的作用是试图执行一个可能抛出异常的函数，其并不能捕获与处理异常，捕获与处理异常需要使用do-catch结构
 
 */


//---------------------------异常的捕获与处理--------------------------------//

/*
 
 如果抛出了异常而不处理，程序会断在异常拋出的地方，这并不是开发者想要的结果。需要在程序出现异常时对异常进行即时处理，以避免程序不能正常运转。
 Swift语言为开发者提供了3种异常处理的方法，即使 用do-catch结构来捕获处理异常、将异常映射为Optional值、终止异常传递。
 
 do-catch结构是Swift语言中处理异常最常用的方法，开发者需要将可能抛出异常的代码放入do结构块中，如果这部分代码中有抛出异常，则会从catch块中寻找对应的异常类型，如果找到对应的，则会执行此catch块中的异常处理代码，示例代码如下：
 
 
 
 */

//使用do-catch进行异常的捕获与处理
do{
    //将可能产生异常的代码写在do块中
    try MyFunc(param: false)
//进行异常类型的匹配
}catch MyError.SimpleError{
    print("SimpleError")
}catch MyError.NormalError{
    print("NormalError")
}catch MyError.DesTroyError{
    print("DesTroyError")
//如果前面的异常类型都没有匹配上 会被最后这个catch块捕获到
}catch{
    print("otherError")
}

/*
 
 使用do-catch结构处理昇常可以根据异常类型分别提供处理方案，保证代码的健壮与可控性。
 
 有些时候开发者可能并不关心产生异常的类型与原因，只需要知道有没有产生异常，对于这
 种情况，使用do-catch结构会显得十分烦琐冗余。Swift语言还提供了另一种方法，可以将异常映射为Optional值，如果函数正常运行，没有拋出异常，则正常返回；如果函数执行出错，拋出了异常，
 则会返回Optional值nil。使用try?来调用函数可以将异常映射为Optional值，示例代码如下：
 
 
 */

var tmp = try? MyFunc(param: false)
if tmp == nil{
    print("执行失败")
}else{
    print("执行成功")
}

/*
 
 
 需要注意，返回值Void并不是nil， Void是空类型，nil是Optional类型中的一种特殊值。
 */
//使用匿名标识符来接收返回值
if let _ = try? MyFunc(param: false) {
    print("success")
}else{
    print("fail")
}

/*
 除了上述两种处理异常的场景外，还有一种比较极端的情況：当开发著可以保证此函数一定不会地出异常时，便可以使用try！来强行终止异常的传递，然而这么做一定的风险，如果这个函数真的抛出了异常，则会产生运行时错误。示例代码如下：
 
 
 */
//如果此函数抛出了异常 则会产生运行时错误
try! MyFunc(param: true)


//--------------------------延时执行结构------------------------------------//

/*
 延时构造语句lazy的作用是降低复杂类实例构造时所消耗的时间。 Swif语言中还提供了一种延时执行结构，在函数中使用延时执行结构可以保证结构中的代码块始终在函数要结束时执行。通常情况下，延时执行结构会被用来释放函数中所使用的一些资源和关闭文件操作等。
 
 如果想让一部分代码在函数结束前才执行，那么直接将它放在函数的最后不就行了吗？实际情况并非如此。
 在函数中，经常会由于特殊情况提前被break （中断）或者return
 (返回)；或者，一个复杂的函数很可能会因为抛出异常而被中断。这些情况都会造成函数的结束，使用延时执行语句可以保证无论函数因为何种原因结束，在结束前都会执行延时结构块中的代码。
 示例代码如下：
 
 */

func TemFunc()throws -> Void {
    defer{
        print("finish")
    }
    print("handle")
    //抛出异常
    throw MyError.DesTroyError
}
//调用此函数执行的结果为
/*
 handle
 finish
 */
try TemFunc()

//延时执行语法通常引用于代码块结束前必须执行某段操作的场景中。

//1.编写一个函数，其功能是输入一个学生分数，打印输出分数所在的成绩等级，60分以下为不及格，60~75分之间为及格，76~90之间为良好，90分以上为优秀。需要注意，分数的取值范围为0~100之间，输入范围之外的分数将抛出异常，需要打印分数无效的提示。
//自定义一个异常类型
enum AchieveError:Error{
    case achieveError
}
func printAchieve(mark:Int)throws{
    if mark<0 {
        throw AchieveError.achieveError
    }else if mark<60{
        print("成绩不及格")
    }else if mark<76{
        print("成绩及格")
    }else if mark<91{
        print("成绩良好")
    }else if mark<101{
        print("成绩优秀")
    }else{
        throw AchieveError.achieveError
    }
}
//调用函数
do{
   try printAchieve(mark: 98)
}catch AchieveError.achieveError{
    print("成绩无效")
}catch{
    print("2121")
}

/*
 
 简述 Swift 中内存管理的原理
 
 1.swift采用的是内存引用计数的方式进行内存管理。
 
 2.所谓内存引用计数，是指每一个对象（引用类型的示例）内部都有一个计数器，当它被创建出来时，引用计数为1，每次当有其他对象对它进行引用时，引用计数会增加，当不再对它进行引用时，计数会减少。当某个对象的引用计数降为0时，对象会被销毁，内存会被回收。
 
 3.ARC 是xcode 编译器特有的功能，其也被称为自动引用计数，即在编写代码时开发者不再需要手动调用内存计数代码，编译器会帮我们完善。
 
 
 什么是内存泄漏？简述开发中可能出现内存泄漏的场景。
 
 1.内存泄漏是指一个对象不再会被使用，却依然占据着内存空间，内存泄漏会随着程序运行时间的增长而积累，直到发生破坏性的错误。
 2.在 Swift 语言中，闭包是十分容易产生内存泄漏的一种场景，当闭包作为类成员的属性并且在闭包内使用了类成员本身时，十分容易产生循环列用。
 3.在编写代码时，要适时地使用弱引用和无主引用的方式来避免循环引用。
 
 
 
 
 
 */
