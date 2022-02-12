---
layout: post
---

* [English](/en/)
* [Deutsch](/de/)

<script>
  function redirect() {
    var lang = navigator.language || navigator.browserLanguage;

    if (lang.indexOf('de') > -1) {
      document.location.href = '/de/';
    }
    else {
      document.location.href = '/en/';
    }
  }
  
  window.onload = redirect;
</script>
