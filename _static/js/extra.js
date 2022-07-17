// Render KaTeX, supports instant mode
document$.subscribe(() => {
  renderMathInElement(document.body, {
    delimiters: [
      {left: '$', right: '$', display: false},
      {left: '$$', right: '$$', display: true},
      {left: '\\(', right: '\\)', display: false},
      {left: '\\[', right: '\\]', display: true},
    ]
  });
})
