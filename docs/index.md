---
title:
hide:
  - navigation
  - toc
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
    font-size: 2rem !important;
    line-height: 1.75 !important;
    margin-top: 5rem !important;
    margin-bottom: 7rem !important;
  }
  :root {
    --indigo-color: hsla(231deg, 48%, 48%, 1);
  }
  .md-button {
      background-color: var(--md-accent-bg-color) !important;
      border-color: var(--indigo-color) !important;
      color: var(--indigo-color) !important;
  }
  .md-button:focus,
  .md-button:hover {
      background-color: var(--md-accent-fg-color) !important;
      border-color: var(--md-accent-fg-color) !important;
      color: var(--md-accent-bg-color) !important;
  }
  .md-button--primary {
      background-color: var(--indigo-color) !important;
      border-color: var(--indigo-color) !important;
      color: var(--md-accent-bg-color) !important;
  }
  .md-button--primary:focus,
  .md-button--primary:hover {
      background-color: var(--md-accent-fg-color) !important;
      border-color: var(--md-accent-fg-color) !important;
      color: var(--md-accent-bg-color) !important;
  }
</style>

<script src="https://cdn.jsdelivr.net/npm/js-yaml@4.1.0/dist/js-yaml.min.js"></script>

<script>
window.onload = function() {
  var btnRandom = document.getElementById('random');
  var navigation = `{{ navigation }}`;
  navigation = navigation.replace("Page(title='Welcome', url='/')\n", '');
  navigation = navigation.replace(/Section\(title='([^']*)'\)$/gm, '$1:');
  navigation = navigation.replace(/Page\(title=['\[]([^'\]]*)['\]], url='([^']*)'\)$/gm, '$2: $2');

  var navJson = jsyaml.load(navigation);
  delete navJson['Misc']['Reading Notes']

  // traverse through the json tree
  function getJsonLeaves(json, leaves=[]){
    for (var subJson in json){
      if (typeof(json[subJson]) == 'string'){
        leaves.push(json[subJson])
      } else {
        getJsonLeaves(json[subJson], leaves);
      }
    }
    return leaves;
  }

  var postUrls = getJsonLeaves(navJson);
  var randomPostUrl = postUrls[Math.floor(Math.random() * postUrls.length)];
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
