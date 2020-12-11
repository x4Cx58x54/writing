---
title: Randomish Writing
---

<style>
  .md-content {
    margin-left: 0;
    margin-right: 0;
  }
  .md-footer {
    display: none;
  }
  .title {
    font-size: 1.8rem !important;
    line-height: 1.9 !important;
    margin-top: 3rem !important;
    margin-bottom: 5rem !important;
  }
  @media screen and (min-width:60em) {
    .md-sidebar--secondary {
      display: none;
    }
    .title {
      font-size: 2rem !important;
      margin-top: 5rem !important;
      margin-bottom: 7rem !important;
    }
  }
  @media screen and (min-width:76.25em) {
    .md-sidebar--primary, .button-sep {
      display: none;
    }
  }
</style>

<script>
window.onload = function() {
  var btnRandom = document.getElementById('random');
  var navigation = `{{ navigation }}`;
  navigation = navigation.replace(/\r?\n|\r/g, '');
  navigation = navigation.replace(/.*?url='\/'/, '');
  navigation = navigation.replace(/Section\(title='Reading Notes'\).*/, '');
  var posts = navigation.match(/(?<=url=').*?(?=')/g);
  var randomPostUrl = posts[Math.floor(Math.random() * posts.length)];
  btnRandom.href = randomPostUrl;
}
</script>

<div align="center">

  <h1 class="title"><b>Gibberish. Gobbledegook. Abracadabra. Fantastic&nbsp;Talk.</b></h1>

  <p>
    <a class="md-button" id="random">Random</a>
    &ensp;
    <a href="https://github.com/x4Cx58x54" class="md-button md-button--primary">x4Cx58x54</a>
  </p>

</div>
