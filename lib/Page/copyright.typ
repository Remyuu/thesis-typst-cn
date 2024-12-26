#import "../font.typ": *

#let copyright(
) = {
  v(22pt)
  align(center, text(font: 字体.宋体, size: 字号.erhao, weight: "bold")[学位论文版权使用授权书])
  v(14pt)

  set text(font: 字体.宋体, size: 字号.sihao)
  par(
    leading: 2em,
    first-line-indent: 2em,
    justify: true,
  )[
    本学位论文作者完全了解学校有关保留、使用学位论文的规定，同意按照学校要求提交学位论文的印刷本和电子版本，学校有权保存并向国家有关部门或机构送交论文的印刷本、复印件和电子版，允许论文被查阅和借阅。本人授权广州航海学院将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。
    #v(42pt)
    本学位论文属于
    
    保#h(1em)密 #box(baseline: 13%, stroke: 1pt, width: 14pt, height: 14pt)[] ， 在\_\_\_年解密后适用本授权书。

    不保密 #box(baseline: 13%, stroke: 1pt, width: 14pt, height: 14pt)[] 。
    #v(14pt) #v(14pt) #v(14pt)
  ]
  align(left + top,
    box(
      grid(
        columns: 2,
        gutter: 5em,
          grid(
            columns: 2,
            gutter: 0em,
            "作者签名："+v(4em), "",
            "日期：", h(2em) + text("年") + h(1em) + text("月") + h(1em) + text("日"),
          ),
          grid(
            columns: 2,
            gutter: 0em,
            "指导教师签名："+v(4em), "",
            "日期：", h(1em) + text("年") + h(1em) + text("月") + h(1em) + text("日"),
          ),
      ),
    )
  )

  pagebreak()
}