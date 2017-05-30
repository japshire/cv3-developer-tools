{if $view == 'product' || $view == 'category'}
<div id="fb-root"></div>
{literal}
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '318135825040070',
      xfbml      : true,
      version    : 'v2.1'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
{/literal}
{/if}
