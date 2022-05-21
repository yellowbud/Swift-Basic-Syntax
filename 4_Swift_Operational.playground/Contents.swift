import UIKit


/*运算由表达式表示，而量值和运算符共同构成了表达式。Swift语言还支持对运算符进行重载与自定义操作，可以根据自己的需要为系统的运算符提供新的运算方法，甚至自定义自己的运算符。

 程序存在的意义就是帮助人们实现解题思路和进行重复性的计算，然而任何复杂问题的解决过程都不是从上到下线性完成的，对程序流程的控制能力是编程语言强大的关键所在。

 运算符的作用在于将量值或者表达式结合在一起进行计算。swift语言中的运算符按照其操作数的个数可以分为3类，分别为：
 
 一元运算符：
 一元运算符作用于一个操作数，其可以出现在操作数的前面，例如正负运算符“+”“-”，逻辑非运算符“！”
 
 二元运算符：
 二元运算符作用于两个操作数之间，例如加减运算符“+”“-”等
 
 三元运算符：
 三元运算符作用于三个操作数之间，经典的三元运算符有问号、冒号运算符，其可以方便地实现简单的判断选择结构。
 
*/
//字符串赋值
var str = "Hello, playground"
//整型赋值
var count = 5
//元组赋值
var group = (1,2,"12")

//如果要将一个元组中的值依次赋给指定的量值，swift中还支持使用解构赋值的语法来进行赋值，示例如下：
// 进行解构赋值
var (n1, n2, n3) = (1, 2, 3)
print(n1, n2 ,n3) // 1, 2, 3
//赋值运算符用于值的传递，其结果是量值被赋了具体的值。相等运算符则用于比较操作，其会返回一个Bool类型的逻辑值。




//Bool赋值
var bol = true
//相加运算
1+2
//相减运算
2-1
//相乘运算
2*2
//相除运算
4/2
//取余运算 取余运算符必须在整数间进行运算时使用。
4%3

//除了上面提到的运算符外，正负运算符和数学中的正负号作用类似，负运算符会改变数据的正负性，正运算符会保持数据的正负性。示例如下：
var a = 1
var b = -2
+b //-2
-a //-1
var value1 = 10%3 //余数1
var value2 = -10%3 //余数-1


//将赋值运算符与基本算术运算符结合使用可以组合成复合赋值运算符，复合赋值运算符可以在一个表达式中完成一项基本运算与赋值的复合操作，示例如下：
var tmp=1
//加赋值复合运算
tmp+=3  //tmp = tmp +3
//减赋值复合运算
tmp-=3  //tmp = tmp -3
//乘赋值复合运算
tmp*=3  //tmp = tmp *3
//除赋值复合运算
tmp/=3  //tmp = tmp /3
//取余赋值复合运算
tmp%=3  //tmp = tmp %3



//4.1.3基本逻辑运算符
/*
 
 基本算术运算符进行数学上的算术操作，基本逻辑运算符进行逻辑运算操作。可以简单理解为，逻辑运算就是生活中所定义的真与假。系统定义的基本逻辑运算符会返回一个Bool类型的逻辑
 值，因此，基本逻辑运算行组成的逻辑表达式在if判断语句中经常会用到。
 
 swift中支持的基本逻辑运算符有：逻辑与运算符 “&&” 逻辑或运算符“||” 逻辑非运算符“!”三种，逻辑运算只在逻辑值（Bool类型值）之间进行，与、或、非三种运算中前两者为二
 元运算符，需要有两个Bool类型的操作数，非运算符为一元运算符，需要有一个Bool类型的操作数。这三种运算符有如下特点：
 
 与：两个操作数都为真，结果才为真，有一个操作数为假，则结果为假。
 或：两个操作数有一个为真，则结果为真，两个操作数都为假，则结果为假。
 非：操作数为真，则结果为假，操作数为假，则结果为真。

 Swift 语言中逻辑运算的操作数必须为严格的 Bool 类型
 
 */
var p1 = true
var p2 = false
//与运算 false
p1&&p2
//或运算 true
p1||p2
//非运算 false
!p1


//比较运算符用于两个操作数之间的比较运算，其会返回一个Bool类型的逻辑值。基本的比较运算符如下：
1==2 //等于比较         返回false
1<2  //小于比较         返回true
1>2  //大于比较         返回false
1 != 2 //不等于比较     返回true
1<=2  //小于等于比较    返回true
1>=2  //大于等于比较    返回false

//对于元组的比较操作需要注意：首先要比较的元组中的元素个数和对应位置的元素类型必须相同，其次元组中每一个元素必须支持比较运算操作，示例代码如下：
var tp1 = (3,4,"5")
var tp2 = (2,6,"9")
var tp3 = ("1",4,5)
tp1<tp2             //将返回false
/*上面的代码中，元组实例p1与元组实例p2中的元素个数和对应类型相同，且所有元素都支持比较运算操作，所以可以进行比较运算。
 
 tp1 与 tp3 虽然元素个数相同，但是tp1的第1个元素为整型，tp3的第一个元素为字符串，类型不同，所以不能进行比较运算。
 
 swift在进行元组间的笔记运算时，遵循原则：从第1个元素开始比较，如果比较出了结果，则不再进行后面元素的比较运算，直接返回结果Bool值，如果没有比较出结果，那么继续依次比较后面的元素，直到比较出结果为止。
 
*/

/*条件运算符
 
 条件运算符是一种三元运算符，其可以简便实现代码中的条件选择逻辑。如下代码为一个简单的条件选择语句示例：
 
 */

var m = 3
var n = 6
if m>n {
    print("m>n")
}else{
    print("m<=n")
}

//如果使用条件运算符，上面的逻辑可以简写成如下：
print(m>n ? "m>n":"m<=n")//：条件?true时执行的代码：false时执行的代码。
/*
 首先条件运算符需要有3个操作数，其中第1个操作数必须为一个条件语句或者一个Bool类型的值，第2个和第3个操作数可
 以是任意类型的值或者一个有确定值的表达式，3个操作数由问号“？”和冒号“：”进行分割，

 */





//swift语言中的空合并运算符也是专门为Optional值类型所设计的。
/* var q:Int? = 8
   var value:Int
   if q != nil {
        value = q!
 }else{
     value = 0
 }
 上面的示例就是一个简单的if-else的选择结构，利用条件运算符可以将代码简写如下：
 var q:Int? = 8
 var value:Int
 value = (q != nil) ? (q!) : 0
 
 使用条件运算符改写后的代码简单很多，swift语言中还提供了空合并运算符来更加简洁地处
 理这种Optional类型值的条件选择结构，空合并运算符由 ？？表示，上面的代码可以改写成如下形式：
*/


//空合并运算符
var q:Int? = 8
var value:Int
value = q ?? 0

//空合并运算符 ？？ 是一个二元运算符，使用空合并运算符改写后的代码更加简洁。其需要两个操作数，第一个操作数必须为一个Optional值，如果此Optional值不为nil，则将其进行拆包操作，并作为空合并运算的运算结果。如果此Optional值为nil，则会将第二个操作数作为空合并操作运算的结果返回。


//区间运算符
//除了支持Range结构体来描述范围外，还提供了一个区间运算符来快捷直观地表示范国区间。示例如下：

//创建范围 >=0 且<=10 的闭区间
var range1 = 0...10
//创建范围>=0 且<10 的半开区间
var range2 = 0..<10

//a...b为闭区间写法
for index in 0...3 {
    print(index)
}
//a..<b为左闭右开区间
for index in 0..<3 {
    print(index)
}

//数字是否包含在某个范围中
if range1 ~= 8 {
    print("range1包含8")
}

// print(range1~=8) 输出 true

//区间运算行常见于for-in循环结构中，常常会使用区间运算符定义循环次数，示例如下：

//a...b为闭区间写法
for index in 0...3 {
    print(index)
}

//a..<b为左闭右开区间
for index in 0..<3 {
    print(index)
}

//在for-in循环结构中，如果 in 关键字后面是一个集合，则变量index会自动获取集合中的元素；如果in关键字后面是一个范围，则 index 获取到的是从左向右依次遍历到的范围索引数。





//章节练习
/*
 1.	将下列描述翻译成Swift表达式。
 小李买了5支铅笔、1块橡皮、3本作业本和11个书签。每支铅笔2元，每块橡皮3元，每本作业本2.5元，每个书签0.5元，计算小李所花多少钱。
 */
//共26元
var tip =  11 * 0.5
var book = 3 * 2.5
var sum = 5 * 2 + 1 * 3 + tip + book
/*
 2.设计一个表达式来生成1~7之间的一个随机数。
 */
//random()为Swift标准函数库中的随机数生成函数
//swift3.0中删除了random()函数 使用arc4random()
var rand = arc4random()%7+1


/*
 3.语数外3门科目进行测试，当3门科目的成绩都大于60且总分不小于200分时，成绩才为合格，使用Swift表达式来描述上述逻辑。
 */
var Language=60
var Math=65
var English=70
if Language>60 && Math>60 && English>60 && (Language+Math+English)>200 {
    print("合格")
}
/*
 4.编写闰年判断的表达式。
	闰年：1.能够被400整除。
         2.能过被4整除但是不能够被100整除。
 */
var year = 2016
if year%400==0 || ((year%4==0) && (year%100 != 0)) {
    print("闰年")
}
/*
 5.学校乒乓球比赛需要每班出一名主选手和一名辅助选手参赛，比赛分为上下两场，上半场主选手得分超过30，则下半场需要辅助选手进行，否则下半场依然由主选手进行，使用条件运算符描述下半场比赛出赛的选手。
 */
var mark = 40
var people = mark>30 ? "主选手" : "辅助选手"

/*
 6.打印如下图案：
 **********
 *????????*
 *????????*
 **********
 */
//有四行图案
for indexH in 1...4 {
    //每行有10列符号
    print("")
    for indexV in 1...10 {
        //第一行和最后一行为纯*
        if indexH==1 || indexH==4 {
            print("*", separator: "", terminator: "")
        }else{
            //第一列和最后一列为*
            if indexV==1 || indexV==10 {
                print("*", separator: "", terminator: "")
            }else{
                //其余为?
                print("?",separator: "",terminator: "")
            }
        }
    }
}


