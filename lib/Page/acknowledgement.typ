#import "../font.typ": *

// 致谢内容 - 致谢标题：三号宋体，加粗，居中，段前20磅，段后10磅，1.25倍行距。“致”和“谢”之间空4格（两个字符）。

#let acknowledgement-content = state("acknowledgement", [
致谢应以简短的文字对课题研究与论文撰写过程中曾直接给予帮助的人员(例如指导教师、答疑教师
及其他人员)表达自己的谢意，这不仅是一种礼貌，也是对他人劳动的尊重，是治学者应当遵循的学
术规范。内容限一页。
])

#let acknowledgement(
  body
) = {
  context acknowledgement-content.update(body)
}

#let acknowledgement-page() = {
  // 致谢、附录内容	宋体小四号
  set text(font: 字体.宋体, size: 字号.xiaosi)

  // 致谢、附录标题 黑体三号居中
  show heading.where(level: 1): set text(font: 字体.宋体, size: 字号.sanhao)

  // 致谢标题不编号
  show heading.where(level: 1): set heading(numbering: none)


  // 假段落，附着于 heading 之后可以实现首行缩进
  let empty-par = par[#box()]
  let fake-par = context empty-par + v(-measure(empty-par + empty-par).height)
  
  // 通过插入假段落修复[章节第一段不缩进问题](https://github.com/typst/typst/issues/311)
  show heading.where(level: 1): it => {
    it
    fake-par
  }

  [
    = 致 #h(2em) 谢

    #set par(first-line-indent: 2em)
    #context acknowledgement-content.final()

    #v(1em)

  ]
}
