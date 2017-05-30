{if $print == "y"}
 {include file="print_top.tpl"}
{else}
 {include file="_top.tpl"}
{/if}

{include file="breadcrumb.tpl"}

{if $product.content_only != 'y'}

{if $settings.additional_prod_display_type == '2' && $add_form_errors.errors > 0 && $product.additional_prods|@count > 0}
 <div class="normaltext" align="center" style="font-weight: bold; color: red;">{$add_form_errors.error}</div>
{/if}

{if $add_form_errors.errors > 0 && $settings.additional_prod_display_type == '2'}
 {$add_form_errors.$prod_id}
{/if}


<div id="main_prod_detail">

  <div id="img_detail">
   <div id="img_large">
    <img src="{if $product.large_image == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$product.large_image|img_prefix}{/if}" border="0" alt="{$product.prod_name|replace:"&":"&amp;"|strip_quotes|strip_tags:false}" id="prod_image_{$prod_id}" />
   </div>
   <div class="spacer"></div>

   {if $product.full_image != '' && $product.full_image != '{$img_prefix}/images/nopicture_tn.jpg'}
    <div class="img_swap"><a href="{$product.full_image}" rel="lightbox" title="{$product.prod_name}">View Details</a></div>
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

   {*include file="product_images.tpl"*}

</div>
</div> {*** END IMG DETAIL ***}

<div id="form_detail">

<div id="prod_details">

   <h2 class="subcat_title">{$product.prod_name}</h2>
   {if $product.desc_header != ''}
    <h3 class="subtext">{$product.desc_header}</h3>
   {/if}

   {*<h2>{if $product.new == 'y'}<span style="color:#FF0000;">NEW!&nbsp;</span>{/if}{$product.prod_description}</h2>*}
   {include file="product_tabs.tpl"}

   {if $product.special == 'y' && $product.short_description != ''}
    <span class="productprice">{$product.short_description}</span>
   {/if}

   {*include file="product_kit.tpl"}

   {include file="prodrecipe.tpl"*}

</div> {*** END PROD DETAILS, MAIN PROD DETAILS ENDS ON .TPL ***}


{if $product.is_parent != 'y' || $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || ($product.gift_certificate == 'y' && $product.gift_certificate_send == 'y') || $product.gift_wrap == 'y' || $possible_mappings.display=='y' || $settings.additional_prod_display_type != '2'}
 <form method="post" name="product_form" action="index.php">
 <input type="hidden" name="action" value="AddCart" />
{/if}

{include file="custom_form.tpl"}

{include file="gift_wrap.tpl"}

{include file="gc_send.tpl"}

{include file="product_mapping.tpl"}

{if $product.is_parent != 'y' && $product.gift_set != 'y'}
  {include file="prodparent.tpl"}

{elseif $product.gift_set != 'y'}
  {if $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || ($product.gift_certificate == 'y' && $product.gift_certificate_send == 'y' || $product.gift_wrap == 'y' || $possible_mappings.display == 'y') }
    {include file="prodchild2.tpl"}
  {else}
    {include file="prodchild.tpl"}
  {/if}

{elseif $product.gift_set == 'y'}
  {include file="prodgiftset.tpl"}
{/if}

{if ($product.is_parent != 'y' || $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || $product.gift_wrap == 'y' || $possible_mappings.display == 'y') && $settings.additional_prod_display_type != '2'}
 </form>
{/if}

{*</div>
</div>*}

{include file="additional_products.tpl"}

{if $settings.additional_prod_display_type == '2'}
 <div align="center">
  <input type="hidden" name="process_type" value="2" />
  <input type="hidden" name="add_process_type" value="2" />
  <input type="submit" name="submit" value="Add to Cart" class="addtocart_btn btnstyle1" />
  {include file="wishlist_add.tpl"}
  {include file="reorder_add.tpl"}
 </div>
 </form>
{/if}

{*<br />
<div class="normaltext">
{if $product.cust_1 != ''}
Flavor Description: {$product.cust_1}<br /><br />
{/if}

{if $product.cust_2 != ''}
Brewing Instructions: {$product.cust_2}<br /><br />
{/if}

{if $product.cust_3 != ''}
Ingredients: {$product.cust_3}<br /><br />
{/if}

{if $product.cust_4 != ''}
Size Information: {$product.cust_4}<br /><br />
{/if}

{if $product.cust_5 != ''}
Origin: {$product.cust_5}<br /><br />
{/if}

{if $product.cust_6 != ''}
Additional Information: {$product.cust_6}<br /><br />
{/if}

</div>*}

</div>

<div class="clear spacer_lg"></div>

{include file="related_products.tpl"}

{include file="also_bought.tpl"}

{*include file="prodprevnextmenu.tpl"*}

{else}
 {include file="content_product.tpl"}
{/if}

</div>

{if $print == "y"}
 {include file="print_bottom.tpl"}
{else}
 {include file="_bottom.tpl"}
{/if}