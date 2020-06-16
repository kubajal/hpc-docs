---
title: "CI"
date: 2020-04-24
draft: false
---

Operacyjność aplikacji zainstalowanych na komputerach ICM jest testowanna codziennie, automatycznie
[(CI - Continous Integration)](https://en.wikipedia.org/wiki/Continuous_integration).

Poniższa, automatycznie wygenerowana tabela przedstawia status aplikacji zainstalowanych na komputerach ICM.

Legenda:

<img src="../ci-icons/pass.jpg" width="25" height="25"/> działa

<img src="../ci-icons/fail.jpg" width="25" height="25"/> nie działa

<img src="../ci-icons/warning.jpg" width="25" height="25"/>  CI - work in progress

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready( function(){
      var target_url='https://owu-runners.nebula.grid.icm.edu.pl/ci-badges/';
jQuery.ajax({
        url:target_url,
        type:'get',
        dataType:'html',
        success:function(data)
    {
            var responce_html= jQuery(data);
            jQuery('#content_to_load').html(responce_html);
    }
    });
});
</script>

<p id="content_to_load">Tu powinna załadować się tabela.</p>
