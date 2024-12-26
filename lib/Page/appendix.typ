// Edited From https://github.com/sysu/better-thesis
#import "../font.typ": *

#import "@preview/numblex:0.1.1": numblex
#import "@preview/i-figured:0.2.4"

#let appendix-content = state("appendix", [
= 

对于一些不宜放在正文中的重要支撑材料，可编入毕业论文的附录中，包括某些重要的原始数据、详细数学推导、程序全文及其说明、复杂的图表、设计图纸等一系列需要补充提供的说明材料。
#figure(
  table(
      columns: (41.64%, 31.06%, 0.36%, 20.42%, 6.52%), align: (center, center, center, center, center,), table.cell(align: center)[字段名称], table.cell(align: center, colspan: 2)[中文描述], table.cell(align: center)[类型], table.cell(align: center)[长度], table.cell(align: center)[ID], table.cell(align: center, colspan: 2)[ID], table.cell(align: center)[NUMBER], table.cell(align: center)[15], table.cell(align: center)[COMPANY\_ID], table.cell(align: center, colspan: 2)[公司ID], table.cell(align: center)[VARCHAR2], table.cell(align: center)[60], table.cell(align: center)[LOGISTER\_AGENT], table.cell(align: center, colspan: 2)[委托代理人], table.cell(align: center)[VARCHAR2], table.cell(align: center)[60], table.cell(align: center)[SHORT\_NAME], table.cell(align: center, colspan: 2)[物流商简称], table.cell(align: center)[VARCHAR2], table.cell(align: center)[60], table.cell(align: center)[BUSINESS\_FIELD], table.cell(align: center, colspan: 2)[行业类别], table.cell(align: center)[VARCHAR2], table.cell(align: center)[10], table.cell(align: center)[WAY\_VEHICLE], table.cell(align: center, colspan: 2)[公路运输], table.cell(align: center)[VARCHAR2], table.cell(align: center)[10], table.cell(align: center)[WAY\_TRAIN], table.cell(align: center, colspan: 2)[铁路运输], table.cell(align: center)[VARCHAR2], table.cell(align: center)[10], table.cell(align: center)[WAY\_SHIP], table.cell(align: center, colspan: 2)[船舶运输], table.cell(align: center)[VARCHAR2], table.cell(align: center)[10], table.cell(align: center)[WAY\_PIPELINE], table.cell(align: center, colspan: 2)[管道运输], table.cell(align: center)[VARCHAR2], table.cell(align: center)[10], table.cell(align: center)[WAY\_CONTAINER], table.cell(align: center, colspan: 2)[集装箱运输], table.cell(align: center)[VARCHAR2], table.cell(align: center)[10], table.cell(align: center)[WAY\_OTHERS], table.cell(align: center, colspan: 2)[其他运输方式], table.cell(align: center)[VARCHAR2], table.cell(align: center)[60], table.cell(align: center)[FAX], table.cell(align: center, colspan: 2)[传真], table.cell(align: center)[DATE], table.cell(align: center)[], table.cell(align: center)[SETUP\_DATE], table.cell(align: center, colspan: 2)[成立日期], table.cell(align: center)[VARCHAR2], table.cell(align: center)[60], table.cell(align: center)[BUSINESS\_LICENSECODE], table.cell(align: center, colspan: 2)[营业执照号码], table.cell(align: center)[DATE], table.cell(align: center)[\_\_], table.cell(align: center)[BUSINESS\_LICENSEDATE], table.cell(align: center, colspan: 2)[营业执照有效期], table.cell(align: center)[VARCHAR2], table.cell(align: center)[60], table.cell(align: center)[GAS\_LICENSECODE], table.cell(align: center, colspan: 2)[许可证号码], table.cell(align: center)[DATE], table.cell(align: center)[\_\_], table.cell(align: center)[GAS\_LICENSEDATE], table.cell(align: center, colspan: 2)[许可证有效期], table.cell(align: center)[VARCHAR2], table.cell(align: center)[60], table.cell(align: center)[HAZARD\_LICENSECODE], table.cell(align: center, colspan: 2)[化学危险品经营许可证号码], table.cell(align: center)[DATE], table.cell(align: center)[\_\_], table.cell(align: center)[HAZARD\_LICENSEDATE], table.cell(align: center, colspan: 2)[化学危险品经营许可证有效期], table.cell(align: center)[VARCHAR2], table.cell(align: center)[60], table.cell(align: center)[STATE\_TAXACCOUNT], table.cell(align: center, colspan: 2)[国税税号], table.cell(align: center)[VARCHAR2], table.cell(align: center)[60], table.cell(align: center)[CREATE\_USERID], table.cell(align: center)[创建人], table.cell(align: center, colspan: 2)[NUMBER], table.cell(align: center)[15],
    ),
    caption: [企业信息表]
)
如果毕业论文中引用的实例、数据资料，实验结果等符号较多时，为了节约篇幅，便于读者查阅，可以编写一个符号说明，注明符号代表的意义。附录的篇幅不宜太多，一般不超过正文。此项不是必需项，空缺时可以省略。

=

欢迎访问：`https://remoooo.com/`。
=
欢迎访问：`https://remoooo.com/`。
])

#let appendix(
  body
) = {
  context appendix-content.update(body)
}

#let appendix-part() = {
  // 致谢、附录内容	宋体小四号
  set text(font: 字体.宋体, size: 字号.xiaosi)

  // 附录标题中不需要分隔中英文
  show heading: set text(cjk-latin-spacing: none)

  // 致谢、附录标题 黑体三号居中
  show heading.where(level: 1): set text(font: 字体.宋体, size: 字号.sanhao)

  // 目录仅展示附录章标题
  // 论文附录依次用大写字母“附录A、附录B、附录C……”表示，附录内的分级序号可采用“附A1、
  // 附A1.1、附A1.1.1”等表示，图、表、公式均依此类推为“图A1、表A1、式A1”等。
  show heading.where(level: 1): set heading(numbering: "附录A", outlined: true)
  show heading.where(level: 2): set heading(numbering: "附A1", outlined: false)
  show heading.where(level: 3): set heading(numbering: "附A1.1", outlined: false)
  show heading.where(level: 4): set heading(numbering: "附A1.1.1", outlined: false)

  show figure: i-figured.show-figure.with(numbering: "A.1")
  show math.equation: i-figured.show-equation.with(numbering: "(A.1)")

  // 重置 heading 计数
  counter(heading).update(0)

  // 假段落，附着于 heading 之后可以实现首行缩进
  let empty-par = par[#box()]
  let fake-par = context empty-par + v(-measure(empty-par + empty-par).height)

  // 通过插入假段落修复[章节第一段不缩进问题](https://github.com/typst/typst/issues/311)
  show heading.where(level: 1): it => {
    it
    fake-par
  }

  context appendix-content.final()
}
