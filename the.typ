// Remo.typ

/* -----------------------

  您任何有关论文的内容都只需要在「the.typ」中书写。
  
  附录内容请前往「/lib/Page/appendix.typ」添加即可。
  
  如果有任何疑问欢迎讨论：remthrose@gmail.com
  
  ----------------------- */
#import "lib/lib.typ":* 

#show: doc.with(
  // 毕业论文基本信息
  thesis-info: (
    // 论文标题，将展示在封面、扉页与页眉上
    // 多行标题请使用数组传入 `("thesis title", "with part next line")`，或使用换行符：`"thesis title\nwith part next line"`
    title: ("基于 Typst 的", "原神大学学位论文模板"),
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

= 如何使用本Typst模版

== 列表

=== 无序列表

- 无序列表项一
- 无序列表项二
  - 无序子列表项一

=== 有序列表

+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二

=== 术语列表

/ 术语一: 术语解释
/ 术语二: 术语解释

== 图表格引用

=== 简单的图片与表格引用

引用@tbl:timing，引用@tbl:timing-tlt，以及@fig:test-image 和@fig:test-image2 。引用图表时，表格和图片分别需要加上 `tbl:`和`fig:` 前缀才能正常显示编号。

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

#figure(
  image("media/image2.png", width: 50%),
  caption: [图片测试2],
) <test-image2>


=== 复杂的图片与表格引用

下面 @tbl:complex-table-test1 和 @tbl:complex-table-test2 是较为复杂的表格。也可以直接使用latex的表格输入。

#figure(
  table(
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
      columns: (5), 
      "字段标识", "字段含义", "数据类型", "是否主键", "是否外键", 
      "ID", "ID", "INTEGER", "是", "否", 
      "VIDEO\_NAME", "视频名称", "VARCHAR2(20)", "否", "否", 
      "VIDEO\_TYPE", "视频类型", "VARCHAR2(20)", "否", "是", 
      "VIDEO\_PATH", "视频路径", "VARCHAR2(20)", "否", "否",
    ),
    caption: [分栏情况示例2]
) <complex-table-test2>



== 公式

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

== 代码

这里参考：`https://typst.app/docs/reference/text/raw/#definitions-line`。

```
#if defined(_GLFW_VULKAN_LIBRARY)
        _glfw.vk.handle = _glfwPlatformLoadModule(_GLFW_VULKAN_LIBRARY);
#elif defined(_GLFW_WIN32)
        _glfw.vk.handle = _glfwPlatformLoadModule("vulkan-1.dll");
#elif defined(_GLFW_COCOA)
        _glfw.vk.handle = _glfwPlatformLoadModule("libvulkan.1.dylib");
        if (!_glfw.vk.handle)
            _glfw.vk.handle = _glfwLoadLocalVulkanLoaderCocoa();
#elif defined(__OpenBSD__) || defined(__NetBSD__)
        _glfw.vk.handle = _glfwPlatformLoadModule("libvulkan.so");
#else
        _glfw.vk.handle = _glfwPlatformLoadModule("libvulkan.so.1");
#endif
```

如果有需要，可以加入编程语言的缩写以加入代码高亮。

```cpp
#if defined(_GLFW_VULKAN_LIBRARY)
        _glfw.vk.handle = _glfwPlatformLoadModule(_GLFW_VULKAN_LIBRARY);
#elif defined(_GLFW_WIN32)
        _glfw.vk.handle = _glfwPlatformLoadModule("vulkan-1.dll");
#elif defined(_GLFW_COCOA)
        _glfw.vk.handle = _glfwPlatformLoadModule("libvulkan.1.dylib");
        if (!_glfw.vk.handle)
            _glfw.vk.handle = _glfwLoadLocalVulkanLoaderCocoa();
#elif defined(__OpenBSD__) || defined(__NetBSD__)
        _glfw.vk.handle = _glfwPlatformLoadModule("libvulkan.so");
#else
        _glfw.vk.handle = _glfwPlatformLoadModule("libvulkan.so.1");
#endif
```

== 参考文献引用

可以像这样引用参考文献：图书#[@蒋有绪1998]和会议#[@中国力学学会1990]。

== 本章小结

本章主要介绍了Typst的格式。

以上也基本覆盖了所有的论文写作格式。

// 致谢
#acknowledgement[
  衷心的感谢计算机专业各位老师，在大学学习期间，给予了我极大地鼓励和帮助，在学习上给予了我严谨、耐心的指导，在生活上给与了我亲切、热情的关怀。老师们渊博的学识、谦逊、谨慎的治学作风，一丝不苟、尽职尽责的工作态度以及正直的为人之道，都将是我终身受益，并激励我始终刻苦努力。在此，我向各位老师表示崇高的敬意和衷心的感谢！
]

// 附录请前往：`lib/Page/appendix.typ`添加。
