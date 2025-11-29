#let ieee(
  title: [*Relevant Title to What We're Doing Today*],
  description: [*Class Design Project number Something*],
  abstract: [Lorem ipsum CHANGE ME lorem ipsum],
  byline: [*Person, Association, Place*],
  body,
) = {
  set heading(numbering: "I")
  show heading: it => align(center, smallcaps[#it]) 
  show heading: set text(weight: "regular")
  
  set par(first-line-indent: (amount: 2em, all:true))
  set math.equation(numbering: "(1)")
  
  set page(
    paper: "us-letter",
    columns: 2,
    numbering: "1",
    header: context {
      if(counter(page).get().at(0)==1) [
        #align(left, text(10pt)[
          #description
        ])
      ]
    }
  )
  
  // title
  place(
    top + center, 
    float: true,
    scope: "parent", 
    clearance: 2em,
  )[
    #par(justify:true, text(24pt)[
      *#title*  
    ])
  ]
  
  // byline
  place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 2em,
  )[
    #par(justify: true, text(10pt)[
      #byline
    ])
  ]
  
  text(10pt)[
  
    #par(justify:true)[
      *_Abstract_ -  // 150 - 250 words
      #abstract
      * _(Abstract)_
    ]
  
    #body
  
    = References
      \[1\] “DigiKey Home,” DigiKey, https://www.digikey.com/ (accessed #datetime.today().display("[month repr:long]") #datetime.today().day(), #datetime.today().year()). \ // reference I use a lot as an example
  ]
}
