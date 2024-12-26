#import "../font.typ": *

#import "@preview/outrageous:0.1.0"

// 目录生成
#let toc(
  // lib 传入参数
  twoside: false,
  fonts: (:),
  // 其他参数
  depth: 4,
  // 目录标题：三号宋体，加粗，居中，段前20磅，段后10磅，无缩进，“目”和“录”之间空4格；
  title: text(font: 字体.仿宋, weight: "bold")[
    #v(20pt)
    目 #h(4em) 录
    #v(10pt)
  ],
  // 各章题序及其余：仿宋小四，间距1.25；自动生成，段前段后0磅；一级标题空2个字符（空4格），二级标题空4个字符（空8格），三级标题空6个字符（空12格）。 
  outlined: false,
  title-vspace: 0em,
  title-text-args: auto,
  // 引用页数的字体，这里用于显示 Times New Roman
  reference-font: auto,
  reference-size: 字号.xiaosi,
  // 字体与字号
  font: auto,
  size: (字号.xiaosi, ),
  // 垂直间距
  vspace: (1.25em, 1.25em, 1.25em, 1.25em),
  indent: (0pt, 2em, 2em, 2em),
  // 全都显示点号
  fill: (auto,),
  ..args,
) = {


  //====================================================
  // 用于创建一个不可见的标题，用于给 outline 加上短标题
  let invisible-heading(..args) = {
    set text(size: 0pt, fill: white)
    heading(numbering: none, ..args)
  }
  
  // 1.  默认参数
  fonts = 字体 + fonts
  if (title-text-args == auto) {
    title-text-args = (
      font: fonts.仿宋, 
      size: 字号.sanhao, 
      weight: "bold",
      bottom-edge: "descender", top-edge: "ascender",
    )
  }
  // 引用页数的字体，这里用于显示 Times New Roman
  if (reference-font == auto) {
    reference-font = fonts.仿宋
  }
  // 字体与字号
  if (font == auto) {
    font = (fonts.仿宋, fonts.仿宋, fonts.仿宋)
  }

  // 2.  正式渲染
  pagebreak(weak: true, to: if twoside { "odd" })

  // 默认显示的字体
  set text(font: reference-font, size: reference-size)

  {
    set align(center)
    // set par(spacing: 1em)
    text(..title-text-args, title)
    // 标记一个不可见的标题用于目录生成
    // invisible-heading(level: 1, outlined: outlined, title)
  }

  v(title-vspace)

  show outline.entry: outrageous.show-entry.with(
    // 保留 Typst 基础样式
    ..outrageous.presets.typst,
    body-transform: (level, it) => {
      // 设置字体和字号
      set text(
        font: font.at(calc.min(level, font.len()) - 1),
        size: size.at(calc.min(level, size.len()) - 1),
      )
      let indent-list = indent + range(level - indent.len()).map((it) => indent.last())
      let indent-length = indent-list.slice(0, count: level).sum()
      h(indent-length) + it
    },
    vspace: vspace,
    fill: fill,
    ..args,
  )

  // 显示目录
  outline(title: none, depth: depth)

}