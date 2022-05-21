import UIKit
import Foundation

/*
 函数的设计思路是将有一定功能的代码块包装在一起，通过函数名实现复用。闭包和函数有着类似的作用，然而闭包的设计大多数情况下并不是为了代码的复用，而是传递功能代码块和处理回调结构。
 
 首先，一个完整的函数包含函数名、参数列表、返回值和函数体，示例如下：
 
 */

//标准函数 这个函数的功能是计算某个整数的平方
func myFunc(param:Int)->Int{
    return param*param
}
//将上面函数的功能使用闭包来实现，代码如下：        闭包的实现方式
let myClosures = {(param:Int) in
    return param*param
}
//上面的代码创建了一个名为myClosures的闭包常量，闭包在语法上有这样的标准结构：{(参数列表)->返回值 in 闭包体（实现具体功能）}
//闭包也可以像函数一样被调用


//对函数进行调用 将返回9
myFunc(param: 3)
//对闭包进行调用 将返回9
myClosures(3)

//与函数不同的是，闭包的返回值是可以省略的，在闭包体中，如果有return返回，则闭包会自动将return的数据类型作为返回值类型，上面的闭包代码也可以简写为如下样式：
/*闭包的实现方式
let myClosures = { (param:Int) in
    return param*param
}
*/

//----------------通过实现一个排序函数来深入理解闭包--------//

/*
 要排序的对象并不是简单的数字类型值或者字符串类型值，而是自定义的复杂对象，也就是开发者常用的类。对于这种类型的排序需求，应该如何实现呢？首先应该明确需求问题，如下：
 
 1 应该实现一个函数来对数组类型排序
 2 数组中的元素可以是任意的复杂类型
 
 实现根据复杂类型数据中的某一个属性进行排序，例如学生的成绩。
 
 1 针对上面提出的需求问题，设计初步的实现思路。
 2 以通用的数组类型作为函数的参数
 
 若要实现对自定义复杂类型的排序操作，则需要将排序算法作为参数传入函数
 
 编写函数的结构示例如下：
 
 func mySort(array:Array<Any>,sortClosure:(Int,Int) ->Bool) -> Array<Any> {
    return array
 }
 
 Any 在swift语言中代表任意类型
 */


/*mySort()函数中需要传入两个参数：1.要进行排序的数组数据 2.一个闭包排序方法。这个闭包有两个Any类型的参数，表示数组中两个相邻的元素。
第1个参数表示前一个元素，第2个参数表示后一个元素，这个闭包有一个Bool类型的返回值，返回true则表示正向排序 ：即参数中的第1个元素和第2个元素不交换位置，返回false表示逆向排序，即参数中的第1个元素和第2个元素交换位置。
 
 根据上面的分析来对mySort函数进行实现，代码如下
 */
func mySort(array:inout Array<Any>, sortClosure:(Any,Any)->Bool) -> Array<Any> {
    //进行冒泡排序算法
    for indexI in array.indices {
        //最后一个元素直接返回
        if indexI == array.count-1 {
            break
        }
        //冒泡排序
        for indexJ in 0...((array.count-1)-indexI-1){
            //调用传递进来的闭包算法
            if sortClosure(array[indexJ],array[indexJ+1]) {
                
            }else{
                //进行元素交换
                array.swapAt(indexJ, indexJ+1)
            }
        }
    }
    return array
}

//如以上代码所示，使用了冒泡排序算法来进行排序操作，而具体两个元素的排序规则是由闭包sortClosure来实现的。swapAt（）函数是Swift语言中的一个交换函数，用来实现数组元素的交换，由于需要对原数组数据进行操作，因此需要使用inout类型的数组参数。

//先使用整型数组来对编写的排序函数进行测试，代码如下：

var  array:Array<Any> = [1,4,3,5,7,5,4,2,7]
mySort(array: &array, sortClosure: {(i:Any, nextI:Any) in
    (i as! Int) < (nextI as! Int) //as！的作用是类型转换
})
/*
 
 &将传递参数变量的内存地址
 
 &使得变量成为一个 in-out参数。In-out 实际上是指通过引用传值，而不是通过值传递值。
 通过引用接受值，通过引用传递值
 
 It works as an inout to make the variable an in-out parameter. In-out means in fact passing value by reference, not by value. And it requires not only to accept value by reference, by also to pass it by reference
 */


/*
 $0、$1
 $0 ：闭包中的第一个参数
 $1 ：闭包中的第二个参数
 swift自动为闭包提供参数名缩写功能，可以直接通过$0和$1等来表示闭包中的第一个第二个参数，并且对应的参数类型会根据函数类型来进行判断。
 
 如下代码：
 
 不使用$0 $1这些来代替
 let number = [1,2,5,4,3,6,8,7]
    sortNumber = number.sorted( by: { (a,b) -> Bool in
         return a < b
    })
    print("number -" + "\(sortNumbers)")
 
 
 使用$0 $1
 let number = [1,2,5,4,3,6,8,7]
 var sortNumber = number.sorted(by: {$0 < $1})
 print("number -" + "\(sortNumbers)")
 
 可以发现使用$0、$1的话，参数类型可以自动判断，并且in关键字也可以省略，也就是只用写函数体就可以了
 
 
 */

//The closure accepts a parameter. Thus, its type needs to be specified. In this case, it takes a name string and returns nothing, thus the type(String) -> ()
//闭包接受一个参数。因此，需要指定它的类型。在这种情况下，它接受一个名称字符串并且不返回任何值，因此类型为(String)-> ()。
let greet:(String) -> () = { name in
    print("Hello,\(name)!")
}

greet("Nick")









//编写一个自定义的类来进行排序测试，示例如下：

print(array)
//编写一个学生类
class Student : CustomStringConvertible { //上面的代码在定义学生类的时候遵守了 CustomStringConvertible 协议，实现这个协议的description 方法可以自定义类对象的打印信息，在代码调试时非常好用
    
    //学生成绩
    let achievement:Int
    //学生姓名
    let name:String
    //构造方法
    init(name:String,achievement:Int){
        self.achievement = achievement
        self.name=name
    }
    //自定义打印方法
    var description: String {
        return "\(name):\(achievement)"
    }
    
}

//创建4个学生
let stu1 = Student(name: "小王", achievement: 89)
let stu2 = Student(name: "小李", achievement: 69)
let stu3 = Student(name: "小张", achievement: 81)
let stu4 = Student(name: "小孙", achievement: 93)
//将学生放入数组
var stuArr:Array<Any> = [stu1,stu2,stu3,stu4]
//进行排序
mySort(array: &stuArr) {
    ($0 as! Student).achievement > ($1 as! Student).achievement
}

//以上代码模拟了一个学生类，每个学生对象由名字和分数组成，闭包实现了对学生分数的排序规则。



//===============将闭包作为参数传递时的写法优化==========//

/*将闭包作为参数传递进函数时，也可以在标准形式上做许多优化。我们依然以学生数组排序的代码为例，省略闭包返回值类型的写法如下：

 //省略返回值
mySort（array： &stuArr， sortClosure：{ （i， nextI） in
 return (i as! Student).achievement > (nextI as! Student).achievement
 }）

 闭包作为函数参数时的参数类型可以省略，是因为在函数声明时，闭包参数中已经指定了参数的类型，编译器可以进行自动推断。
 
 如果闭包由一行代码组成，return关键字也可以省略，默认会将此行代码的执行结果返回。需要注意，只有将闭包作为函数的参数才可以如此简化，示例如下:
 //省略return
 mySort（ array：&stuArr， sortClosure： { (i, next) in
    (i as! Student).achievement > (next as! Student).achievement
 } ）
 
 //使用index和nextIndex来标识闭包中的参数，实际上编译器根据此闭包进行函数参数声明时。闭包的参数列表会自动创建一组参数，参数名的结构为$0、¥1...。因此，开发者也可以使用编译器默认生成的参数名，而不必指定参数名。表现在代码写法上，可以将参数列表和闭包关键字in省略，优化后代码如下：
 
 mySort（array： &stuArr, sortClosure: {
    ($0 as! Student).achievement > ($1 as! Student).achievement
 }）
*/
 
 
 
 
 
 //=====================后置闭包、逃逸闭包与自动闭包================//
 
 /*
  闭包常常会作为函数的参数来使用，函数在调用时，参数是写在小括号中的参数列表中的，而闭包又是一个写在大括号中的代码块，如此的嵌套写法在视觉上十分不直观。因此，swift语言中提供了后置闭包的写法。当函数中的最后一个参数为闭包参数时，在调用函数时，开发者可以将闭包结构脱离出函数的参数列表，追加在函数的尾部，增强代码的可读性，示例如下：
  */
 
//原结构
mySort(array: &stuArr, sortClosure: {
    ($0 as! Student).achievement > ($1 as! Student).achievement
})
//后置闭包结构
mySort(array: &stuArr){
    ($0 as! Student).achievement > ($1 as! Student).achievement
}
print(stuArr)
 
 //后置闭包的语法简化了代码的结构，这里面还有一个小技巧，如果一个函数只有一个参数，且这个参数是一个闭包类型的参数，则开发者在调用函数时，使用后置闭包的写法可以直接将函数的参数列表省略，示例代码如下：
 
//只有一个闭包参数的函数 此闭包参数默认是非逃逸的 此闭包不可作为返回值返回 也不可赋值给外部变量
func myFunc(closure:(Int,Int)->Bool) { //
    
}
//进行闭包的后置 可以省略参数列表
myFunc {
    $0>$1
}
 
/*
 以上示例代码几乎是闭包的最简形式了。
 
当闭包传递进函数时，系统会为此闭包进行内存的分配。在Swift语言中，还有逃逸闭包与非逃逸闭包这样的概念。
 
所谓逃逸闭包，是指函数内的闭包在函数执行结束后在函数执行结束后在函数外依然可以使用。
 
 非逃逸闭包只能在函数内部使用，在函数外部不能使用。默认情况下，函数参数中的闭包都为非逃逸闭包，这样做的优点是可以提高代码性能，节省内存消耗，可以根据实际需求将闭包参数声明成逃逸闭包。
 
 
 
 非逃逸闭包也不可以作为返回值返回，如果这么做，编译器会抛出一个错误。
 
  
 我们默认定义的闭包都是非逃逸类型，参数中的闭包默认都是非逃逸的，示例代码如下：
 
 //只有一个闭包参数的函数，此闭包不可作为返回值返回，也不可赋值给外部变量
 func myFunc(closure：（Int，Int）->Bool){
 
 }
 
 
 //逃逸类型的闭包常用于异步操作中，例如一个后台请求完成后要执行闭包回调，需要使用逃逸类型。
 
 不是所有的闭包都需要显式创建，Swift语言中还有一种语法，其可以实现对简单闭包的自动生成，这种闭包通常称为自动闭包。自动闭包参数的使用有严格的条件，首先此闭包不能够有参数，其次在调用函数传参时，此闭包的实现只能由一句表达式组成，闭包的返回值即为此表达式的值，自动闭包参数由@autoclosure来声明，示例代码如下
 */

 
/*
//将闭包参数声明为自动闭包
func myFunc2( closure:@autoclosure @escaping ()->Bool)  {
    
}
//调用函数时，直接传入一个表达式即可，编译器会自动生成闭包参数
myFunc2(closure: 1+2+3>10)


 //自动闭包默认为非逃逸的，若要使用逃逸类型的闭包参数，则需要声明如下：
 //将闭包参数声明为自动闭包、逃逸闭包
func myFunc2(closure:@autoclosure@escaping()->Bool){
    
}
 */
 


//1.使用闭包的风格模拟Dictionary数据的遍历。
//创建一个字典示例
let dic:Dictionary = [1:"1",2:"2",3:"3",4:"4",5:"5"]
//创建一个函数 通过闭包来传递遍历结果
func MyEnumDic(dic:Dictionary<Int,String>,closure:(_ key:Int,_ value:String)->Bool){
    //遍历字典
    for item in dic {
        //执行闭包代码
        if closure(item.0,item.1) {
            //如果闭包返回值为true，则中断遍历
            return
        }
    }
}
MyEnumDic(dic: dic) { (key, value) -> Bool in
    if key == 3 {
        //开发者自己控制中断遍历的逻辑
        print(value)
        return true
    }
    print(value)
    return false
}
/*
 MyEnumDic（dic;closure:）函数将每次遍历字典的结果传递给闭包，具体这些结果应该怎样使用，完全交由闭包中的逻辑来实现，并且通过闭包的返回值控制字典遍历是否结束，当开发者找到自己需要的值后，在闭包中返回true即可提前中断字典的遍历，提高代码的运行性能。
 */

/*
 一 怎么理解函数
 
 1.函数其实是一组代码的组合，因此函数也被称为完成特殊功能的代码块。
 2.函数的三要素是函数名、参数和返回值
 3.可以定义带默认值的函数，也可以定义参数个数不定的函数，函数的参数名也可以自由地设置内部名称和外部名称，甚至匿名
 4.在定义函数时，可以将其理解为小功能单元，切记避免函数过于冗长。
 
 二、什么是闭包？
 1.闭包是Swift中的一种高级语法结构，闭包的核心是在其中使用的局部变量会被额外地复制或引用，使这些变量脱离其作用域后依然有效。
 2.闭包的功能与函数类似，其也是完成特定功能的代码块。可以将闭包当作对象使用，将其赋值给指定的变量，并且可以使用此变量直接调用闭包。
 3.和函数一样，闭包也有参数和返回值
 4.闭包也可以作为函数的参数或返回值
 5.在swift中，闭包有逃逸闭包与非逃逸闭包之分，对于逃逸闭包，函数内的闭包在函数外依然有效，对于非逃逸闭包，离开函数后闭包将失效。
 6.swift语言中的闭包写法十分灵活，可以使用各种技巧来编写非常简洁的闭包代码，例如后置闭包技巧、省略参数类型技巧、省略返回值类型技巧。

 在实际开发中，闭包的使用非常频繁，网络回调、自定义算法块、界面间传值等都会使用到闭包
 
 
 
 
 */
