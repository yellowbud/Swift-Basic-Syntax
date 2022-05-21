import UIKit
//swift语言主要提供了for-in遍历、while与repeat-while条件循环3种循环结构。

//for-in结构则强大很多，其可以进行无序的循环遍历，也可以进行有序的循环遍历。

//for-in结构进行有序的循环遍历，需要配合区间运算符，并且指定一个循环次数变量

//将打印1，2，3，4，5
for index in 1...5 {
    print(index)
}
//for-in结构中需要两个参数，第2个参数可以是一个集合类型的实例，也可以是一个范围区间，第1个参数为捕获参数，每次从第2个参数中遍历出的元素便会赋值给它，开发者在循环结构中可以直接使用。

//在进行for-in循环遍历的时候，开发者并不需要捕获到遍历出的值，可以使用匿名参数來接收，“_”符号来表示磨名参数，示例如下：

/*如果不需要获取循环中的循环次序，可以使用如下方式
var sum = 0
 for _ in 1...3 {
    sum += 1
 }
*/


//如果不需要获取循环中每次的循环次数 可以使用如下方式
var sum=0;
for _ in 1...3 {
    sum += 1
}

//遍历集合类型
var collection1:Array = [1,2,3,4]
var collection2:Dictionary = [1:1,2:2,3:4,4:4]
var collection3:Set = [1,2,3,4]
for obj in collection1 {
    print(obj)
}
for (key , value) in collection2 {
    print(key,value)
}
for obj in collection3 {
    print(obj)
}



//while与repeat-while条件循环结构


/*经常有条件循环的需求，例如模拟水池蓄水的过程，每次蓄水1/10，当蓄满水后停止蓄水。while循环结构可以十分方便地创建这类循环代码，示例如下：
 var i = 0
 //当i不小于10时跳出循环
 while i < 10{
    print("while",i)
    //进行i的自增加
    i+=1
 }
 
 在while循环结构中，while关键字后面需要填写一个逻辑值或者以逻辑值为结果的表达式作为
 循环条件，如果逻辑值为真，则程序会进入while循环体。执行完循环体的代码后进行循环条件的
 判断，如果循环条件依然为真，则会再次进入循环体，否则循环结束。由于while循环是根据循环条件来判断是否进入循环体的，如果循环条件一直成立，则会无限循环，因此在使用while
 循环的时候，注意要在循环体中对循环条件进行修改，且修改的结果是循环条件不成立，否则会出现死循环。
 
 
 while结构会先进行条件判断，再进行循环体的执行。repeat- while结构则会先执行
 一次循环体，再进行循环条件的判断
 */


//repeat-while循环结构示例代码如下：
var j=0
//先进行一次循环体 再判断循环条件是否成立
repeat {
    print("repeat while")
    j+=1
} while j<10


//在开发中有两种重要的流程结构，即循环结构与分支结构，循环结构用于处理大量的重复操作，分支结构则用于处理由条件差异而产生的代码分支路径。swift语言中提供的分支结构有if结构、if-else结构与switch-case结构。



var c = 10
//进行if条件判断
if c<10 {
    print(c)
}
//进行if-else组合
if c>10 {
    c-=10
    print(c)
}else{
    print(c)
}
//进行if-else多分支组合
if c>0&&c<10 {
    print(c)
}else if c<=0 {
    c = -c
    print(c)
}else if c<=10&&c<20{
    c-=10
    print(c)
}else{
    print("bigger")
}
/*
 1 if关键字后面跟的条件必须为严格意义上的逻辑值或者结果为逻辑值的表达式
 
 2.)if-else组合结构每个分支是互斥的，只能有一个分支的代码被执行，条件的判断顺序会
 从上到下进行，直到找到一个判断条件为真的分支或者最后一个else语句。同时，开发者
 也可以不加单独的 else 语句，这种情况下，如果没有条件成立的分支，则任何分支都不会被执行，程序会继续向后执行。
 
 
 */

// switch-case 多分支选择结构
/*switch语句也被称为开关选择语句，它通过匹配的方式来选择要执行的代码块。swift语言中的
 switch语句可以进行任意数据类型的匹配，并且case子句的语法和扩展都更加灵活。使用switch结构
 进行字符分支匹配的示例如下：
 
 */
var charac:Character = "b"
//使用switch语句进行字符分支判断
switch charac {
case "a":
    print("chara is a")
case "b":
    print("chara is b")
case "c":
    print("chara is c")
default ://default用于处理其他额外情况
    print("no charac")
}
/*
 如以上代码所示，switch关键字后面需要填写要进行分支匹配的元素，在switch结构中通过子句case的列举进行元素值的匹配，匹配成功后，会执行相应case子句中的代码，如以上代码将打印字符串 “charg is b”
 
default为 switch 语句中的默认匹配语句，即如果前面所有的case子句都没有匹配成功，则会执行default中的代码，开发者地可以将default子句省略，这时如果所有case子句都没
 有匹配上，则会跳过switch结构，直接执行后面的代码。
 
 —个case语句匹配成功后，会自动跳出switch结构，如果不进行特殊处理，switch结构中的分支只会被执行一个或者一个也不执行。
 
 Switch-case结构也支持开发者在一个case子句中编写多个匹配条件，程序在执行到这个case子句时，只要有一个条件匹配成功，就会执行此case下的代码，示例如下：
 
 */

//同一个case中可以包含多个分支
switch charac {
case "a","b","c" :
    print("chara is word")
case "1","2","3" :
    print("chara is num")
default :
    print("no charac")
}

//case子句的匹配条件也可以是一个区间范围，当要匹配的参数在这个区间范围内时，就会执行此case下的代码

//在case中也可以使用一个范围
var num = 3
switch num {
case 1...3 :
    print("1<=num<=3")
case 4 :
    print("chara is num")
default :
    print("no charac")
}


/*
 对于元组类型参数的匹配，case子句可以进行选择匹配和优化匹配，示例如下：
 
 //使用switch语句进行元组的匹配
 var tuple = (0,0)
 switch tuple {
    //进行完全匹配
 case (0,1):
    print("Sure")
    //进行选择性匹配
 case （ _，1）:
    print("Sim")
    //进行元组元素的范围匹配
 case（0...3,0...3）:
    print("SIM")
 default:
    print("")
 }
 
 如以上代码所示，在进行元组的匹配时，有3种方式可以选择：
 
 第1种方式是完全匹配，即元组中所有元素都必须完全相等，才算匹配成功
 
 第2种方式是选择匹配，即开发者只需要指定元组中的一些元素进行匹配，不需要关心的元素可以使用匿名参数标识符来代替，这种方式下，只要指定的参数都相等，就算匹配成功
 
 第3种方式是范围匹配，即相应位置指定的范围包含需匹配元组相应位置的值，就算匹配成功。
 
 其中 第2种匹配方式可以和第3种匹配方式组合使用。
 
 case子句中还可以捕获switch元组的参数，在相应的case代码块中可以直接使用捕获到的参数，这在开发中可以简化所编写的代码，示例如下：
 
 var tuple = (0,0)
  //进行数据绑定
 switch tuple {
    //对元组中的第一个元素进行捕获
 case (let a,1):
    print(a)
 case (let b,0):
    print(b)
    //捕获元组中的两个元素，let (a,b)与(let a, let b)意义相同
    case let(a,b):
    print(a,b)
 default:
    print("")
 }
 
 这里读者需要注意，要捕获的元素并不能起到匹配的作用，例如元组tuple中有两个元素，如果case条件为(let a,1)，则在进行匹配时会匹配tuple中第2个参数，如果匹配成功，则会将的tuple元组
 的第1个参数的值传递给a常量，并且执行此case中的代码块，在这个代码块中，开发者可以直接使
 用常量a。
 因此，要捕获的元素在匹配时实际上充当着匿名标识符的作用，如以上代码中的第3个case
 子句，其条件为let(a,6)，实际上这个条件始终会被匹配成功。并且，如果开发者对元组中的所有元
 素都迸行了捕获，在代码表现上，可以写作(let a,let b)，也可以直接捕获整个元组，写作let(a,b)，这两种方式只是写法上有差异，在使用时并无差别。
 
*/


//使用Switch语句进行元组的匹配
var tuple = (0,0)
//进行数据绑定
switch tuple {
    //对元组中的第一个元素进行捕获
case (let a,1):
    print(a)
case (let b,0):
    print(b)
    //捕获元组中的两个元素 let(a,b) 与 (let a,let b)意义相同
case let(a,b):
    print(a,b)
default:
    print("")
}

switch tuple {
//进行完全匹配
case (0,1):
    print("Sure")
//进行选择性匹配
case (_,1):
    print("Sim")
//进行元组元素的范围匹配
case(0...3,0...3):
    print("SIM")
default:
    print("")
}

/*
 switch-case结构的参数捕获语法在使用起来为开发者带来了不少的便利。然而其也有一个问
 题，它将所有要捕获的元素都作为匿名参数来进行匹配，有时候并不是开发者想要的结果。例如上
 面的tuple元组，开发者需要捕获元组中的第1个元素，同时又需要与第1个元素相关的条件成立时再使case子句匹配成功，针对这种情况，swift中也提供了相应的办法来处理，可通过在case语句中追加where条件的方式来实现上述需求，示例如下：
 
 */
//对于进行了数据捕获的Switch-case结构 可以使用where关键字来进行条件判断
switch tuple {
case (let a,1):
    print(a)
    //当元组中的两个元素都等于0时才匹配成功，并且捕获第一个元素的值
case (let b,0) where b==0:
    print(b)
//当元组中的两个元素相同时 才会进入下面的case
case let(a,b) where a==b:
    print(a,b)
default:
    print("")
}

//swift中提供的流程跳转语向主要有continue、 break.falthrough. return、 tbrow、guard
//continue语句用于循环结构中，其作用是跳过本次循环，直接开始下次循环。这里需要注意，continue的作用并不是跳出循环结构，而是跳过本次循环，直接执行下一个循环周期，示例如下：
for index in 0...9 {
    if  index == 6 {
        continue
    }
    print("第\(index)次循环")
}
/*
 上面的示例代码将跳过index等于6时的代码块，在打印信息中会缺少index等于6时的打印输
 出。需要注意的是，continue语句默认的操作范围直接包含它的这一层循环结构，如果代码中嵌套
 了多层循环结构，coninue语向会跳过本次循环。那么，如果想要实现不跳过本次循环，而是直接
 跳至开发者指定的那一层循环结构，该如何写呢？示例如下：
 */

MyLabel:for indexI in 0...2 {
    for indexJ in 0...2 {
        if indexI == 1 {
            continue MyLabel
        }
        print("第\(indexI)\(indexJ)次循环")
    }
}
/*
 以上代码创建了两层循环结构，在内层循环中使用了continue语句进行跳转，MyLabel是外层
 循环的标签，因此这里的continue跳转将会跳出indexI等于1时的外层循环，直接开始indexI等于2的循环操作。
 
 break语句是中断语句，其也可以用于循环结构中，和continue语句不同的是，break语句会直接
 中断直接包含它的循环结构，即当循环结构为一层时，如果循环并没有执行完成，则后面所有的循
 环都将被跳过。如果有多层循环结构，程序会直接中断直接包含它的循环结构，继续执行该循环结
 构外层的循环结构，示例如下：
 */

for index in 0...9 {
    if  index == 6 {
        break
        
    }
    print("第\(index)次循环")
}
/*
 上面的代码在index等于6时使用 了break语句进行中断，第5次循环后的所有打印信息都将被
 跳过。break语句默认将中断直接包含它的循环结构，同样也可以使用指定标签的方式来中断指定
 的循环结构，示例如下：
 */

MyLabel:for indexI in 0...2 {
    for indexJ in 0...2 {
        if indexI == 1 {
            break MyLabel
        }
        print("第\(indexI)\(indexJ)次循环")
    }
}

/*
 break语句也可以用于switch结构中。在switch结构中，break语句将直接中断后面所有的匹配过
 程，直接跳出switch结构。在swift语言中，switch-case选择匹配结构默认就是break操作，故开发者
 不必手动添加break代码。
 
 fallthrough语句是swift语言特有的一种流程控制语句，前面提到过，当swift语言中的switch-case
 结构匹配到一个case后，会自动中断后面所有case的匹配操作，如果在实际开发中需要switch-case
 结构不自动进行中断操作，可以使用falthrough语句，示例如下：
 */
// var tuple = （0，0）
switch tuple {
case (0,0):
    print("Sure")
    //fallthrough会继续执行下面的case
    fallthrough
case (_,0):
    print("Sim")
    fallthrough
case(0...3,0...3):
    print("SIM")
default:
    print("")
}

/*以上示例代码将会打印Sure、 Sim和SIM
return语句在函数中用于返回结果值，也可以用于提前结束无返回值类型的函数。return语句的应用场景不只局限于函数中，在闭包中也可以使用return进行返回。示例如下：
*/
//有返回值函数的返回
func myFunc()->Int{
    return 0
}
//无返回值函数的返回
func myFunc(){
    return
}

/*throw语句用于异常的抛出，throw语句抛出的异常如果不进行捕获处理，也会使程序中断。
 swift语言中有抛出异常和处理异常的代码结构，在后面的章节中会详细介绍，这里只做简单演
 示。在函数中拋出异常的示例代码如下：
 */
//定义异常类型
enum MyError:Error {
    case errorOne
    case errorTwo
}
func  newFunc() throws{
    //抛出异常
    throw MyError.errorOne
}

/*
 当参数符合某个条件时，函数才能正常执行，否则直接通过return来终止函数的执行，如果不使用guard-else结构，示例代码如下：
 */

func myFuncTwo(param:Int)  {
    guard param>0 else {
        return
    }
    print("其他操作")
}
//上面的代码结构在逻辑上并不那么优美，开发者的原意是当param參数大于0时才执行函数中的操作，在2.0之前却使用了相反的逻辑来中断函数，当然，开发者也可以将函数实现如下：
/*func myFuncTwo(param:Int) {
    if param >0 {
        print("其他操作")
    }
 }
 经过修改后，代码逻辑清晰了许多，然而还是有一些问题，如果这个函数中需要做的操作很多，那么所有条件判断的代码都将写在if语句块中，代码结构就显得杂乱无章，guard-else语句就是为了优化这种情況而产生的。guard-else 语句也被称为守护语句，顾名思义，其作用就是确保某个条件成立才允许其后的代码执行，示例如下：
 func myFunTwo(param:Int) {
    guard param > 0 else {
        return
    }
    print（“其他操作”）
 }
 
*/

/*
 1．打印出所有的“水仙花数”，所谓“水仙花数”是指一个三位数，其各位数字立方和等于该数本身。
 */
for item in 100...999 {
    //获取各位数字
    let dig = item%10
    //获取十位数字
    let tens = item/10%10
    //获取百位数字
    let hundred = item/100
    //获取结果
    let sum = dig*dig*dig + tens*tens*tens + hundred*hundred*hundred
    if sum == item {
        print(item)
    }
}
/*
 2.猴子吃桃问题：猴子第一天摘下若干个桃子，当即吃了一半，还不过瘾，又多吃了一个，第二天早上又将剩下的桃子吃掉一半，又多吃了一个。以后每天早上都吃了前一天剩下的一半零一个。到第10天早上想再吃时，见只剩下一个桃子了。求第一天共摘了多少。
 */
var count = 1;
for _ in 1...9 {
    count = (count+1)*2
}
print(count)
/*
 3.两个乒乓球队进行比赛，各出三人。甲队为p1,p2,p3三人，乙队为q1,q2,q3三人。已抽签决定比赛名单。有人向队员打听比赛的名单。p1说他不和q1比，p3说他不和q1,q3比，请编程序找出三队赛手的名单。
 */
//标识甲队
var p1 = 1
var p2 = 2
var p3 = 3
//标识乙队
var q1 = 0
var q2 = 0
var q3 = 0
for indexI in 1...3 {
    q1 = indexI
    for indexJ in 1...3 {
        q2 = indexJ
        for indexK in 1...3 {
            q3 = indexK
            if indexI != indexJ && indexI != indexK && indexJ != indexK {
                if q1 != p1 && p3 != q1 && p3 != q3 {
                    print(q1,q2,q3)
                }
            }
        }
    }
}
//输出2，3，1

/*
 4.求1+2!+3!+...+20!的和
 */
var sumC = 0;
for var index in 1...20 {
    var tmp = 1;
    while index > 0{
        tmp *= index
        index -= 1
    }
    sumC+=tmp
}
print(sumC)
//输出2561327494111820313

/*
 5.打印倒金字塔
 * * * * * * *
   * * * * *
     * * *
       *
 */

for indexI in 1...4 {
    for indexJ in 1...7 {
        if indexJ < indexI{
            //先打因左侧空格
            print(" ", separator: "", terminator: "")
        }else if indexJ+(indexI-1)<=7 {
            //再打印*
            print("*",separator: "",terminator: "")
        }
    }
    //换行
    print("")
}

/*
 一.编程中的流程控制结构有哪几种，分别用于什么场景？
 
 1.编程中主要的流程结构有顺序结构、分支结构、值环结构、跳转与中断结构。
 
 2.在编写代码时，我们的核心思路和代码的主流程都是线性的，代码是一行一行向下执行的，这就是我们最常用的顺序结构。 分支结构是程序逻辑的重要描述方式，输入不同，不同的运行场景都会对程序执行的结果产生影响，这时我们需要使用分支结构来处理。
 循环结构用来处理大量重复的工作。跳转和中断结构使得分支和循环结构更加灵活可控。

 
 二、运算符是一门编程语言的基础，swift中有哪些特殊的运算符？
 
 1.在Swift语言中，开发者可以根据需要对运算符进行重载，也可以进行运算符的自定义。
 
 2.由于存在Optional类型值，因此swift语言中提供了空合并运算符来对Optional值进行快捷的条件运算。
 
 3在swift语言中，区间运算符也是一种十分有特点的运算符，使用它可以方便地创建区间与范围，在集合遍历、字符串和数组的截取中都十分有用.
 
 */
