#import "../font.typ": *

#let titlepage( info: (:) ) = {
  set text(font: 字体.宋体)
  v(52pt)
  align(center)[#text(size: 字号.yihao, font: 字体.宋体, weight: "bold")[广州航海学院]]
  align(center)[#text(size: 字号.xiaochu, font: 字体.宋体, weight: "bold")[毕业设计（论文）]]
  
  v(22.5pt)
  
  set align(center + horizon)
  for part in info.title {
    text(size: 字号.erhao, font: 字体.宋体)[ #part ]
    linebreak()
  }
  
  v(55.5pt)
  
  set text(font: 字体.宋体, size: 字号.sanhao)
  figure(
    align(center)[#table(
        columns: (17.54%, 36.75%, 17.24%, 28.47%), align: (auto, auto, auto, auto,), 
        text(font: 字体.宋体, size: 字号.sanhao, weight: "regular")[专业：], 
        [#rect(
          width:100%, 
          inset: 2pt, 
          stroke:(bottom:1pt+black),
          text(bottom-edge:"descender", font: 字体.宋体, size: 字号.sanhao, weight: "regular")[#info.author.major])], 
        text(font: 字体.宋体, size: 字号.sanhao, weight: "regular")[班级：], 
        [#rect(
          width:100%, 
          inset: 2pt, 
          stroke:(bottom:1pt+black),
          text(bottom-edge:"descender", font: 字体.宋体, size: 字号.sanhao, weight: "regular")[#info.author.grade])], 
        text(font: 字体.宋体, size: 字号.sanhao, weight: "regular")[姓名：], 
        [#rect(
          width:100%, 
          inset: 2pt, 
          stroke:(bottom:1pt+black),
          text(bottom-edge:"descender", font: 字体.宋体, size: 字号.sanhao, weight: "regular")[#info.author.name])], 
        text(font: 字体.宋体, size: 字号.sanhao, weight: "regular")[学号：], 
        [#rect(
          width:100%, 
          inset: 2pt, 
          stroke:(bottom:1pt+black),
          text(bottom-edge:"descender", font: 字体.宋体, size: 字号.sanhao, weight: "regular")[#info.author.sno])], 
        text(font: 字体.宋体, size: 字号.sanhao, weight: "regular")[导师：], 
        [#rect(
          width:100%, 
          inset: 2pt, 
          stroke:(bottom:1pt+black),
          text(bottom-edge:"descender", font: 字体.宋体, size: 字号.sanhao, weight: "regular")[#info.supervisor.at(0)])], 
        text(font: 字体.宋体, size: 字号.sanhao, weight: "regular")[职称：], 
        [#rect(
          width:100%, 
          inset: 2pt, 
          stroke:(bottom:1pt+black),
          text(bottom-edge:"descender", font: 字体.宋体, size: 字号.sanhao, weight: "regular")[#info.supervisor.at(1)])], 
        stroke: none,
      )], kind: table,
  )
  v(56pt)
  align(center)[#text(字号.erhao, weight: "bold")[（#info.author.department）]]
  v(14pt)
  align(center)[#text(字号.sanhao, weight: "bold")[二〇二三年六月]]
  pagebreak()
}