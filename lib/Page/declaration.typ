#import "../font.typ": *

#let declaration(
) = {
  // ---------- 第二页 ---------- //
  v(22pt)
  
  align(center, text(font: 字体.宋体, size: 字号.erhao, weight: "bold")[学位论文原创性声明])

  v(14pt)
  
  set text(font: 字体.宋体, size: 字号.sihao)
  par(
    leading: 2em,
    first-line-indent: 2em,
    justify: true,
  )[本人郑重声明：所呈交的学位论文，是本人在导师指导下，进行研究工作所取得的成果。除文中已经注明引用的内容外，本学位论文的研究成果不包含任何他人或集体已经发表或撰写过的作品成果。对本学位论文所涉及的研究工作做出贡献的其他个人和集体，均已在文中以明确方式标明。本学位论文原创性声明的法律责任由本人承担。]

  v(42pt)
  
  align(right + top,
    box(
      grid(
        columns: (auto, auto),
        gutter: 2em,
        "作者签名：", "",
        "日" + h(2em) + "期：", h(2.5em) + text("年") + h(2em) + text("月") + h(2em) + text("日")
      )
    )
  )
  
  pagebreak()

}