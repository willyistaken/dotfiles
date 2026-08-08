// Homework Template for Typst
// Usage: #import "homework.typ": *

#let groupaction = symbol("↷",("l","↶"))
// Global counters
#import "@preview/algo:0.3.6": algo, i, d, comment, code

// theorion
#import "@preview/theorion:0.4.0": *
#import cosmos.rainbow: *


#let question-counter = counter("question")
#let part-counter = counter("part")
// Document setup function
#let bakcol = state("color",rgb(0,0,0))
#let frocol = state("color",rgb(255,255,255))
#let homework(
  class: "",
  name: "",
  studentId: "",
  department: "",
  type: "Homework",
  num: "",
  backcolor:rgb(0,0,0),
  frontcolor:rgb(0,0,0),
  anonymous: false,
  body
) = {
  // Page setup
  bakcol.update(backcolor)
  frocol.update(frontcolor)
  let margin-size =  1in 
  show math.equation: set block(breakable:true)
  show math.equation.where(block:false):math.display

  set text(fill: frontcolor)
  set page(
      background: 
      context {
[
    #rect(
  width:100% ,
  height: 100%,
  fill: backcolor,
  stroke: none,
  inset: 0pt,
)
  ] }
,
    margin: (left:margin-size/2,right:margin-size/2,rest:margin-size),
    header: if not anonymous {
      context {
        if counter(page).get().first() > 1 [
          #set text(size: 10pt)
          #grid(
            columns: (1fr, 1fr, 1fr),
            align: (left, center, right),
            [#class],
            [#name (#studentId)],
            [#type #num]
          )
        #line(length: 100%,stroke:1pt + frocol.get()) 
        ]
      } 
    } else{
    context {
        if counter(page).get().first() > 1 [
          #set text(size: 10pt)
          #grid(
            columns: (1fr,  1fr),
            align: (left, right),
            [#class],
            [#type #num]
          )
          #line(length: 100%,stroke:1pt + frocol.get()) 
        ]
      }
    }
    ,
    footer: context {
      if counter(page).get().first() > 1 [
        #align(center)[#counter(page).display()]
      ]
    }
  )
  
  // Text formatting
  set par(
    leading: 0.65em,
    spacing: 1.2em,
    justify: false
  )
  
  // Link styling
  show link: set text(fill: rgb("#008080"))
  
  // Store template options in metadata for later use
  metadata((
    anonymous: anonymous
  ))
  
  // Title page
  if not anonymous [
    #align(center)[
      #text(size: 16pt, weight: "bold")[#class #type #num]
      
      #name #department
      
      #studentId
      
      #datetime.today().display("[year]/[month]/[day]")
    ]
    #v(1em)
  ] else [
    #align(center)[
      #text(size: 16pt, weight: "bold")[#class #type #num]
    ]
  ]
  
  body
}

#let alpha-state = state("alpha", false)
#let question(title: none, shift: 0,nonum: false,rev: false) = {
  // Add page break if requested
  
  question-counter.step()
  part-counter.update(0)
  alpha-state.update(false)
  
  v(0.2in)
  
  // Question header
  context {
    if nonum {
      if title != none [
        #text(weight: "bold")[#title]
      ] 
    }else{
      if title == none [
        #text(weight: "bold")[Question #(question-counter.get().first()+shift) .]
      ] else {
        if not rev [
          #text(weight: "bold")[#(question-counter.get().first()+shift). #title]
        ] else [
          #text(weight: "bold")[#title#(question-counter.get().first()+shift)]
        ]
      }
    }
  }
  
  context{
    line(length: 100%,stroke:1pt + frocol.get()) 
  }
  v(0.1in)
}
#let part(start: -1, alpha: none, body) = {
  if start != -1 {
    part-counter.update(start)
  } else {
    part-counter.step()
  }
  if alpha != none {
      alpha-state.update(alpha)
  }
  context {
  block(inset: (left: 1.5em, top: 0.4em))[
    (*#part-counter.display(if alpha-state.get() { "a" } else { "1" })).* #body
  ]
  }

}


// Question part command - creates a list item with +
#let bigbox(content) = {
  v(0.5em)
  context{
  rect(
    width: 100%,
    stroke: 1pt+frocol.get(),
    inset: 8pt,
    content
  )
  }
  v(0.5em)
}

// inner product
#let inner(x, y) = $chevron.l #x, #y chevron.r$





// Utility functions for backwards compatibility
#let hwclass() = ""
#let hwname() = ""  
#let hwnumber() = ""
#let hwdepartment() = ""
#let hwtype() = ""
#let hwnum() = ""
