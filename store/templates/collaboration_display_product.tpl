{include file="_top.tpl"}

{if $product.cid > 0}{assign var="prodcid" value=$product.cid}
{else}{assign var="prodcid" value=$cid}
{/if}

{if $settings.additional_prod_display_type == '2'}{assign var="one_add_button" value="y"}{/if}

{assign var=name value=$product.prod_name|replace:"& ":"& "|replace:"'":"'"|replace:'"':"""|strip_quotes|strip_tags:false}

{assign var="pid" value=$product.prod_id}
{assign var="prod_id" value=$product.prod_id}
{*assign var="results" value=$product.recipes*}
{assign var="attributes" value=$attys.$prod_id}
{assign var="valid" value=$valid.$prod_id}

{if $product.stock_status == 'Backordered' && $product.backordered_date}{assign var=backorder value=1}{/if}

{foreach from=$attributes.attributes item=aprod}
  {if $aprod.qty <= $aprod.out_of_stock_point || $qty == 0 || $aprod.backordered_date != ''}
    {assign var=no_attys value=$no_attys+1}
  {/if}
{/foreach}

{if $product.outseason == 'y'}{assign var=product_status value='Out of Season'}
{elseif $product.stock_status == 'Out of Stock' || $product.on_order > 0 || $backorder || ($product.inventory_control <= $product.out_of_stock_point) || ($product.has_attributes == 'y' && $attributes.attributes|@count == 0)}
 {assign var=product_status value='Out of Stock'}
{else}
 {assign var=product_status value='In Stock'}
 {assign var=allow_purchase value=1}
{/if}

{assign var="custom_form_num" value=$product.form_id}
{assign var="custom_form" value=$custom_forms.$custom_form_num}

{if $product.min_qty > 1}{assign var=minQty value=$product.min_qty}{else}{assign var=minQty value=1}{/if}

{if $settings.inventory_control == 'y' && $settings.product_notify == 'y'}
 {assign var=notify value=1}
 {if $view == 'product' || view == 'product_builder'}{assign var=notify_url value="/product_notify/"|cat:$var1|cat:"/"|cat:$var2}
 {else}{assign var=notify_url value="/product_notify/"|cat:$prod_id|cat:"/"|cat:$var1}
 {/if}
{/if}

{if $product.web_image}{assign var=thumb_image value=$product.web_image}
{else}{assign var=thumb_image value="/images/nopicture_tn.jpg"}
{/if}

{if $product.large_image}{assign var=image value=$product.large_image}
{else}{assign var=image value="/images/nopicture_tn.jpg"}
{/if}

{if $product.full_image && $product.full_image != '/images/nopicture_tn.jpg'}
{assign var=full_image value=$product.full_image}
{else}{assign var=full_image value="/images/nopicture_tn.jpg"}
{/if}

{if $view == 'product' || view == 'product_builder'}{*assign var=prod_url value="javascript: openPopup('/fullsize/"|cat:$prod_id|cat:"/"|cat:$cid|cat:"', 550, 500);"*}

{else}
 {if $categories.$prodcid.url_name != ''}{assign var=cat_url value=$categories.$prodcid.url_name}
 {else}{assign var=cat_url value=$prodcid}
 {/if}
 {if $product.url_name}{assign var="prod_url" value="/product/"|cat:$product.url_name}
 {else}{assign var=prod_url value="/product/"|cat:$product.prod_id}
 {/if}
{/if}
{capture name="product_url"}{$prod_url}/{$cat_url}{/capture}


{assign var="pops" value=$smarty.get.pop}



{*----------------------------------------------------------------------------------------------*}
{*-------[ Begin Display ]----------------------------------------------------------------------*}


<section class="product clearfix">
 


<div class="image iefix pull-right">
   {if $image}
    <div id="img_large">
     {if $product.full_image != ''}<a href="javascript: void(0);" id="prod_link_{$prod_id}">{/if}<img src="{if $product.large_image == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$product.large_image|img_prefix}{/if}" border="0" alt="{$product.prod_name|replace:"&":"&"|strip_quotes|strip_tags:false}" id="prod_image_{$prod_id}" />{if $product.full_image != ''}</a>{/if}
    </div>
{/if}

{include file="social_sharing.tpl"}
</div>

<div class="info iefix pull-left">
  <div class="content">
<h1>{$product.prod_name}</h1>
<br><br>
<div class="order">
   {eval var=$product.prod_description}
</div>
</div>
</div>
</section>


{include file="display_product_group.tpl" label="We Also Recommend" products=$product.rel_prods max=4}




{include file="_bottom.tpl"}
