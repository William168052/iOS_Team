# iPhone计算器UI搭建  
##### Author:[William Zhong](https://github.com/William168052)
##### Edit:[David](https://github.com/HBU)
### iOS开发中UI是重要的一部分
### 本文通过搭建【iOS计算器UI】学习使用storyboard搭建软件UI。<br>
#### 效果图如下：<br>
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/1.png)

## 一、新建工程这一步在此就不再赘述，注意在语言选择那一栏选择Objective-C。<br>
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/2.png)
## 二、首先进入到Main.storyboard中，先构思一下需要一些什么控件。<br>
### 1、由上效果图我们可知需要一个UILabel来显示输入的结果还要一些button作为按钮。<br>

### 2、我们可以把他们全部放进控制器的view中，但是有一个问题，到时候我们如果要取出这些空间有些麻烦，因为他们不是一个种类的，得需要做一个判断，故我们可以先添加两个UIView控件（分别起名labelView和buttonView），将那些按钮统一放在buttonView里面，这样我们就可以通过buttonView的subviews属性拿到这些按钮，在labelView中添加一个UILabel控件来显示结果。<br>
### 如下图所示：<br>
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/3.png)

### 3、有了思路之后我们就可以通过storyboard搭建界面了！<br>
#### （1）首先现将两个UIView对象拖入，设置宽度和高度可以设置一个背景颜色区分。<br>
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/4.png)
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/5.png)
#### （2）设置labelView的X,Y,width,height对应为0,0,375,197。<br>
#### 同样可设置buttonView的X,Y,width,height对应为0,197,375,470。<br>
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/6.png)
#### 效果如下：<br>
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/7.png)
#### （3）添加UILabel控件并设置其X,Y,width,height对应为0,101,363,77。将其标题改为“0”并且设置对齐方式为右对齐，设置字体大小和粗细。<br>
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/8.png)
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/9.png)
#### 效果如下：<br>
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/10.png)
#### （4）接着添加UIButton控件<br>
#### 由于屏幕尺寸是375 * 667，即可计算出每个button的宽度和高度均为94（此处不再计算）拖入button控件并将button标题字体大小设置成39。<br>
#### 效果如下：<br>
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/11.png)
#### 到此所有的控件均已搭建完毕,只用修改下每个按钮标题和背景颜色就可以显示出效果了，如下：<br>
![](https://github.com/HBU/iOS_Team/blob/master/iOS_Demo/Calculator/Pic/12.png)
