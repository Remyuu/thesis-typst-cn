// Remo.typ
#import "lib/lib.typ":* 

#show: doc.with(
  // 毕业论文基本信息
  thesis-info: (
    // 论文标题，将展示在封面、扉页与页眉上
    // 多行标题请使用数组传入 `("thesis title", "with part next line")`，或使用换行符：`"thesis title\nwith part next line"`
    title: ("基于 Typst 的", "xxx学位论文模板"),
    title-en: "A Typst Template for xxx",

    // 论文作者信息：学号、姓名、院系、专业、指导老师
    author: (
      sno: "xxx",
      name: "张三",
      grade: "计科213",
      department: "某学院",
      major: "某专业",
    ),

    // 指导老师信息，以`("name", "title")` 数组方式传入
    supervisor: ("李四", "教授"),

    // 提交日期，默认为论文 PDF 生成日期
    submit-date: datetime.today(),
  ),
  
  thesis-abstract: (
    abstract: (
      "本文针对手机摄像头所获取的视频文件，进行手势运动方向的检测。针对低端摄像头视频图像的特点，本文采用了基于背景去除和肤色模型的方法对手部区域进行检测，并判别手部运动的方向。", 
      "首先，获取视频图像序列，即从视频文件中获取每一帧图像作为待检测的视频图像序列；其次，对获取的视频图像序列中的每一帧图像进行颜色模型转换、背景去除、图像二值化、形态学处理等预处理；然后，利用区域增长方法来检测视频图像序列中的手部连通区域，并计算每帧图像中手部区域的中心；最后根据图像序列中手部区域中心位置的变化来判断手部运动方向。", 
      "本文在Visual c++6.0开发环境下，借助于OpenCV开放平台，设计并实现了基于低端摄像头视频手势运动检测系统，得到了较好的检测效果。"
    ),
    keywords: ("关键词1", "关键词2",),
    abstract-en:("Moving target detection in video is to determine whether there is a moving target in the sequence of video images and to identify the location and trajectories of the moving target.", "With the popularization of camera functions in mobile phones and other electronic products ,it is increasingly become a kind of application needs to use gestures to control the mobile phones, so the problems of moving target detection based on the cameras of mobile phones are drawing more and more attention.", "However, the cameras that are widespread used in mobile phones are mostly low-end cameras, as the video files gained from the low-end cameras have some shortcomings such as big noise and low-resolution, thus there is a certain degree of difficulty in the detection of the moving targets."),
    keywords-en: ("moving target detection", "color model conversion", )
  ),

  // 参考文献来源
  bibliography: bibliography.with("ref.bib"),

  // 附录部分为可选。设置为 true 后，会在参考文献部分与致谢部分之间插入附录部分。
  appendix: true,

)


= 绪论

个人网页：`https://remoooo.com/`，欢迎访问。如果对模版有疑问请联系：remthrose\@gmail\.com。

本模板只是作为本科论文格式示例作用，为尽可能涵盖《毕业论文撰写规范》规定的内容，部分图片或表格与论文内容无关，该模板论文无研究意义，师生只做格式参考。

== 如何使用本Typst模版

=== 列表

==== 无序列表

- 无序列表项一
- 无序列表项二
  - 无序子列表项一

==== 有序列表

+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二

==== 术语列表

/ 术语一: 术语解释
/ 术语二: 术语解释

=== 公式

可以像 Markdown 一样写行内公式 $x + y$，以及带编号的行间公式：

$ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>

引用数学公式需要加上 `eqt:` 前缀，则由@eqt:ratio，我们有：

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

我们也可以通过 `<->` 标签来标识该行间公式不需要编号

$ y = integral_1^2 x^2 dif x $ <->

而后续数学公式仍然能正常编号。

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

其中，$E_s$、$E_c$——基体和涂层的平均弹性模量。

关于公式可以前往 `https://typst.app/docs/reference/math/` 查看。

=== 图表格引用

==== 简单图表格引用

引用@tbl:timing，引用@tbl:timing-tlt，以及@fig:test-image。引用图表时，表格和图片分别需要加上 `tbl:`和`fig:` 前缀才能正常显示编号。


#align(center, (stack(dir: ltr)[
  #figure(
    table(
      align: center + horizon,
      columns: 4,
      [t], [1], [2], [3],
      [y], [0.3s], [0.4s], [0.8s],
    ),
    caption: [常规表],
  ) <timing>
][
  #h(50pt)
][
  #figure(
    table(
      columns: 4,
      stroke: none,
      table.hline(),
      [t], [1], [2], [3],
      table.hline(stroke: .5pt),
      [y], [0.3s], [0.4s], [0.8s],
      table.hline(),
    ),
    caption: [三线表],
  ) <timing-tlt>
]))


#figure(
  image("media/image1.png", width: 75%),
  caption: [图片测试],
) <test-image>

==== 复杂图表格引用

下面 @tbl:complex-table-test1 和 @tbl:complex-table-test2 是较为复杂的表格。

#figure(
  table(
      // columns: (16.04%, 11.36%, 29.35%, 18.61%, 24.64%), 
      columns: (5), 
      align: (center, center, center, center, center,), 
      table.cell()[基体], table.cell()[序号], table.cell()[粉末类型和预热温度（$℃$）], table.cell()[失效温度（℃）], table.cell()[Ec计算值（$\G\P\a$）], 
      table.cell(rowspan: 4)[SUS304不锈钢], 
      table.cell()[1], table.cell()[粗粉 & 1000], table.cell()[180], table.cell()[4.21], 
      table.cell()[2], table.cell()[粗粉 & 800], table.cell()[10], table.cell()[4.38], 
      table.cell()[3], table.cell()[细粉 & 1000], table.cell()[300], table.cell()[4.95], 
      table.cell()[4], table.cell()[细粉 & 800], table.cell()[120], table.cell()[5.08],
    ),
  caption: [分栏情况示例1]
) <complex-table-test1>

#figure(
  table(
      columns: (25.96%, 17.52%, 28.12%, 15.96%, 12.44%), align: (center, center, center, center, center,), table.cell(align: center)[字段标识], table.cell(align: center)[字段含义], table.cell(align: center)[数据类型], table.cell(align: center)[是否主键], table.cell(align: center)[是否外键], table.cell(align: center)[ID], table.cell(align: center)[ID], table.cell(align: center)[INTEGER], table.cell(align: center)[是], table.cell(align: center)[否], table.cell(align: center)[VIDEO\_NAME], table.cell(align: center)[视频名称], table.cell(align: center)[VARCHAR2(20)], table.cell(align: center)[否], table.cell(align: center)[否], table.cell(align: center)[VIDEO\_TYPE], table.cell(align: center)[视频类型], table.cell(align: center)[VARCHAR2(20)], table.cell(align: center)[否], table.cell(align: center)[是], table.cell(align: center)[VIDEO\_PATH], table.cell(align: center)[视频路径], table.cell(align: center)[VARCHAR2(20)], table.cell(align: center)[否], table.cell(align: center)[否],
    ),
    caption: [分栏情况示例2]
) <complex-table-test2>

=== 参考文献使用

可以像这样引用参考文献：图书#[@蒋有绪1998]和会议#[@中国力学学会1990]。

#figure(
  image("media/image2.png", width: 50%),
  caption: [RGB彩色立方体示意图]
)

= 基础知识

基于视频序列的运动目标检测与跟踪涉及到很多研究领域，如数字图像处理、计算机视觉、信息融合、模式识别与人工智能等。

可以像 Markdown 一样写行内公式 $x + y$，以及带编号的行间公式：

$ phi.alt := (1 + sqrt(5)) / 2 $ <ratio1>

摄像头（camera）又称为电脑相机、电脑眼等，它作为一种视频输入设备，在过去被广泛的运用于视频会议、远程医疗及实时监控等方面#strong[#super[\[];];#footnote[付梦印，邓志红，张继伟．Kalman滤波理论及其在导航系统中的应用\[M\]．北京：科学出版社，2003：89-97．（五号宋体，成文删除）];#strong[#super[\]];];。近些年来，随着互联网技术的发展，网络速度的不断提高，再加上感光成像器件技术的成熟，使得摄像头得到了越来越广泛的应用#strong[#super[\[];];#footnote[邓宇．复杂背景下的运动目标检测技术研究．贵州大学，2007．];#strong[#super[\]];];。

#figure(
  image("media/image3.png", width: 40%),
  caption: [手势运动方向检测流程图]
)

视频序列中运动目标的检测与跟踪是计算机视觉和图像编码研究领域的一个重要课题，在机器人导航、智能监视系统、交通检测、医学图像处理以及视频图像压缩和传输等领域都有广泛的应用#footnote[张爱茜，陈日清，魏东斌，王连生．氯代芳香族化合物对羊角月牙藻的毒性及QSAR分析．中国环境科学，2000．20(2)：102-105．];。运动目标检测就是判断视频序列中是否存在运动目标，并确定运动目标的位置#strong[#super[\[];];#footnote[C.Stauffer，W.E.L.Grimson．Adapitve Background Mixture Models for Real-Timer Tracking\[J\]．Pro Computer Vision and Pattern Recognition (CVPR’99)，1999．（Times New Roman 五号，成文删除）];#strong[#super[\]];];。运动目标的提取主要包括运动检测以及目标提取两个步骤，其中运动检测处于整个视觉监视系统的最底层，是各种后续高级处理如目标分类，行为理解等的基础#strong[#super[\[];];#footnote[#link("http://www.creader.com/news/200112-19/200112-199019.html")

  （注：参考文献具体格式请参照附件6《信息与文献 参考文献著录规则》，成文删除）];#strong[#super[\]];];。

== 视频图像预处理
=== 常用颜色模型
颜色模型的用语是在某些标准下用通常可接受的方式简化彩色规范。本质上颜色模型是坐标系统和子空间的规范。位于系统中的每种颜色都由单个点来表示。

（1）RGB彩色模型

在RGB模型中，每种颜色出现在红、绿、蓝的原色光谱分量中，这个模型基于笛卡尔坐标系。

图2.1 所示的立方体。图中R、G、B位于3个角上。在该模型中，灰度等级沿着主对角线从原点的黑色到点（1，1，1）的白色分布。

#figure(
  image("media/image4.png", width: 75%),
  caption: [透平膨胀机的组成结构]
)

= 视频图像预处理

== 引言
本章是视频图像的预处理阶段，首先，获取视频图像；然后对视频图像序列中的每帧图像进行图像预处理。如图3.1所示。

#figure(
  image(
    "media/image5.png",
  ), 
  caption: [手势运动方向检测流程图]
)

由图3.1可知，视频图像的预处理阶段，首先，获取视频图像；然后对视频图像序列中的每帧图像进行图像预处理。



== 本章小结
本章主要介绍了图片的格式。

= 结论

在Visual c++6.0开发环境下，借助于OpenCV开放平台，设计并实现了基于低端摄像头视频手势运动检测系统。
（3）结论
结论作为毕业论文正文的组成部分，单独排写，不加章标题序号，不标注引用文献。
结论是对整个论文主要成果的归纳总结，要突出创新点，以简练的文字对论文的主要成果进行评价，一般为500字左右。



// 致谢
#acknowledgement[
  衷心的感谢计算机专业各位老师，在大学学习期间，给予了我极大地鼓励和帮助，在学习上给予了我严谨、耐心的指导，在生活上给与了我亲切、热情的关怀。老师们渊博的学识、谦逊、谨慎的治学作风，一丝不苟、尽职尽责的工作态度以及正直的为人之道，都将是我终身受益，并激励我始终刻苦努力。在此，我向各位老师表示崇高的敬意和衷心的感谢！
]

// 附录请前往：`lib/Page/appendix.typ`添加。