# CSS Cheatsheet

CSS stands for **C**ascading **S**tyle **S**heet  
Function: separate style from content in HTML  

## CSS Types


**Inline CSS**  
*CSS applied to a single element*
```css
<p style="color:white; background-color:gray;"> 
</p>
```

**Embedded CSS**  
*CSS defined in a `<style>` tag*
```css
<html>
   <head>
      <style>
      p {
         color:white;
         background-color:gray;
      }
      </style>
   </head>
   <body>
      <p>This is my first paragraph. </p>
      <p>This is my second paragraph. </p>
   </body>
</html>
```

**External CSS**  
*CSS saved in `.css` files*  

The HTML
```html
<head>
   <link rel="stylesheet" href="example.css">
</head>
<body>
   <p>This is my first paragraph.</p>
   <p>This is my second paragraph. </p>
   <p>This is my third paragraph. </p>
</body>
```
The CSS
```css
p {
   color:white;
   background-color:gray;
}
```

---

## CSS Selectors

```css
   h1   { color: orange; }
Selector Property Value
```

**Type selectors**  
*Style targeting all the items of one kind of element*
```css
p {
   color: red;
   font-size:130%;
}
```
This targets all the paragraphs on the page.  

**ID selectors**  

The HTML
```html
<div id="intro">
   <p> This paragraph is in the intro section.</p>
</div>
```

The CSS
```css
#intro {
   color: white;
   background-color: gray;
}
```

**Class selectors**  

The HTML
```html
<div>
   <p class="first">This is a paragraph</p>
</div>
```

The CSS
```css
.first {font-size: 200%;}
```

**Descendant Selectors**  
*CSS targeting contents in `<em>` tags*

The HTML
```html
<div id="intro">
   <p class="first">This is a <em> paragraph.</em></p>
</div>
```

The CSS
```css
#intro .first em {
   color: pink; 
   background-color:gray;
}
```
---

**Comments**
```css
/* Comment goes here */
```

**Inheritance**  
*A child element will usually take on the characteristics of the parent element unless otherwise defined.*  

---

## Text Styles

**Font family**  

The HTML
```html
<p class="sansserif">
   This is a paragraph shown in sans-serif font.
</p> 
<p class="monospace">
   This is a paragraph shown in monospace font.
</p> 
```

The CSS
```css
p.sansserif {
   font-family: Helvetica, Arial, sans-serif;
}
p.monospace {
   font-family: "Courier New", Courier, monospace;
}
```
It obeys 'fallback' rule

**Font size**

The CSS
```css
p.medium {
   font-size: medium;
}
h1 {
   font-size: 20px;
}
```
*Keywords*: `xx-small`, `small`, `medium`, `large`, `larger`, `x-large`  
*`em` = `pixels` / 16*  

**Font style**
```css
font-style: italic;
```
*Keywords*: `normal`, `italic`, `oblique`

**Font weight**
```css
font-weight: bold;
```
*Keywords*: `lighter`, `bold`, `bolder`  
*Values*: `100` (thin) - `900` (thick)  

**Font variant**
```css
font-variant: normal;
```
*Keywords*: `normal`, `small-caps`, `inherit`

**Color**
```css
color: red;
```

*Values*: 

- hexadecimal values `#FFFFFF`  
- keywords `red`
- RGB `rgb(255,0,0)`

**Text align**
```css
text-align: left;
```
*Keywords*: `left`, `center`, `right`

**Vertical align**
```css
vertical-align: top;
```
*Keywords*: `top`, `middle`, `bottom`, `baseline`, `sub`, `super`, `px`(positive and negative)

**Text decoration**
```css
 text-decoration: inherit;
```
*Keywords*: `none`, `inherit`, `overline`, `underline`, `line-through`, `blink`

**Text indent**
```css
 text-indent: 60px;
```

**Text shadow**
```css
text-shadow: 5px 2px 4px grey;
```

*parameters*: X coord., Y coord., blur radius, color

**Text transform**  
```css
transform: capitalize;
<!-- Transforms the first character in each word to uppercase -->
```
*Keywords*: `capitalize`, `uppercase`, `lowercase`

**Letter and word spacing**
```css
letter-spacing: 4px; 
word-spacing: 4px; 
```
*Keywords*: `normal`, `px`(positive and negative)

**White space**
```css
white-space: nowrap; 
```
*Keywords*: 

- `normal`
- `inherit`
- `nowrap` makes the text continue on the same line until a <br> tag is encountered, and also collapses all sequences of whitespace into a single whitespace.
- `pre` text will only wrap on line breaks and white space
- `pre-line` text will wrap where there is a break in code, but extra white space is still ignored
- `pre-wrap` text will wrap when necessary, and on line breaks

---

## Block Styles

**Box structure**

![](./img/cssbox.png){: width=384px}

backgound color covers content and padding

**Border**
```css
border-style: solid;
border-width: 2px;
border-color: blue;
```
or
```css
border: 5px solid green; 
```
*Border-style keywords*: 
`none`, `dotted`, `dashed`, `double`, `groove`, `ridge`, `inset`, `outset`, `hidden`

![](./img/borderstyle.png){: width=280px}

**Width and height**

*Parameters*: `width`, `height`, `min-width`, `max-width`, `min-height`, `max-height`

**Background color**
```css
background-color: rgb(135,206,235);
```

**Background image repeat and attachment**
```css
background-image: url("logo.png");
background-repeat: repeat-x;
background-attachment: fixed;
```
*Background-repeat keywords*: `repeat`, `no-repeat`, `repeat-x`, `repeat-y`, `inherit`  
*Background-attachment keywords*: `fixed`, `scroll`, `inherit`  
can be set for the whole page too.

**List item marker**
```css
list-style-type: lower-alpha;
list-style-image: url("logo.jpg");
list-style-position: inside;
```
*`<ul>` keywords*: `circle`, `square`  
*`<ol>` keywords*: `lower-alpha`, `decimal`, `disc`  

or
```css
list-style: square outside none;
```
type position image

**Table style**
```css
border-collapse: separate;
border-spacing: 20px 40px;
caption-side: top;
empty-cells: hide;
table-layout: auto;
width="10%"
```

*`empty-cells` keywords*: `hide`, `show`  
*`caption-side` keywords*: `top`, `bottom`  
*`table-layout` keywords*: `auto`, `fixed`  

**Link style**  
```css
a:hover {
   color: red;
}
```
*pseudo selectors*:  
`a:link` defines the style for normal unvisited links  
`a:visited` defines the style for visited links  
`a:active` a link becomes active once you click on it  
`a:hover` a link is hovered when the mouse is over it  

```css
text-decoration: none;
```

**Cursor**
```css
cursor:help;
```
*Keywords*: `auto`, `default`, `crosshair`, `move`, `help`, `text`, `wait`, `n-resize`, ..., `w-resize`, `ne-resize`, ..., `sw-resize`, `pointer`, `progress`, `not-allowed`, `no-drop`, `vertical-text`, `all-scroll`, `col-resize`, `row-resize`

---


## Layout

**display**
```css
display:block;
```
*Keywords*: `block`, `inline`, `none`, `list-item`, `table`, `table-cell`, `table-column`, `grid`

**visibility**
```css
visibility: hidden;
```
*Keywords*: `hidden`, `visible`  
*Notes*: `display:none` hides the entire place, while `visibility: hidden` leaves a blank.

**position**
```css
position:static;
```
*Keywords*:

- `static` not affected by `top`, `bottom`, `left`, `right`
- `fixed` specified by `top`, `bottom`, `left`, `right`
- `relative`
- `absolute`

**Floating**  
*Elements that come after the floating element will flow around it.*
```css
img {
   float: right;
}
```
*Keywords*: `none`, `left`, `right`

**Clear**  
*The clear property specifies the sides of an element where other floating elements are not allowed to be.*
```css
clear: both;
```
*Keywords*: `none`, `both`, `left`, `right`  
   
**Overflow**  
*The overflow property specifies the behavior that occurs when an element's content overflows the element's box.*
```css
overflow: scroll;
```
*Keywords*: `visible`(default), `scroll`, `hidden`, `auto`  

**Z-index**
*The z-index property specifies the stack order of an element.*
```css
z-index: 3; 
```
default: later ones are on the top of former ones.
ones of higher index can cover the lower ones.

---

# CSS3 Features

**Vendor prefix / browser prefix**  
```css
-webkit-border-radius: 24px;  
```

- Chrome `-webkit-`  
- Safari `-webkit-`  
- Firefox `-moz-`
- IE and Edge `-ms-`
- Opera `-o-`

**Border radius**  
*rounded corners*
```css
border-radius: 20px;
```
or
```css
border-radius: 0 0 20px 20px;
```
*parameter order*: top-left, top-right, bottom-right, bottom-left  

**Box shadow**  
```css
box-shadow: 10px 10px 5px 5px #888888
inset 10px 10px 5px #888888;
```
*parameter order*: horizontal offset, vertical offset, blur distance, spread distance, color  
inset: inner shadow  
separate different shadows by comma

**Color systems**  

- RGB  
- RGBA  
  The `Alpha` parameter indicates transparency (0 for transparent and 1 for opaque)
- HSL (Hue, Saturation, Lightness)  
  Hue is a degree on the color wheel, 0 (or 360) is red, 120 is green, 240 is blue
- HSLA

**Text shadow** 
```css
text-shadow: 5px 10px 2px #93968f;
text-shadow: none;
```
*parameter order*: X offset, Y offset, blur, color  


**Pseudo-classes**  

The HTML

```html
<div id="parent">
   <p>First paragraph</p>
   <p>Second paragraph</p>
   <p>Third paragraph</p>
</div>
```

The CSS

```css
#parent p:first-child {
   color: green;
   text-decoration: underline;   
}
```

*Commonly used pseudo-classes*: `first-child`, `last-child`

**Pseudo-elements**

- `::first-line` - the first line of the text in a selector  
- `::first-letter` - the first letter of the text in a selector  
- `::selection` - selects the portion of an element that is selected by a user  
- `::before` - inserts some content before an element  
- `::after` - inserts some content after an element  


**Word wrap**
```css
word-wrap: normal;
```
*Keywords*: `normal`, `break-word`


**Linear gradient**
```css
background:linear-gradient(DeepSkyBlue, Black);
```
displays a smooth transtions of multiple colors from top to bottom
```css
linear-gradient(blue 20%, yellow 30%, green 85%);
linear-gradient(bottom left, blue, green, white);
linear-gradient(100deg, blue, green, white);
repeating-linear-gradient(blue, green 20px);
```
`0deg` = `left`

**Radial gradient**
```css
radial-gradient(green, yellow, blue);
radial-gradient(circle, green, yellow, blue);
radial-gradient(top left, green, yellow, blue);
radial-gradient(green 5%, yellow 15%, blue 60%);
```
Default is an ellipse filling the selector

**Background size**
```css
background-size: 100px 100px;
```
*Keywords*: `width and height`, `contain`, `cover`

**Background clip**
```css
background-clip: border-box;
```
*Keywords*:

- `border-box` - (default) the background is painted to the outside edge of the border  
- `padding-box` - the background is painted to the outside edge of the padding  
- `content-box` - the background is painted within the content box  

**Multiple backgrounds**
```css
background-image: url(csslogo.png), url(csscode.jpg);
background-position: right bottom, left top;
```

**Opacity**
```css
opacity: 1;
```

**Transitions**  
*allow one property value change to another value over time*
```css
transition: background-color 5s ease-in;
```
*parameters*: `transition-property`, `transition-duration`, `transition-timing-function`, `transition-delay`  

*`Timing-function` keywords*: `ease`, `ease-in`, `ease-out`, `ease-in-out`, `linear`, `cubic-bezier(n,n,n,n)`;  

**Transforms**
```css
transform: rotate(10deg);
transform-origin: 25% 75%;
transform: translate(100px, 50px);.
transform: skew(30deg);
transform: scale(0.7, 0.7);
```
separate different transforms with spaces

**Keyframes**
```css
div {
   width: 100px;
   height: 100px;
   background-color: red;
   animation-name: colorchange;
   animation-duration: 1s;
   animation-timing-function: linear;
   animation-delay: 2s;
   animation-iteration-count: 5;
}
@keyframes colorchange {
   0% {background-color: red;}
   50% {background-color: green;}
   100% {background-color: blue;}
} 
```
or
```css
@keyframes colorchange {
   from {background-color: red;}
   to {background-color: green;}
}
```

*`animation-iteration-count`*: repeats the animation. The keyword can be `infinite`

*`animation-direction` keywords*: `normal`, `reverse`, `alternate`, `alternate reverse`

or

```css
animation: colorchange 3s ease-in 1s infinite reverse;
```

*order*: `name duration time-function delay iteration-count direction`

**3D transforms**
```css
transform: rotateX(150deg);
transform: rotateY(150deg);
transform: rotateZ(150deg);
transform: translateX(29px)
           scaleX(0.5)
perspective: 100px;
```
`perspective` indicates the distance from the object
