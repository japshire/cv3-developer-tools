{config_load file="store.conf" scope="global"}
{assign var="template_section" value=$template_section|default:"default"}

{strip}
{include file="_meta.tpl"}
{/strip}

<input type="hidden" value="{$prod_id}" class="hid_prodid" >
<input type="hidden" value="product{$prod_id}_form" class="hid_formid" >

{literal}
<script>
$(document).ready(function() {

	$('.goto_product_detail').click(function() { 
		var go_link = $('.goto_link').val();
		parent.jQuery.fn.colorbox.close();
		parent.window.location.href = go_link;
	});
	$('#addtocart_submit').click(function() { 
		$('#cboxOverlay').hide();
		$('#colorbox').hide();
		//*************88		
		//var f_id = $('#addtocart_submit').closest('form').attr('id');		
		var p_id = $('.hid_prodid').val();		
		var f_id = $('.hid_formid').val();		
		if (optionCheck(document.getElementById(f_id))) {
		$(document.getElementById(f_id)).append('<input type="hidden" name="action_forward" value="/minicart?pid='+p_id+'&show_addtocart" />');
		$.post('/', $(document.getElementById(f_id)).serialize(),
		function(data) { 
		parent.$('#minicart_overlay_box').html(data);
		parent.$('#minicart').load('/minicart?show_output');
		parent.$('#minicart_overlay_box').slideDown();
		$.getJSON('/services/serrv/getBestSellers.php?num=3', function(data){
		var items = [];
		$.each(data, function(prod_id, product){
		items.push('<li><a href="/product/'+product.prod_id+'"><img src="'+product.web_image+'" />'+product.prod_name+'</a></li>');
		});
		// Truncate to 3 products
		items.length = 3;
		$('<ul/>', {html: items.join('')}).appendTo('#minicart_related_products');
		parent.jQuery.fn.colorbox.close();
		});
		});
		} 
		
	//******************	
		
		
		
	});
});
</script>
<style>
#wishlist_add {display:none;}
</style>
{/literal}


{if $view == 'prod_detail_list'}

<table width="100%" border="0" cellpadding="5" cellspacing="0">
 <tr valign="top">
  <td width="155" class="normaltext">

   <a href="/product/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$cid}{/if}"><img src="{if $product.web_image == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$product.web_image|img_prefix}{/if}" border="0" alt="{$product.prod_name|replace:"&":"&amp;"|strip_quotes|strip_tags:false}" /></a>

   <div class="prod_links"><a href="/product/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$cid}{/if}">{$product.prod_name}</a></div>

   {include file="display_discounts.tpl" discounts=$product.discounts}
   
   {$product.prod_description}

   {if $product.special == 'y'}
    <div class="spacer_sm"></div>
    <span class="productprice">{$product.short_description}</span>
   {/if}

   {if $product.comparable == 'y' && !in_array($product.prod_id,$compare_list)}
     <div class="spacer"></div>
     <input type="checkbox" value="{$product.prod_id}" onclick="javascript: addRemoveCompare(this,{$current_comparable},{$max_comparable});" /> Compare
   {/if}
  </td>
 </tr>
</table>

{else} {*** NORMAL PRODUCT PAGE ***}

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
   <td width="315" style="text-align:left; vertical-align:top; padding:4px 13px 10px 2px;">

	   <div style="background-color:#FFFFFF;">
{literal}
<script type="text/javascript">
MagicMagnifyPlus.options = {
      //Magnifier shape
      magnifier  :  'square'
}
</script>
{/literal}




{if $product.large_image != '' && $product.full_image != ''}
     <a href="{$product.full_image}" class="MagicMagnifyPlus" id="imgprodid_{$product.prod_id}"><img src="{$product.large_image|img_prefix}"></a>
 {/if}


    <div style="float:left;">{include file="product_images.tpl"}</div>
   </div>

  </td>  
  <td class="normaltext">

  <div id="wishlist_added" style="display:none;">
    Your product has been added to your wishlist.<br />
    <br/>
    <div align="right"><img id="wishlist_close" src="{$img_prefix}/images/btn_clicktoclose.jpg" alt="Click to close"></div>
  </div>

      <h1>{$product.prod_name}</h1>
   {include file="display_discounts.tpl" discounts=$product.discounts}

   <h2>{**product name with the recycled icon if it has one**}
   {$product.prod_description}</h2>

   
 
   {if $product.special == 'y' && $product.short_description != ''}
    <span class="productprice">{$product.short_description}</span>
   {/if}

   {include file="product_kit.tpl"}

     

{if $product.is_parent != 'y' || $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || ($product.gift_certificate == 'y' && $product.gift_certificate_send == 'y') || $product.gift_wrap == 'y' || $possible_mappings.display=='y' || $settings.additional_prod_display_type != '2'}
 <form method="post" name="product_form" action="index.php" id='product{$prod_id}_form'>
 <input type="hidden" name="action" value="AddCart" />
{/if}

{*include file="gift_wrap.tpl"*}

{include file="gc_send.tpl"}

{include file="product_mapping.tpl"}
{if $product.is_parent != 'y' && $product.gift_set != 'y'}
 {include file="prodparent.tpl"}
{elseif $product.gift_set != 'y'}
  {if $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || ($product.gift_certificate == 'y' && $product.gift_certificate_send == 'y' || $product.gift_wrap == 'y' || $possible_mappings.display == 'y') }

     <!-- added if block for 38768 A.Re 3/28/13 -->
     {if $product.cust_4 == 'N' && in_array($cust_group ,$arNSPricing)}
            <span class="specialprice">This product has non-standard pricing<br /></span>
     {/if}
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



{if $settings.additional_prod_display_type == '2'}
 <div align="center">
  <input type="hidden" name="process_type" value="2" />
  <input type="hidden" name="add_process_type" value="2" />
  <input type="submit" name="submit" value="Add to Cart ►" class="addtocart_btn btnstyle1" />
  {include file="wishlist_add.tpl"}
  {include file="reorder_add.tpl"}
 </div>
 </form>
{/if}

	<a class="goto_product_detail" href="#">Go To Product Page</a>
	<input type="hidden" class="goto_link" value="/product/{$var1}/{$var2}">


  </td>

 </tr>
</table>



{/if}

