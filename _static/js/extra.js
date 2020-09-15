// KaTeX Rendering
document.addEventListener('DOMContentLoaded', function() {
  renderMathInElement(document.body, {
    delimiters: [
      {left: '$', right: '$', display: false},
      {left: '$$', right: '$$', display: true},
      {left: '\\(', right: '\\)', display: false},
      {left: '\\[', right: '\\]', display: true},
    ]
  });
});
