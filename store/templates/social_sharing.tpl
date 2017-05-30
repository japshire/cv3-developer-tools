{* BEGIN SOCIAL BUTTONS *}
{include file="facebook_sdk.tpl"}

<div id="{if $view == 'category'}socialcat{else}social{/if}">

{** TWITTER **}

<a href="https://twitter.com/share" class="twitter-share-button" data-via="RishiTea" data-count="none">Tweet</a>
<script>!function(d,s,id){ldelim}var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){ldelim}js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);{rdelim}{rdelim}(document, 'script', 'twitter-wjs');</script>

{** END TWITTER **}

{** GOOGLE +1 **}
<div class="g-plusone" data-size="medium" data-annotation="none"></div>
<script type="text/javascript">
  (function() {ldelim}
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/platform.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  {rdelim})();
</script>

{** END GOOGLE +1 **}


{** PINTEREST**}
    <a href="https://www.pinterest.com/pin/create/button/?url=https%3A%2F%2F{$smarty.server.HTTP_HOST}{$SCRIPT_NAME}&media=https%3A%2F%2F{$smarty.server.HTTP_HOST}{$product.web_image}&description={$product.prod_description|strip_quotes|strip_tags:false}"
    data-pin-do="buttonPin">
    <img src="//assets.pinterest.com/images/pidgets/pin_it_button.png" />
    </a>


<script type="text/javascript">
(function(d){ldelim}
    var f = d.getElementsByTagName('SCRIPT')[0], p = d.createElement('SCRIPT');
    p.type = 'text/javascript';
    p.async = true;
    p.src = '//assets.pinterest.com/js/pinit.js';
           p.setAttribute('data-pin-hover', true);
           f.parentNode.insertBefore(p, f);
{rdelim}(document));
</script>
{** END PINTEREST **}

<br />


{** FACEBOOK LIKE AND SEND **}
<div id="{if $view == 'category'}social_button_cat{else}social_button{/if}">

<div class="fb-like" data-href="{$smarty.server.SCRIPT_URI}" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
</div>
{** END FACEBOOK LIKE AND SEND **}

</div>
{* END SOCIAL BUTTONS *}
