//----------------- 实例方法与类方法 ----------------------//

/*
 实例方法是由类型的实例进行调用的，类方法是由类型名直接调用的。
 类方法通常也用来描述整个类型所共享的行为
 
 方法只是一个术语，其实质是将函数与特定的类型进行结合。实例方法在语法上和函数完全一致，其与具体类型的实例相关联，实例通过点语法来调用其方法。
 
 */


import UIKit
//创建一个数学类
class Math {
    //提供一个加法的实例函数
    func add(param1:Double,param2:Double) -> Double {
        return param1+param2
    }
    //提供一个求和的平方的方法
    func sqr(param1:Double,param2:Double) -> Double {
        //调用自身的其他实例方法
        return self.add(param1: param1, param2: param2) * self.add(param1: param1, param2: param2) //一般情况 下，self是可以被省略的
    }
}
//创建数学类实例
var obj = Math()
obj.sqr(param1: 3, param2: 3)

//实例对象通过点语法调用实例方法
obj.add(param1: 2, param2: 3)

/*
 类的每一个实例中都默认隐藏着一个名为self的属性，可以简单理解为，self就是实例本身，可以在实例方法中通过self来调用类的属性和其他实例方法。
 
 一般情况 下，self是可以被省略的，直接通过方法名来调用自身的实例方法也是没问题的。
 
 有一种情况需要注意，在对实例属性进行调用的时候，有时候属性名称可能会和方法中的参数名称相同，这时为了避免歧义，实例属性前的self不能够省略。
 
 对于引用类型，在实例方法中对实例属性进行修改是没问题的。
 但是对于值类型，使用mutating关键字修饰实例方法才能能对属性进行修改，示例如下：
 
 struct Point {
    var x:Double
    var y:Double
    
    //将点进行移动，因为修改了属性的值，需要用 mutating 修饰方法
    mutating func move(x:Double,y:Double) {
            self.x+=x
            self.y+=y
    }
 }
 
 //创建点结构体实例
 var Point = Point(x: 3, y:3)
 
 //进行移动，此时位置为 x=6, y=6
 point.move(x: 3, y: 3)
 
实际上，在值类型实例方法中修改值类型属性的值就相当于创建了一个新的实例，上面的代码和下面的代码原理上是一致的：

 struct Point {
    var x:Double
    var y:Double
 
    mutating func move（x:Double,y:Double） { //将点进行移动，直接创建新的实例
        self = Point(x: self.x+x, y: self.y+y)
    }
 }
 
 //创建点结构体实例
 var point = Point (x: 3, y: 3)

 //进行移动，此时位置为 x=6,y=6
 point.move (x: 3, y: 3)

 */

//--------------类方法--------------//

/*
 类方法是关联整个类型的，被整个类型所共享。对比类属性，Swift语言中的类方法也是通过static和class关键字来声明的
 static关键字声明的类方法又被称为静态方法，其不能被子类覆写，而class关键字声明的类方法可以被类的子类覆写。
 
 在类方法中也可以使用self关键字，但此时self关键字不再代表实例本身，而是代表当前类。
 在类方法中使用self可以对当前类型的类属性和类方法进行调用。为Point结构体提供一个静态方法，如下
 
 */


//创建一个点结构体
struct Point {
    var x:Double
    var y: Double
    //将点进行移动 因为修改了属性的值 需要用mutating修饰方法
    mutating func move(x:Double,y:Double) {
        self = Point(x: self.x+x, y: self.y+y)
    }
    //提供一个类属性。提供一个静态属性
    static let name = "Point"
    static func printName(){
        //使用self调用类（静态）属性
        print(self.name)
    }
}

//使用类型名直接调用类（静态）方法
Point.printName()


//创建点结构体实例
var point = Point(x: 3, y: 3)

//进行移动 此时位置为 x=6，y=6
point.move(x: 3, y: 3)




//对于类来说，使用class关键字声明的类方法可以被子类覆写，示例代码如下



//创建一个类作为基类
class MyClass {
    class func myFunc(){
        print("MyClass")
    }
}
class SubMyClass: MyClass {
    //对父类类方法进行覆写
    override class func myFunc(){
        print("SubMyClass")
    }
}
SubMyClass.myFunc()


//----------------下标方法------------------------//

var array = [1,2,3,4,5,6,7]
//通过下标获取数组中第3个元素 注意下标从零开始
array[2]

/*
 模拟系统的Array数组创建一个自定义的数组类
 
 class MyArray {
    var array:Array<Int>
    init(param:Int...) {
        array = param
    }
 
 //subscript 是swift 语言中用于定义下标功能的方法
     
    subscript(index:Int)->Int{
            set{
                //默认外界设置的值会以 newvalue 为名称传入，开发者也可以自定义
                array[index] = newValue
            }
            get{
                return array[index]
            }
        }
 }
 
 var myArray = MyArray(param: 1,2,3,4,5)
 //通过下标进行访问
 myArray[2]
 myArray [1] =0
 
 下标使用subscript来定义，其与普通方法类似，参数和返回值分别作为下标和通过下标所取的值。
 但是subscript实现部分和计算属性十分相似，必须实现一个go代码块和一个可选的set代码块，ge代码块用于使用下标取值，set代码块用于使用下标设置值。
 因此，subscript 结构更像是计算属性和方法的混合体。
 
 上面的示例代码中演示了为自定义的类型添加下标访问的功能，实际上下标访问并不只局限于一维下标，开发者可以根据需求实现自己的任意维度的下标访问功能。
 例如，将MyArray改造成一个二维数组，并为其添加二维下标访问的功能，示例代码如下：
 
 */


//为自定义的数据类型赋予下标访问的功能。
class MyArray {
    //向数组中嵌套数组 实现二维数组
    var array:Array<Array<Int>>
    init(param:Array<Int>...){
        array = param
    }
    //subscript是Swift语言中用于定义下标功能的方法
    subscript(index1:Int,index2:Int)->Int{
        set{
            //默认外界设置的值会以newValue为名称传入 开发者也可以进行自定义
            array[index1][index2] = newValue
        }
        get{
            var tmp = array[index1]
            return tmp[index2]
        }
    }
}
var myArray = MyArray(param: [1,2,3],[3,4,5],[4,5,6],[6,7,8],[7,8,9])
//通过下标进行访问
//访问结构中第2个数组中的第3个元素 返回5
myArray[1,2]
//设置第5个数组中的第3个元素的值
myArray[4,2] = 0

/*
 
 1.下标方法subscript中也可以只实现get代码，此时只可以通过下标来进行读取操作，不可以使用下标进行设置操作。
 
 2.下标方法subscript中参数的个数和类型开发者都可以根据需求自由定义，返回值的类型也可以自由定义，但要注意，下标的参数不可以设置默认值，也不可以设置为inout类型。
 
 
 
 */
