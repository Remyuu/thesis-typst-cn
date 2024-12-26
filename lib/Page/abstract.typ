#import "../font.typ": *

#let abstract(
  abstract:(:)
) = {
  // 中文摘要标题 - 三号宋体，加粗，居中，段前20磅，段后10磅，无缩进，“摘”和“要”之间空4格（两个字符）。
  v(20pt) // 段前20磅
  align(center, text(font: 字体.宋体, size: 字号.sanhao, weight: "bold")[摘 #h(2em) 要])
  v(10pt) // 段后10磅

  // 中文摘要内容 - 小四号、宋体，首行缩进2个字符，段前段后0行，多倍行距1.25。
  for part in abstract.abstract {
    set par(
      leading: 1.25em,
      first-line-indent: 2em,
      justify: true,)
    text(font: 字体.宋体, size: 字号.xiaosi)[ #part ]
    linebreak()
  }
  // 中文关键词 - 摘要内容之后隔一行书写，顶格、加粗、小四号、宋体。各关键词之间用分号，最后一个关键词后不加标点。
  v(字号.xiaosi) // 隔一行
  set par(first-line-indent: 0em)
  text(font: 字体.宋体, size: 字号.xiaosi, weight: "bold")[关键词： ]
  text(font: 字体.宋体, size: 字号.xiaosi, weight: "bold")[#abstract.keywords.join("； ")]

  pagebreak()

  // 英文摘要 - 英文摘要用Time New Roman字体，其他排版要求与中文摘要相同。

  v(20pt) // 段前20磅
  align(center, text(font: 字体.新罗马体, size: 字号.sanhao, weight: "bold")[ABSTRACT])
  v(10pt) // 段后10磅

// 摘要内容
  for part in abstract.abstract-en {
    set par(
      leading: 1.25em,
      first-line-indent: 2em,
      justify: true,)
    text(font: 字体.新罗马体, size: 字号.xiaosi)[ #part ]
    linebreak()
  }
  // 关键词
  v(字号.xiaosi) // 隔一行
  set par(first-line-indent: 0em)
  text(font: 字体.新罗马体, size: 字号.xiaosi, weight: "bold")[Keywords: ]
  text(font: 字体.新罗马体, size: 字号.xiaosi, weight: "bold")[#abstract.keywords-en.join(", ")]

  // 这个地方和标准不同，在英语环境下应该使用逗号来分割（？）

  pagebreak()
}

