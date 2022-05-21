import UIKit
//--------函数与闭包技术-----//
/*在编程中，函数的实质是完成特定功能的代码块，只是此代码块有一个名称，开发者可以通过函数名来调用函数完成特定的需求和功能。

在swift语言中，每个函数都有特定的类型，函数的类型取决于参数和返回值。另外，在swift语言中函数可以进行嵌套。

闭包的功能与函数类似，其也是有一定功能的代码块。闭包与函数有着密不可分的关系：函数是有名称的功能代码块，闭包在大多数情况下是没有名称的功能代码块，在语法结构上，闭包与函数有着很大的差异。
 
 声明函数时也有3要素：
 参数、返回值和函数名。
 参数和返回值决定函数的类型，参数数量和类型完全相同，同时返回值类型也相同的函数则为同类型函数
 
函数名后的 小括号中需要设置函数的参数类型和个数 ->连接返回值类型
 
 如果没有返回值，也可以将参数列表后面的部分省路。
 
 
*/
//编写一个函数，功能为传入一个数字判断其是否大于10，将结果返回
func isMoreThanTen(count:Int)->Bool {
    if count>10 {
        return true
    }else{
        return false
    }
}
//进行函数的调用 将返回false
isMoreThanTen(count: 9)
//将返回true
isMoreThanTen(count: 11)

//参数列表中的参数需要指定参数名和参数类型，也可以编写无参的函数，为空即可

//编写无参的函数
func myFunc1()->String{
    return "无参函数"
}
//将返回字符串"无参函数"
myFunc1()

//如果函数不需要返回值，可以选择返回Void或者直接省略返回值部分

//编写无参无返回值的函数
func myFunc2() -> Void {
    print("无参无返回值")
}
func myFunc3() {
    print("省略返回值")
}
myFunc2()
myFunc3()

//原则上函数的返回值只能有一个，在实际开发中，如果需要返回多个值，通常会采用复合类型来处理。可以用元组来达到这样的效果，模拟一个数据查询的函数，这个函数将通过传入一个数据ID来进行数据查询操作，并返回查询状态和具体的数据

//模拟数据查询函数
func searchData(dataID:String)->(succsee:Bool,data:String){
    //模拟一个查询结果和数据实体
    let result = true
    let data = "数据实体"
    return (result,data)
}
if searchData(dataID: "1101").succsee {
    //查询成功
    print(searchData(dataID: "1101").data)
}

//可以通过返回Optional类型值来标识函数的执行是否成功，在调用函数时使用if-let结构进行安全性检查

//返回Optional类型值的函数
func myFunc4(param:Int)->Int?{
    guard param>100 else{
        return nil
    }
    return param-100
}
//swift3.0
if let tmp = myFunc4(param: 101) {
    print(tmp)
}


//内部命名在函数实现时使用，外部命名在函数调用时使用。 开发者若不设置参数的外部命名，则默认函数参数的外部命名与内部命名相同。因此开发者在调用函数时，传入的参数前面都有一个参数名标注。

//多参数函数 默认内部命名与外部命名相同
func myFunc5(param1: Int,param2: Int,param3: Int) {
    //这里使用的param1，param2，param3是参数的内部命名
    param1+param2+param3
}
//调用函数的参数列表中使用的param2和param3为外部命名
myFunc5(param1: 1, param2: 2, param3: 3)



//在声明函数时，也可以在内部命名的前面再添加一个名称作为参数的外部命名

//为函数的参数添加外部命名
func myFunc6(out1 param1: Int,out2 param2: Int,out3 param3: Int) {
    //这里使用的param1，param2，param3是参数的内部命名
    param1+param2+param3
}
//调用函数时，参数将被外部命名标识 这里的out1，out2，out3为函数参数的外部命名
myFunc6(out1: 1, out2: 2, out3: 3)

//参数的外部名称会在调用函数时标识参数，这样既简化了函数名，又能很好地帮助开发者理解每个参数的意义，并且这种语法的优势在进行函数重载操作时会更大。



//可以使用匿名变量标识符 _ 对外部名称进行省略

//省略外部名称的函数参数列表
func myFunc7(_ param1:Int,_ param2:Int , _ param3:Int){
    param1+param2+param3
}
//在调用函数时 不再标识参数名称
myFunc7(1, 2, 3)

//---------函数中参数的默认值、不定数量参数与 inout 类型参数---------//

//每个参数都必须要传值，这向话其实并不十分准确，应该说每个参数都必须有值。除了在调用时为参数传值外，swift语言中函数的参数也支持设置默认值。如果函数的某个参数设置了默认值，那么开发者在调用函数的时候，可以传此参数的值，也可以不传此参数的值，但是参数的位置要严格对应。示例如下：

//默认参数param2的值为10，param3的值为5
func myFunc8(param1:Int,param2:Int = 10 ,param3:Int = 5)  {
    param1+param2+param3
}
//对每个参数都进行传值
myFunc8(param1: 1, param2: 1, param3: 1)

//只对没有设置默认值的参数传值
myFunc8(param1: 10)
func myFunc9(param1:Int,param2:Int=10 ,param3:Int)  {
    param1+param2+param3
}

//对应的参数位置要一致
myFunc9(param1: 10,param3:10)


//需要编写参数个数不定的函数，例如打印函数print（），其中传入参数的数量就是不确定的。

//编写参数数量不定的函数。编写一个函数，传入不定个数的整数值，打印其相加后的结果
func myFunc10(param:Int...){
    var sum=0;
    for count in param {
        sum+=count
    }
    print(sum)
}
//传递参数的个数可以任意
//swift3.0
myFunc10(param: 1,2,3,4,5)
myFunc10(param: 12,2,3)

//在swift语言中，在某个参数类型的后面追加符号 ... 则会将此参数设置为数量可变。再函数内部，传递的值会被包装成一个集合类型赋值给对应参数。需要注意，传递的参数类型必须相同，并且可以传递多组数量可变的参数，不同参数之间参数类型可以不同，示例如下：

func myFunc11(param1:Int...,param2:String)  {
    var sum=0;
    for count in param1 {
        sum+=count
    }
    print("\(param2):\(sum)")
}
//swift3.0
myFunc11(param1: 1,2,3, param2: "hello")

/*关于swift语言的参数传递，还有这样一个特点：传递的如果是值类型的参数，那么参数值在传递进函数内部时会将原值复制为一份常量，且在函数内不可以修改。类属于引用类型，而基本数据类型、枚举和结构体都属于值类型。
在函数内部修改参数变量的值，编译器会直接报错，示例代码如下：
 
 错误示范
 
 func myFunc12(param:Int) {
      param+=1
 }
 
*/

//如果在开发中真的需要在函数内部修改传递参数的变量的值，可以将此参数声明为inout类型，示例如下：
func myFunc12( param:inout Int){
    param+=1
}

var para = 10;
//swift3.0
myFunc12(param: &para) //11
print(para)

//上面的演示代码中将参数param声明为inout类型，在传参时需要使用“＆”符号，这个符号将传递参数变量的内存地址。


//-------函数的类型与函数嵌套--------//

/*
 
 swift语言中每一个函数都有其特定的类型。因此，也可以像声明普通变量那样来声明一个函数变量，同样也可以对此变量进行赋值、调用等操作。
 
 将函数作为数据类型这种语言设计思路有强大的优势，这将允许开发者将一个函数作为另一个函数的参数或者返回值。
 
 函数变量的声明及赋值示例代码如下：
 */


//声明一个函数变量
var addFunc:(Int,Int)->Int

/*
 对函数变量进行赋值
 addFunc = {(param1: Int,param2:Int) in return param1+param2}
 
 调用函数变量
 addFunc（2，3）
 
 函数变量的类型由参数和返回值决定，参数和返回值相同的函数类型就相同。上面的示例代码中对函数变量的赋值采用了闭包的方式，闭包实质上是一段有具体功能的代码块，其结构为{(param1,param2,...)in 代码块}，其最外面曲大括号包围，內部小括号为参数列表，in为闭包关键字
 
 也可以通过一个函数来对函数变量进行赋值，示例如下：
 
 var addFunc:(Int,Int) -> Int
 func myFunc13(param1:Int,param2:Int) -> Int {
    return param2+param1
 }
 addFunc = myFunc13
 addFunc(1,2)
 
 函数也可以作为另一个函数的参数,示例代码如下:
 参数 param 的类型为函数类型（Int, Int)->Int
 func myFunc14(param:(Int,Int)->Int) {
    print（param(1,2)）
 }
 //将 addFunc 函数作为参数传递进myFunc14 函数
 myFunc14(param: addFunc)
 
 这种将函数作为参数的编程方式应用十分广泛.在处理一些回调操作时，例如网络回调、 子线程异步处理回调等场景中
 
 函数可以作为参数，也可以作为返回值来使用，示例如下
 
 声明一个函数变量
 var addFunc：（Int，Int）->Int
 */
func myFunc15() -> (Int,Int)->Int {
    return {(param1:Int,param2:Int)in
        return param1+param2
    }
}
//上面的演示代码中，在函数内部建了闭包并将其返回，由于swift语言支持进行函数嵌套，因此开发者也可以在函数内部再次创建函数，示例如下：

func myFunc16() -> (Int,Int)->Int {
    func subFunc(param1:Int,param2:Int)->Int{
        return param1+param2
    }
    return subFunc
}

//使用addFunc变量获取返回值
addFunc = myFunc15()
//进行调用
addFunc(1,2)
func myFunc13(param1:Int,param2:Int) -> Int {
    return param2+param1
}
addFunc = myFunc13
addFunc(1,2)
//对函数变量进行赋值
addFunc = {
            (param1:Int,param2:Int) in
                return param1+param2
                                    }
//调用函数变量
addFunc(2,3)
//参数param的类型为函数类型(Int,Int)->Int
func myFunc14(param:(Int,Int)->Int) {
    print(param(1,2))
}
//将addFunc函数作为参数传递进myFunc14函数
myFunc14(param: addFunc)

//函数也有其作用域，所谓嵌套函数是指在函数内部再创建一个子函数，子函数只能在父函数内部调用，不可以在父函数外部调用，但是可以作为返回值传递到父函数外部。


//章节练习
/*
 1.编写一个计算阶乘的函数。
 */
func funcOne(param:Int) -> Int {
    guard param>0 else{
        return 0
    }
    var tmp = param
    var result = 1
    while tmp>0 {
        result *= tmp
        tmp -= 1
    }
    return result
}
//swift3.0
funcOne(param: 5)



/*
 2.编写函数，函数功能是：判断输入的字符是否为数字字符。如果是，则输出true，否则输出false。
 */
func funcTwo(param:Character) -> Bool {
    if param <= "9" && param >= "0" {
        return true
    }else{
        return false
    }
}
//swift3.0
funcTwo(param: "9")



/*
 3.编写函数，函数功能是：将两个两位数的正整数a、b合并成一个整数c，合并规则是将a的十位和个位分别放在c的千位和个位，将b的十位和个位分别放在c的百位和十位。
 */
func funcThree(param1:Int,param2:Int) -> Int {
    //param1的个位数字
    let tmpa1 = param1%10
    //param1的十位数字
    let tmpa2 = param1/10%10
    //param2的个位数字
    let tmpb1 = param2%10
    //param2的十位数字
    let tmpb2 = param2/10%10
    return tmpa2*1000+tmpb2*100+tmpb1*10+tmpa1
}
funcThree(param1: 45, param2: 12)



/*
 4.编写函数，将字符串中的大写字母变成对应的小写字母，小写字母变成对应的大写字母，其它字符不变。
 */
func funcFour(param:String) -> String {
    var str = ""
    for char in param {
        if char >= "a" && char <= "z" {
            //swift3.0
            str.append(String(char).uppercased())
        }else if char >= "A" && char <= "Z" {
             str.append(String(char).lowercased())
        }else{
            str.append(char)
        }
    }
    return str
}
//swift3.0
funcFour(param: "How Are You?")


/*
 5.编写函数，输入一个大于0的数字，将不大于这个数字的所有正奇数的和与正偶数的和以元组的形式返回。
 */
func funcFive(param:Int) -> (Int,Int) {
    guard param>0 else {
        return (0,0)
    }
    //奇数和
    var sum1 = 0
    //偶数和
    var sum2 = 0
    var tmp = param
    while tmp>0 {
        if tmp%2==0 {
            sum2+=tmp
        }else{
            sum1+=tmp
        }
        tmp-=1
    }
    return (sum1,sum2)
}
//swift3.0
funcFive(param: 10)


/*
 6.编写函数，输入不定个数的一组整数值，统计其中整数和负数的个数，0不纳入统计。
 */
func funcSix(param:Int...) -> (Int,Int) {
    //正数个数
    var sum1 = 0
    //负数个数
    var sum2 = 0
    for index in param {
        if index>0 {
            sum1 += 1
        }else if index<0 {
            sum2 += 1
        }
    }
    return (sum1,sum2)
}
//swift3.0
funcSix(param: 1,2,-1,-4,2,3,5,2,-12)


