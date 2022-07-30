# HTML Cheatsheet

HTML stands for **H**yper**T**ext **M**arkup **L**anguage

## Structure

- `<html>` and `</html>` contain everything
- `<head>` and `</head>` contain title
- `<title>` and `</title>` include title
- `<body>` and `</body>` contain the main parts

## Elements

- Paragraph: `<p>` and `</p>`
- Line break: `<br/>`
- Horizontal line: `<hr/>`
- Comments: `<!-- Comments -->`
- Image: `<img src="image.png"/>`
- Link: `<a href="http://google.com">` and `</a>`
- Form: `<form>` and `</form>`
- Input: `<input/>` (in forms)
- Color: `#FFFFFF`


#### Text Formatting

- bold `<b>` `</b>`
- big `<big>` `</big>`
- italic `<i>` `</i>`
- small `<small>` `</small>`
- strong `<strong>` `</strong>`
- subscripted `<sub>` `</sub>`
- superscripted `<sup>` `</sup>`
- inserted (underlined) `<ins>` `</ins>`
- deleted `<del>` `</del>`

#### Headings

- `<h1>` and `</h1>`
- `<h2>` and `</h2>`
- ...
- `<h6>` and `</h6>`

equals to \#'s in Markdown

#### Lists

Ordered list
```html
<ol>
    <li> </li>
    <li> </li>
</ol>
```
Unordered List
```html
<ul>
    <li> </li>
    <li> </li>
</ul>
```

#### Tables
```html
<table>
<caption> </caption>
    <tr>
        <td> </td>
        <td> </td>
    </tr>
    <tr>
        <td> </td>
        <td> </td>
    </tr>
</table>
```
`tr` for *table row* and `td` for *table data*

#### Divisions

`<div>` and `</div>` block division

`<span>` and `</span>` inline division

#### Frames

```html
<frameset cols="25%,50%,25">
    <frame src="a.html"/>
    <frame src="b.html"/>
    <frame src="c.html"/>
</frameset>
```

## Attributes

```html
<p align="center">
<hr width="50px"/>
<hr width="50%" align="left"/>
<img src="image.png" height="150px" width="50px" border="1px" alt=""/>
<a href="http://google.com" target="_blank">
<table border="2">
<td colspan="2" bgcolor="red">
<span style="color:red">
<form action="http://google.com">
<input type="text"/>
<input type="submit" value="Submit"/>
<font color="#FFFFFF">
```


## HTML5 Features

#### Structure
```html
<!DOCTYPE HTML>
<html>
    <head>
        <title> </title>
    </head>
    <body>
        <header> </header>
        <nav> </nav>
        <article>
            <section> </section>
        </article>
        <aside> </aside>
        <footer> </footer>
    </body>
</html>
```

#### Elements

- audio
  ```html
  <audio src="audio.mp3" controls autoplay loop> </audio>
  ```
- video
  ```html
  <video> </video>
  ```
- progress
  ```html
  <progress min="0" max="100" value="45"> </progress>
  ```
- SVG **S**calable **V**ector **G**raphics  
  ```html
  <svg width="1000" height="1000">
      <circle cx="80" cy="80" r="50" fill="green" />
      <rect width="150" height="100" x="20" y="20" fill="green" />
      <line x1="10" y1="10" x2="100" y2="100" style="stroke:#000000; stroke-linecap:round; stroke-width:20" />
      <polyline style="stroke-linejoin:miter; stroke:black; stroke-width:12; fill: none;" points="100 100, 150 150, 200 100" />
      <ellipse cx="200" cy="100" rx="150" ry="70" style="fill:green" />
      <polygon points="100 100, 200 200, 300 0" style="fill: green; stroke:black;" />
  </svg>
  ```
- canvas
  ```html
  <canvas id="canvas1" width="200" height="100"> </canvas>
  ```
- form
  ```html
  <form>
    <label for="email">Your e-mail address: </label>
    <input type="text" name="email" placeholder="email@example.com" autofocus required/>
    <input id="car" type="text" list="colors" />
    <datalist id="colors">
      <option value="Red">
      <option value="Green">
      <option value="Yellow">
    </datalist>
  </form>
  ```
  **new input types**
    - color
    - date
    - datetime
    - datetime-local
    - email
    - month
    - number
    - range
    - search
    - tel
    - time
    - url
    - week
