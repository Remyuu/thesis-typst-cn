#import "font.typ": * 

#import "Page/titlepage.typ": titlepage
#import "Page/declaration.typ": declaration 
#import "Page/copyright.typ": copyright
#import "Page/abstract.typ": abstract

#import "Page/appendix.typ": appendix, appendix-part
#import "Page/acknowledgement.typ": acknowledgement, acknowledgement-page

#import "Page/toc.typ": toc

#import "utils/bilingual-bibliography.typ": bilingual-bibliography

#import "@preview/numblex:0.1.1": numblex, circle_numbers
#import "@preview/i-figured:0.2.4"
#import "@preview/cuti:0.2.1": show-cn-fakebold

#let doc(
  
  thesis-info: (  
    title: ("基于 Typst 的", "原神大学学位论文"),
    title-en: ("English title", "for xxx thesis"),
    author: (
      sno: "学号",
      name: "论文作者姓名",
      grade: "班级",
      department: "学院",
      major: "专业",
    ),
    supervisor: ("李四", "教授"),
    submit-date: datetime.today(),
  ),
  
  thesis-abstract: (
    abstract: ("第一段", "", ),
    keywords: ("关键词1", "关键词2",),
    abstract-en:("Para1", "Para2", ),
    keywords-en: ("key1", "key2", )
  ),

  bibliography: none,

  appendix: true,
  
  content
  
) = {
  set text(lang: "zh",)
  
  // “伪粗体”实现，利用 cuti 包
  show: show-cn-fakebold
  
  // 论文信息参数处理。要求必须传递，且符合规格的参数
  assert(type(thesis-info) == dictionary)
  assert(type(thesis-info.title) == array or type(thesis-info.title) == str)
  assert(type(thesis-info.title-en) == array
    or type(thesis-info.title-en) == str
  )
  // 论文信息默认参数。函数传入参数会完全覆盖参数值，因此需要提供默认参数补充。
  // 彩蛋：如果论文参数不传递作者参数，那么论文就会被署名论文模板作者
  let default-author = (
    sno: "20xxxxxx",
    name: "remo",
    grade: "2000",
    department: "csxxx",
    major: "cs",
  )
  thesis-info.author = thesis-info.at("author", default: default-author)

  let default-thesis-info = (
    title: ("原神大学本科生毕业论文（设计）", "写作与印制规范"),
    title-en: ("The Specification of Writting and Printing", "for xxx thesis"),
    supervisor: ("李四", "教授"),
    submit-date: datetime.today(),
  )
  thesis-info = default-thesis-info + thesis-info

  // set document(
  //   title: thesis-info.title.join(""),
  //   author: thesis-info.author.name,
  //   // keywords: thesis-info.abstract.keywords,
  // )
  
  set page(
    paper: "a4",                // 设置纸张为 A4
    margin: (                   // 自定义边距
      top: 2.5cm,               // 上边距 2.5cm
      bottom: 2.5cm,            // 下边距 2.5cm
      left: 3.0cm + 0.5cm,      // 左边距 3.0cm，加上装订线 0.5cm
      right: 2.5cm              // 右边距 2.5cm
    ),
  )

  counter(page).update(1)

  // 章节计数器，记录公式层级
  let counter_chapter   = counter("chapter")
  let counter_equation  = counter(math.equation)
  let counter_image     = counter(figure.where(kind: image))
  let counter_table     = counter(figure.where(kind: table))
  
  // 假段落，附着于 heading 之后可以实现首行缩进
  let empty-par = par[#box()]
  let fake-par = context empty-par + v(-measure(empty-par + empty-par).height)


  
  // 毕业论文（设计）正文文本：小四号，多倍行距值1.25，段前0行，段后0行，首行缩进2个字符
  set par(
    leading: 1.25em,
    first-line-indent: 2em,
    justify: false,
  )

  // // 标题样式设置
  // 各级标题理科顶格，文科缩进2个字符。
  // ①章标题 三号加粗，多倍行距值1.25，段前20磅，段后10磅
  // ②节标题 四号加粗，多倍行距值1.25，段前0.5行，段后0.5行。
  // ③条标题 小四号加粗，多倍行距值1.25，段前0.5行，段后0.5行。
  // ④款、项标题 小四号，多倍行距值1.25，段前0行，段后0行。

  set heading(depth: 4, numbering: { "1.1.1.1 "})
  show heading.where(level: 1): set heading(numbering: (n) => "第" + numbering("1", n) + "章")

  show heading: set par(leading: 1.25em) 
  show heading: set text(font: 字体.宋体, weight: "bold")
  
  show heading.where(level: 1): set text(size: 字号.sanhao)
  show heading.where(level: 2): set text(size: 字号.sihao)
  show heading.where(level: 3): set text(size: 字号.xiaosi)
  show heading.where(level: 4): set text(size: 字号.xiaosi)
  
  show heading: it =>  {
    if it.level == 1 { // 一级标题样式
      pagebreak() // 大标题新开一页
      set align(center)
      v(20pt) // 段前20磅
      it
      v(10pt) // 段后10磅  
    } else if it.level == 2 { // 二级标题样式
      v(0.5em) // 段前0.5行
      it
      v(0.5em) // 段后0.5行
    } else if it.level == 3 {
      v(0.5em) // 段前0.5行
      it
      v(0.5em) // 段后0.5行
    } else if it.level == 4 {
      it
    }
  }

  // 通过插入假段落修复
  show heading: it => {
    it
    fake-par
  }

  // 遇到一级标题重置图、表、公式编号计数
  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure
  show math.equation: i-figured.show-equation

  // 图题、表题 宋体五号 - 五号宋体加粗居中，行距1.25倍，段前0行，段后0.5行，成文删除
  show figure.caption: set text(font: 字体.宋体, size: 字号.wuhao, weight: "bold")
  show figure.caption: set par(leading: 1.25em) 
  show figure.caption: it => {
    it
    v(0.5em)
  }
  // 标题放置在表格上方 - 五号宋体加粗居中，行距1.25倍，段前0.5行，段后0行
  show figure.where(kind: table): set text(font: 字体.宋体, size: 字号.wuhao)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): it => {
    v(0.5em)
    it
  }

  // ----------- 开始渲染 ----------- //

  titlepage(info: thesis-info) // 第一页
  declaration() // 第二页
  copyright() // 第三页
  abstract(abstract: thesis-abstract) // 第四、五页

  toc() // 目录
  
  {  
    // 页眉 - 页眉：毕业设计（论文）从正文开始到致谢为止加页眉页脚，附录不加。页眉为毕业设计（论文）的题目，宋体小五，居中。
    set page(
      header: {
        set align(center)
        for part in thesis-info.title {
          text(font: 字体.宋体, 字号.xiaowu, baseline: 8pt, spacing: 3pt)[#part]
        }
        line(length: 100%, stroke: 0.1pt)
      }
    )
    // 脚注、尾注 宋体小五号
    show footnote.entry: set text(font: 字体.宋体, size: 字号.xiaowu)

    show raw.where(block: false): box.with(
      fill: luma(240),
      inset: (x: 3pt, y: 0pt),
      outset: (y: 3pt),
      radius: 2pt,
    )
    
    // Display block code in a larger block
    // with more padding.
    show raw.where(block: true): block.with(
      fill: luma(240),
      inset: 0.4em,
      radius: 4pt,
    )

    content

    // 参考文献
    {
      // 参考文献内容 宋体五号
      set text(font: 字体.宋体, size: 字号.wuhao)
      bilingual-bibliography(bibliography: bibliography, full: true)
    }

    // 致谢
    acknowledgement-page()
    pagebreak(weak: true)

  }

    // 附录
  if appendix {
    appendix-part()
    pagebreak(weak: true)
  }
}
