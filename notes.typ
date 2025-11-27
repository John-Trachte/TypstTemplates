/**
* Use this template by including `#import "notes.typ": * 
*                                 #show: notes.with(
*                                   description
*                                     [description]
*                                 )`
**/

#let notes(
  description: [*Change me to something relevant*],
  body,
) = {
  set heading(numbering: "1.1.1")
  
  show heading.where(level:1): it => {
    counter(math.equation).update(0)
    it
  }
  set math.equation(numbering: n => {
    numbering("(1.1)", counter(heading).get().first(), n)
  })
  
  // Full width outline
  set page(
    paper: "us-letter",
    columns: 1,
    header: context {
        align(right, text(10pt)[
          #description
      ])
    }
  )
  
  outline()
  
  set page(
    paper: "us-letter",
    columns: 2,
    numbering: "1",
    header: context {
        align(right, text(10pt)[
          #description
      ])
    }
  )

  counter(page).update(1)

  body
}
