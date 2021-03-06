#界面开发



## UI

界面开发技术用于搭建直接与用户交互的UI界面，一款应用程序中的标题、按钮、列表、输入框等都属于界面开发的领域.
一款应用程序的业务逻辑则离不开数据，更多情况下，数据都是通过网络进行传输与交换的

AppDelegate是应用程序的入口 SceneDelegate用来进行多场景应用的管理 ViewController是模板默认创建的一个视图控制器文件
LaunchScreen.storyboard是应用的启动闪屏界面 info.plist是项目的配置文件

### 界面管理器 UIViewController
视图控制器是通过组合各种控件来展现一个完整的界面并且处理界面中业务逻辑的管理者。

ViewController是应用程序的一个界面，当应用程序在不用界面间切换时，实际切换的是ViewController实例。
在ViewController内部，各个视图控件协同合作，以展现完整的UI界面，ViewController 统一来处理各个独立视图控件的业务逻辑。

#### MVC 设计模式

MVC (Model-View-Controller）设计模式

MVC设计模式将一款应用程序分为3个层次：数据层 (Model）、视图层（View）、视图控制器层 (ViewController)

View层提供视图界面的渲染 ，UI控件都属于View层
Model层为视图提供需要展示的数据，在实际开发中，开发者一般会将某个视图中要填充的数据封装成Model对象。
ViewController层起到管理与衔接的作用，其和Model层的关联在于：
一方面，从Model层拿取数据并进行整合
另一方面，将交互中产生的数据更新至Model层。同时，
ViewController层也会将各个独立的View进行组合，以处理View层产生的用户交互事件等

使用 MVC设计模式开发的项目具有很强的扩展性。例如，开发成型后的项目在UI展现上有了更改，在改变接口的情况下，只需要修改 View 层即可。同样，如果逻辑交互有了修改，开发者也不需要关心 View 层与 Model 层，在ViewController 层中修改即可。

UIButton是通过addTarget（）方法来添加用户交互事件的，这种方式适用于通过纯代码创建出来的控件。
如果是用Storyboard工具拖曳的控件，开发者可以直接将该按钮的触发方法与其附着的视图控制器关联


WebKit框架，将应用中联入网页的相关接口提取整合成了一个完整的框架，webKit框架中添加了一些原生 与JavaSoript交互的方法，并且 WebKit框架中采用导航栈的模型进行网页的跳转管理，开发者更容易控制和管理网页的渲染。

WebKit框架中设计的类很多，框架的设计十分面向对象化和模块化，这更有利于开发者代码的结构化。

WebKit框架中最核心的类应该属于WKWebView类，这个类专门用来进行网页视图的谊染，其
需要通过WKWebViewConfiguration类进行配置。而WKWebViewConfiguration类中主要包含了3个模块：
WKPreferences 类用于进行自定义的偏好配置
WKProcesssPool类用于进程池的配置
WKUserContentController类也是一个核心类，主要用来进行native与JavaScript的交互管理
关于WKUserContentController，其又需要两个类的协作，WKUserScript类用于通过原生代码向网页注入JavaScript代码，WKScriptMessageHandler类用于处理JavaScript代码调用的原生方法。

可以通过 WKNavigationDelegate 协议监听网页的活动
WKNavigationAction类是某个活动的实例化对象
WKUIDelegate协议用于 处理JavaScript代码中的一些弹出框事件
WKBackForwardList类用于栈结构的管理
 WKBackForwardListltem类是每个网页节点的实例化对象。

WebKit框架中的网页的展示和渲染是通过WKWebViewConfiguration类

网页视图WebView，其实质也是滚动视图，用户可以上下滑动屏幕进行网页的浏览。

i0S系统中的滚动视图由UIScrolView类来实现，其是更多复杂界面开发的基础，如后面会向读者介绍的列表视图 UITable View 、集合视图 UICollectionView 以及翻页视图控制器UIPageViewController等都是基于UIScrollView扩展而来的高级视图控件

可以将UISorollView理解为一块大的画布，我们可以向其中放入任意尺寸的一组视图

##简述MVC开发模式的思路
1 在MVC中，M是指Model，即数据模型；V是指View，即视图；C是指Controller，即控制器。
2 MVC是软件开发中数据与视图分离的一种开发模式。这种模式下，将数据层与视图层进行了分离，在控制器层中对数据进行处理并对视图进行渲染。
3 MVC模式的优势在于对于频繁的视图层的修改不会影响数据层；也可能不会影响控制器层，加快迭代速度。
4 在i0S开发中，继承自UIViewController的类通常作为视图控制器使用，继承自UIView的类通常属于视图层，数据层需要根据开发者的需求自己封装，通常继承自NSObject类


在编写代码之前，首先需要设计每一层的结构和相关类的作用。通常，view层的类是通用性最强的，应该提供统一的接口，可以多个场景复用。
Controller层的类通用性稍差，通常情況下某些通用性极强的界面可以封装成Controller。
Model类几乎没有可复用性，其定义取决于接口设计

##UIViewController的生命周期是什么？
1.UIViewController的生命周期是指一系列生命周期方法，例如初始化方法、加载完成方法、将要显示方法、已经显示方法、将要消失方法、已经消失方法、销毁方法等。

2.不同的生命周期方法通常用来处理不同的逻辑，例如关于视图控制器初始化相关的代码可以放在初始化方法中，界面的渲染相关代码可以放入视图控制器加载完成方法中，数据的拉取与删除分别放在将要显示与将要消失方法中，相关资源释放的代码放入视图控制器的销毁方法中，

##常用的视图控制器的传值方法有哪些？

1.传值是视图控制器间交互的一种重要方式，在实际开发中，经常会遇到后一个界面的内容取决于用户在前一个界面的选择，这时就需要使用到传值。

2.在i0S开发中，传值非常灵活，常用的方法有3种：直接属性传值、代理传值和闭包传值。

3.直接属性传值常用来进行正向传值，当一个视图控制器被初始化出来后，可以直接使用这个实例对它的某个属性进行赋值实现传值。

4.代理传值可以正向传值，也可以反向传值，正向传值通过代理函数的返回值来传递，反向传值通过代理函数的参数来传递

5.闭包是一种更加灵活的传值方式，但是在使用闭包时，一定要额外注意不要产生循环引用。

传值是指不同控制器间传递和共享数据，需要熟练掌握开发中常用的各种传值方式

##在使用UITableView时，有什么需要注意的性能问题？

1.在实际开发中，列表视图是最常用的一种视图控件，商品列表、聊天信息列表、通讯录等界面都是使用UITableView开发的。

2.在构建列表界面时，要注意使用ID来对UITableViewCell进行复用，优化内存使用。

3.对于复杂的列表视图，如果每行的高度不同，则可以将高度计算后进行缓存，避免多次重复计算造成的性能开销

4.UITableView本身十分强大，灵活使用其分区、分区头尾、列表头尾、索引和编辑模式等可以构建复杂的界面。

##通过GIF文件播放动画
GIF是一种常用的动态图文件格式。iOS开发框架中没有现成的接口供开发者展示。
UIImageView类专门来负责图片数据的渲染，同时提供了播放一组图片的帧动画接口。
我们可以通过两种方式来播放Gif动态图：
一种方式是通过ImageIO框架中的方法将GIF文件文件中的数据解析成图片数组，使用UIImageView的帧动画接口进行播放
另一种方式是直接通过WKWebView来渲染GIF图，使用浏览器提供的引擎进行播放


###使用原生的 UIImageView 来播放GIF动态图
GIF动态图文件中包含一组图片及信息，其中的信息主要用来记录每一帧图片的播放时长。如
果开发者在获取到GIF文件中所有图片素材的同时又获取到每一帧图片播放的时间，就可以使用UIImageView类对其进行帧动画的播放。

##CoreAnimation 核心动画技术

应用UIView层封裝的动面基本已经可以滿足日能开发中的动画需求，更加灵活、自由，需要CoreAnimation框架中的一些类与方法

CoreAnimation框架是基于OpenGL与CoreGraphics图像处理框架的一个跨平台的动画框架。会帮助开发者将图像文件解析为位图数据，通过硬件处理实现动画效果。

在CoreAnimation框架中，大部分的动画效果都是通过Layer层来实现的，其实每一个UIView视图内部都封装了一个CALayer对象，我们通常将其称为视图的Layer层，其主要作用是对视图进行UI渲染。通过CALayer，开发者可以组织复杂的层级结构，CoreAnimation框架中大多数的动画效果都添加在图层的属性变化上，例如改变图层的位置、尺寸、颜色和圆角半径等。Layer层并不负责视图的展现，它只负责存储视图的属性状态。

###锚点对视图几何属性的影响

锚点这个概念对于Layer层十分重要，锚点决定了图层的绘制位置以及动画表现时其参照的点。锚点的x轴与y轴的取值范围都是0~1。：

1.Layer层的position参照点始终与锚点重合。在Layer层中，虽然也有frame这样的属性，但很少使用，开发者一般会使用bounds和position来确定Layer层绘制的尺寸和位置

2.锚点决定视图进行动画时的参照点。当对一个视图进行动画时，都需要一个参照点，例如一个旋转动画缩小时参照中心点的位置，其锚点就决定了视图旋转的中心点位置。对于缩放动画，锚点则决定了放大或者缩小时参照中心点的位置

图16-5不同锚点位置对视图动作的影响

锚点x轴和y轴的取值范国都是0~1，其所代表的是锚点在此轴方向上所占的长度比例。(0,0）为左上角，(1,1)为右下角。
Layer层是专门负责绘制图像的层，它也支持三维坐标系的绘制。然而Layer层并不能接收用户交互事件

##几种常用的 CALayer 子类介绍

Layer层用来进行图形绘制与界面渲染。在CoreAnimation框架中，CALayer作为父类由于功
能差异，其下派生出了许多子类，有专门渲染图像的，有专门渲染文字的，也有专门处理色阶变化的：

CoreAnimation框架中的CALayer子类及其功能列举如下：

CAEmitterLayer:一个粒子发射器系统，负责粒子的创建和发射源属性的配置。通过它轻松创建出炫酷的粒子效果动画

CAGradientLayer：可以创建出色彩渐变的图层效果

CAEAGLLayer：可以通过OpenGL ES来进行界面的绘制。

CAReplicatorLayer:一个图层容器，会对其中的子图层进行复制和属性偏移。创建出类似倒影的效果，也可以进行图层的变换复制

CAScrollLayer：可以让其管理的多个子层进行滑动，但是只能通过代码进行管理，不能进行用户点按触发。

CAShaperLayer ： 可以让开发者在图层上直接绘制出自定义的形状

CATextLayer： 用于进行文字的绘制

CATiledLayer: 即瓦片视图，可以分区域绘制，常用于在一张大的图片中分区域绘制

CATransformLayer：用于构建一些图层变化效果，包括3D效果的图层变换

每个UIView对象内部都封装了一个CALayer对象，因此可以直接将要测试的Layer作为子图层添加到这个CALayer对象上

CAGradientLayer专门用来创建颜色新变的图层效果


##Autolayout自动布局

在使用模拟器时，如果需要改变模拟器的横竖屏模式，按住键盘上的 Command 键不放，再按键盘上的左右方向键即可。
Autolayout自动布局采用相对布局的设计思想，开发者只需要关注控件与控件之间的位置关系即可，而不用关心控件的尺寸和位置。因此在自动布局中，“约束”这个概念十分重要

勾选Horizontally in Container 和Vertically in Container选项
两个约束分别表示将当前视图约束在其父视图的水平方向与竖直方向的中心

storyboard中的 Add New constraints按钮主要是用于添加固定视图控件的约束，其上半部分为设置此控件与离其上、下、左、右最近的视图之间的距离约束值。
Width约束视图本身的宽度，Height约束视图本身的高度，Aspect Ratio约束视图的宽高比例为定值，Equal Widths与Equal Heights约束两个视图宽度相等和两个视图高度相等。


Align主要用于添加视图控件的对齐约束，其中Leading Edges约束视图控件的左边距，Trailing Edges約束视图的右边距，Top Edges约束视图的上边距，Bottom Eages约束视图的下边距，Horizontal Centers约束视图间的水平中心间距，Vortical Centers约束视图间的竖直中心间距；Horizontaly in Container约束视图与其父视图的水平中心间距， Vertically in Container约朿视图与其父视图的坚直中心间距。

##使用原生代码进行 Autolayout 自动布局

要使用代码来进行视图间的关系约束，首先一定要将约束对象化。NSLayoutConstraint类就是用来创建Autolayout约束对象的，通过这个类，开发者可以创建所有在Storyboard文件中可以创建的约束。

##使用第三方框架 Snapkit 进行 Autolayout 自动布局
向项目中引入第三方框架有两种方式：
一种是使用CocoaPods管理工具，需要安装CocoaPods工具
第二种是直接下载源码，并将其导入工程中

##在ios开发中实现动画的几种方式
1.最常用的动画方式是UIView层的属性动画。
2.使用UIView属性动画可以将视图的透明度、位置、尺寸、颜色等变化以动画的方武展现。
3.UImageView支持使用一组Image循环播放来展示动面。
4.CoreAnimation是更加强大的动画框架，可以进行Layer层相关动画的变换。
5.粒子效果是一种更加炫酷的动画，使用CAEmitterLayer可以进行粒子效果开发。
6.自动布局技术也可以和动画结合使用。

##自动布局技术在界面开发中的优劣。
①自动布局与传统的绝对布局相比，界面布局的思想有转变。
②绝对布局专注于控件的绝对尺寸和绝对位置，需要设置精确的坐标和尺寸大小。
③自动布局则专注于控件之间的相对关系，比如控件间的相对尺寸、间距等。
4 绝对布局的优势在于简单，并且可以精确地从代码看出控件的布局状态：劣势是灵活性差、适配性差。
⑤自动布局的劣势在于布局时需要理解各个组件间的相对关系，并且需要更多约束代码：优
势是可以自动根据约束关系进行适配。自动布局是当下流行的界面布局开发方式

#网络与数据存储技术

使用网络就一定要学会如何处理数据，网络交互的实质就是数据在客户端与服务端进行传输

##关于 JSON 数据格式

API服务返回的数据一般有两种格式：一种是JSON (JavaScript Objeet Notation）格式，另一种是XML格式.
由于JSON类型更加简洁，处理相对方便，因此称为移动端常用的接口数据格式。
JSON是一种轻量级的数据交换格式，比较容易理解，其结构和swift语言中的字典十分类似，主要是通过键值来对组合数据，JSON值支持的数据类型及写法格式
JSON值支持的数据类型及写法格式

类型          写法格式
数字          直接书写
字符串         书写在双引号中
数组           书写在中括号中
字典          书写在大括号中
空对象         null


JSON数据有两种结构，这两种结构取决于根数据类型是数组还是字典，如果JSON数据最外层用的是大括号，则此JSON数据为字典结构，在解析时应使用字典对象来接收；如果JSON数据最外层用的是中括号，则此JSON数据为数组结构，在解析时应使用数组对象来接收。

在ios开发中要进行JSON数据的解析，所解析的数据必须为严格的JSON格式，有许多在线网站用来校验JSON数据。
由于 API 服务的数据来自互联网，不能保证其在任何时间都是可用有效的，因此建议读者
在使用JSON 数据前，将请求到的数据通过校验工具进行 JSON格式的校验，确认数据格式无误后再进行解析操作

##在 i0S 开发中进行网络数据请求

URLSession框架。

##关于 HTTP 网络请求协议

HTTP是一套计算机通过网络进行数据传输的规则协议，是一种无状态的网络协议，无状态是指请求者与服务器之间不需要建立特久的连接，请求完成连接就会关闭。

当请求者向服务端发出请求时，它需要向服务端传递一个数据块，这个数据块需要包含3部分:请求方法、请求头和请求体。同样，当服务端响应了 请求，返回的响应数据块也包含3部分：协议状态、响应头和响应体

HTTP1.1版本中支持7种请求方法，分别为GET、POST、HEAD、OPTIONS、PUT、DELETE和TARCE
其实不同的请求方法并没有本质上的差别，只是开发者人为约定了一些标识和相应的数据携带手段，来互相表明请求的意义。在移动开发中，常用的两种请求方法为GET方法与POST方法，后面会具体介绍这两种方法应用的异同与场景。

请求头一般会包含请求者的客户端环境和相关配置信息，开发者也可以向其中添加自定义字段，比较常见的是向其中加入验签字段，以供服务端对请求者进行身份验证。

请求体中可以存放请求者向服务端提交的参数字段，使用POST方法进行的请求，参数会添加在请求体。

GET请求和POST请求是移动端进行网络请求的两种基本方法，GET方法是默认的HTTP请求方法，其常用于简单数据的提交，其参数直接拼按在URL请求链接中，请求效率高，但安全性差且不能传递大量数据。POST方法适合向服务端传递大量的数据，并且其参数会放在请求体中，相对安全一些。

##使用 URLSesstion 进行网络请求

配置只支持HTTPS的网络协议，而API服务目前大多还是HTTP协议，因此读者需要在编写相关代码前对项目工程的Info.plist文件进行一些简单的配置

在Info.plist文件的根节点中添加一个名为App Transport Security Settings的键，其对应的值为字典类型，再向其中添加一个名为Allow Arbitray Loads 的键，将其值设置为Boolean类型的YES

配置完成后，项目便可支持HTTP协议的请求


在实际开发中，开可以将JSON 数据解析为字典，再从中取出界面這染所需要的数据，
也可以將界面需要的数据封装成数据模型，通过字典对数据模型的属性进行赋值。同样，
开发者也可以选择第三方 JSON 数据解析框架JSONKit 直接完成这一过程。


##使用 UserDeraults 与 Plist 文件进行常见类型数据的存储

对于这类有配置意义或者结构简单的、数据量小的数据，一般通过UserDefaults类来完成持续化存储。
UserDefults采用键值对的模式，可以方便对常见数据类型进行持久化存储操作，其实质是将数据写成Plist文件存储在本地

##使用 Plist 文件进行数据持久化处理

开发者经常会对工程的配置文件Info.Plist进行修改。存储系统配置信息是Plist文件最合适的应用场景之一。

Plist文件的内容实质是使用XML格式编写的，支持的数据类型包括Array、Dictionary、Boolean、Data、 Date、Number和String。

如果直接使用文本编辑器打开Plist文件，读者会发现其使用标签进行数据定义，直观性和操作性都不强，xcode开发工具自带Plist文件编辑器，使用它观看和编辑Plist文件都十分方便。

##SwiftUI技术
影响界面开发效率的一大问题是每次代码的修改查看效果都需要重新编译运行。往往调试验证的时间远远大于编码时间，严重影响了开发效率。当然，这也是大多数编译型语言共有的痛点。

##开发
在开发一款完整的应用程序时，要始终遵循面向对象与封装的思路。对于计算器软件，可以将其拆分为界面与功能逻辑两部分。在界面开发中，又可以将界面分为显示板与操作板两部分

如果使用CocoaPods的方式引入SnapKit框架，需要在这个类文件中引入
import SnapKit

##顼目工程的搭建
在项目开始之前，开发者应该先明确项目的需求，熟悉项目的交互方式与逻辑功能，才能够正确地选择适合项目的框架。一般情况下，产品经理会将完整的项目需求文档与产品原型图交给开
发者，开发者需要结合U设计的界面效果图来选择技术方案以完成项目的开发。


框架中包含一个名为AVFoundation的框架，这个框架封装了许多用于处理音视频相关的类，使用它们，开发者可以十分轻松地在项目中引用音视频数据。

在工程中引入音频文件十分简单，在引入文件时，要勾选Copy items if needed与当前工程chinese group 复选框


背景音乐是整个游戏级別的功能，其并不属于其一个界面或者某一个类。当用户对背景音乐运行开关操作时也应该作用于整个游戏。由于这样的特点，可以在项目中创建一个音频引擎类，采用单例的设计模式，使得此引擎被整个项目所共享。

所谓单例设计模式，是指这个类在整个应用程序运行期间只能被实例化一次。换句话讲，
采用单例模式的类，其中的数据也被整个应用共享。以背景音乐播放为例，A界面和B界面都有可能打开或者关闭音效，当用户在A界面关闭音效后，来到B界面，音乐也不会播放，同理，如果用户在B界面放开了音效，回到A界面后，音效也是打开状态，这种逻辑就叫数据共享


Ob 二进制数据前缀
0o八进制数据前缀
Ox十六进制数据前缀
bit  bit二进制位 （0 或者1） 单位

B 字节单位 (1B=8bit)

KB 千字节单位 (1KB=2^10B）

MB 兆字节单位 （1MB=2^10KB）
 GB 吉字节单位 (1GB=2^10MEB）
TB 太字节单位 (1TB=2^10GB）
UInt8 无符号 8位整型数据
Uint16 无符号 16位整型数据
Uint32   无符号 32 位整型数据
Uint64   无符号 64 位整型数据
Int8 8位整型数据
Int16 16位整型数据
Int32 32位整型数据
Int64 64位整型数据
Float 单精度浮点型数据
Double 双精度浮点型数据
可选类型空值 nil
if-let 可选值绑定结构
typealias 为类型取别名
MemoryLayout 内存分布信息

\0 转义空白符
\\ 转义字符
\t 转义制表符
\n 转义换行符
\r 转义回车符
\' 转义字符，
\'' 转义字符"
\u{} Unicode 码字符
isEmpty 判断字符串是否为空
Set 集合类型
/ 除号运算符
% 取余运算符
/= 复合除运算符
&& 逻辑与运算符
|| 逻辑或运算符
?: 条件运算符
?? 空合运算符
... 闭区间运算符
..< 半开区间运算符
~= 包含运算符
for-in 循环遍历结构
while 条件循环结构 （先判断条件，再执行循环）
repeat-while 条件循环结构 （先执行循环，再判断条件)
if-else 条件选择结构
switch-case 多分支选择结构
continue 跳过本次循环
break 跳出当前循环
fallthrough 继续匹配 switch-case 结构中的下一个 case
guard-else  守护中断结构
_ 匿名变量标识符
inout 标记函数内部可修改外部参数
{() -> Void in }  基础闭包结构
AnyObject 任意引用类型
Any 任意类型
@escaping 修饰逃逸闭包
@noescape 修饰非褒义闭包
@autoclosure 修饰自动闭包
& 按位与运算符

| 按位或运算符
~ 按位取反运算符

<< 按位左移运算符
>> 按位右移运算符
^ 按位异或运算符
&- 溢出减运算符
&+ 溢出加运算符
&* 溢出乘运算符
prefix    自定义前缀运算符
infix     自定义中缀运算符
postfix   自定义后缀运算符

associativity 设置运算符结合性
 precedence    设置运算符优先级
enum 枚举关键字
indirect 递归枚举关键字

init 构造方法
deinit 析构方法
lazy 延迟加载属性关键字
willSet   属性监听器（将要赋值时）
didSet   属性监听器（已经赋值时
static 声明静态属性或方法
下标方法 subscript
声明便利构造方法 convenience
父类关键字 super 
声明必要构造方法 required
自动引用计数技术 ARC
手动引用计数 MRC
弱引用关键字 weak
无主引用关键字 unowned
定义错误枚举 Error
异常捕获结构 do-catch
异常映射 Optional 关键宇 try 
延迟执行语句 defer
类型检查关键字 is 
类型转换关键字 as

UIPageControl 分页控制器控件
UISegmentedControl 分段控制器控件
UISlider 滑块控件
ULActivityIndicatorView 活动指示器控件
UlStepper 步进控制器控件
UlPickerView 选择器控件
UlTabBarController 标签控制器
ULAlertController 警告视图控制器
UserDefaults 本地持久化存储类


## 代码优化
在开发过程中保持代码的清晰与简洁十分重要，开发软件的过程是不断地对软件进行优化的过程。在软件工程中，有一种专门的术语叫作重构，其核心思想是提倡开发者在开发新的功能前，先将不利于新功能添加的设计进行重构优化，而不是将新的代码强加在旧的代码中。关于判定一段代码是否需要进行优化，可以从以下几个方面进行分析：

(1）方法的命名是否可以使读者直观地了解其作用。
(2）是否生产了过多的局部变量。
(3）循环或者分支语句是否进行了3层以上的嵌套。
（4）函数的代码行数是否过长
(5）相同作用的变量是否多次创建。
（6） 相似功能的代码块是否重复编写。

一般来说，一个函数的长度不超过一屏是比较合适的，
GameEngine类，其中的checkCanMove
方法是十分失败的，首先其行数超过了500行，这是一个十分恐怖的数宇，对于以后的功能修改和
Bug锁定都将十分困难。除此之外，其中还有大量的常量和变量重复，例如几乎每个if代码块中都
创建了 position、wantMove、redList、 redList这些功能完全一样的量值。其中相似逻辑的重复代码
块也多到可怕，例如每个近块中都有进行行棋路线的边界检查，只是边界检查条件不同而己。
