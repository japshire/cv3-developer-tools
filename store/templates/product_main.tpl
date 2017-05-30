<div id="main_prod_detail">
  <div id="img_detail">
   <div id="img_large">
   {if $product.full_image != '' && $product.full_image != '{$img_prefix}/images/nopicture_tn.jpg'}
{*    <a href="javascript: void(0);" id="prod_link_{$prod_id}" onclick="window.open('/fullsize/{$prod_id}/{$cid}','popup','width=550,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes,resizable=yes');">*}
   {/if}
   <a href="javascript: void(0);" id="prod_link_{$prod_id}">
    
   <img src="{if $product.large_image == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$product.large_image|img_prefix}{/if}" border="0" alt="{$product.prod_name|replace:"&":"&"|strip_quotes|strip_tags:false}" id="prod_image_{$prod_id}" />
   </a>
   {if $product.full_image != '' && $product.full_image != '{$img_prefix}/images/nopicture_tn.jpg'}
    {*Enlarge Image</a>*}
   {/if}
   </div>
   <div class="spacer"></div>

   {*if $product.images.1.id != '' && $product.has_attributes != 'y'*}
   {if $product.images.1.id != ''}
    {if $product.cust_34 != ''}{assign var="linktext1" value=$product.cust_34}{/if}
    {if $product.cust_35 != ''}{assign var="linktext2" value=$product.cust_35}{/if}
    <div class="img_swap" id="swap_link">View {if $linktext1 != ''}{$linktext1}{else}Infusion{/if}</div>
   {/if}

   <div id="social_btns">
    <!-- AddThis Button BEGIN -->
    <div class="addthis_toolbox addthis_default_style ">
     <a class="addthis_button_preferred_1"></a>
     <a class="addthis_button_preferred_2"></a>
     <a class="addthis_button_preferred_3"></a>
     <a class="addthis_button_preferred_4"></a>
     <a class="addthis_button_compact"></a>
     <a class="addthis_counter addthis_bubble_style"></a>
    </div>
    <script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4ec550620a13976e"></script>
    <!-- AddThis Button END -->
{*
  <div id="twitter_img">
    <a href="/"><img src="{$img_prefix}/images/twitter_share.png" /></a>
  </div>
  <div id="fb_like">
    <a href="/"><img src="{$img_prefix}/images/like.png" /></a>
  </div>
*}

{*** JS FOR IMAGE SWAP ***}

<script type='text/javascript'>
head.ready(function() {ldelim}
function showInfusion() {ldelim}
  $('#prod_image_{$prod_id}').attr('src', '{$product.images.1.large}');
  
  $('#swap_link').text('View {if $linktext2 != ''}{$linktext2}{else}Tea Circle{/if}');
  $('#swap_link').unbind('click').click(showProductImage);

{rdelim}
  
function showProductImage() {ldelim}
  $('#prod_image_{$prod_id}').attr('src', '{$product.images.0.large}');
  
  $('#swap_link').text('View {if $linktext1 != ''}{$linktext1}{else}Infusion{/if}');
  $('#swap_link').unbind('click').click(showInfusion);

{rdelim}

$(function() {ldelim}
  $('#swap_link').click(showInfusion);
{rdelim});
{rdelim});
</script>

{*** END JS FOR IMAGE SWAP ***}

   {*include file="product_images.tpl"*}

   </div>
  </div> {*** END IMG DETAIL ***}

<div id="form_detail">

<div id="prod_details">

   <h2 class="subcat_title">{$product.prod_name}</h2>
   {if $product.desc_header != ''}
    <h3 class="subtext">{$product.desc_header}</h3>
   {/if}

   {*<h2>{if $product.new == 'y'}<span style="color:#FF0000;">NEW! </span>{/if}{$product.prod_description}</h2>*}
   {include file="product_tabs.tpl"}

   {if $product.special == 'y' && $product.short_description != ''}
    <span class="productprice">{$product.short_description}</span>
   {/if}

   {*include file="product_kit.tpl"}

   {include file="prodrecipe.tpl"*}

</div> {*** END PROD DETAILS, MAIN PROD DETAILS ENDS ON .TPL ***}