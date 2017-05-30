{* ------[ This beginning part is just variable definitions that could possibly be moved to the backend code ]------ *}

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

{if $product.outseason == 'y'}{assign var=product_status value='Out of Season'}
{elseif $product.stock_status == 'Out of Stock' || $product.on_order > 0 || $backorder || ($product.inventory_control <= $product.out_of_stock_point)}
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

{if $view == 'product' || view == 'product_builder'}{assign var=prod_url value="javascript: openPopup('/fullsize/"|cat:$prod_id|cat:"/"|cat:$cid|cat:"', 550, 500);"}
{else}
 {if $categories.$prodcid.url_name != ''}{assign var=cat_url value=$categories.$prodcid.url_name}
 {else}{assign var=cat_url value=$prodcid}
 {/if}
 {if $product.url_name}{assign var="prod_url" value="/product/"|cat:$product.url_name}
 {else}{assign var=prod_url value="/product/"|cat:$product.prod_id}
 {/if}
{/if}
{capture name="product_url"}{$prod_url}/{$cat_url}{/capture}

{*------------------------------------------------------------------------------------------------*}
{*-------[ Begin Display ]------------------------------------------------------------------------*}

{if ($view == 'product' || view == 'product_builder') && $settings.additional_prod_display_type == '2' && $add_form_errors.errors > 0 && $product.additional_prods|@count > 0}
 <div class="errors">{$add_form_errors.error}</div>
{/if}

{if !$child}
<section class='{if $product.content_only == 'y'}content-{/if}product clearfix'>
{if $product.build_product == 'y'}{* || $product.content_only == 'y'*}
 <div class="content-only">{eval var=$product.prod_description}</div>
{else}
 <div class='image iefix'>
 {if $view == category}
  <a href="{$smarty.capture.product_url}"><img src="{if $view == 'product'}{$image|img_prefix}{else}{$thumb_image|img_prefix}{/if}" alt="{$name}" id='product_image-{$pid}' class='product_image' /></a>
 {else}
  {if $product.content_only == 'y'}
   {eval var=$product.prod_description}
  {else}   
   {if $image}
    <div id="img_large">
     <a href="{$product.full_image}" rel="lightbox" id="prod_link_{$prod_id}"><img src="{if $product.large_image == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$product.large_image|img_prefix}{/if}" border="0" alt="{$product.prod_name|replace:"&":"&"|strip_quotes|strip_tags:false}" id="prod_image_{$prod_id}" /></a>

    {*if $product.images.1.id != ''}
     {if $product.cust_34 != ''}{assign var="linktext1" value=$product.cust_34}{/if}
     {if $product.cust_35 != ''}{assign var="linktext2" value=$product.cust_35}{/if}
     <div class="img_swap" id="swap_link">View {if $linktext1 != ''}{$linktext1}{else}Infusion{/if}</div>
    {/if*}

    {if $product.full_image != '' && $product.full_image != '/images/nopicture_tn.jpg'}
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
    </div>

{*** JS FOR IMAGE SWAP ***}
<script type='text/javascript'>
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
</script>
{*** END JS FOR IMAGE SWAP ***}

   {/if}
  {/if}
 {/if}

 </div>


 <div class='info iefix'>

  <div class="content">
   {if $view == category}
    {if !$child}<a href='{$smarty.capture.product_url}'>{$product.prod_name}, {$product.desc_header}</a>
    {else}<h2>{$product.prod_name}</h2>
    {/if}
   {elseif ($view == product || view == 'product_builder') && $isAdditional == y}
    <h2>{$product.prod_name}</h2>
   {else}
    <h1>{$product.prod_name}</h1>
    {if $product.desc_header != ''}<h3 class="subtext">{$product.desc_header}</h3>{/if}
    {include file="product_tabs.tpl"}
   {/if}

   {*<div class='sku'>Item #: {$product.sku}</div>*}
   {*<div class="rev-stars">{include file="product_review.tpl"}</div>*}

   {*if $product.children|@count == ''}
    {if $product.outseason != 'y'}
     {if ($settings.inventory_control != 'y' || ($product.has_attributes == 'y' && $attributes.count > 1) || ($settings.inventory_control == 'y' && ($product.inventory_control > $product.out_of_stock_point || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))) && $product.stock_status != 'Out of Stock'}
      {assign var=product_status value='In Stock'}
      {assign var=allow_purchase value=1}
     {else}
      {assign var=product_status value='Out of Stock'}
     {/if}
    {else}
     {assign var=product_status value='Out of Season'}
    {/if}
    <div class='status'>Availability: {$product_status}</div>
   {/if*}

   {if $backorder}<div class='backordered'>*Backordered: {$product.backordered_date}</div>{/if}

   {*if $product.shipping_weight}Weight: {$product.shipping_weight} {$product.unit}{/if*}

   {if $view == 'product' || view == 'product_builder'}
    {include file="display_discounts.tpl" discounts=$product.discounts}
   {/if}

   {*if $product.prod_description}
    <p>{if $product.new == 'y'}<span class="red">NEW!</span> {/if}{$product.prod_description}</p>
   {/if*}

   {if $view == 'product' || view == 'product_builder'}
    {if $product.special == 'y' && $product.short_description}<p>{$product.short_description}</p>{/if}
    {include file="product_kit.tpl"}
    {include file="prodrecipe.tpl"}
   {/if}

   {if $product.content_only == 'y' && $view == category}
    <div class="more-link"><a href="{$smarty.capture.product_url}">more details ></a></div>
   {/if}

  </div>

  <div class="order">
  {*if $view == category && $product.is_donation != 'y'}
   {if $product.is_parent == 'y' || $product.has_attributes == 'y'}
    <div class='price'>{include file="price_ranges.tpl" p=$product}</div>
   {else}
    <div class='price' id="price_{$prod_id}">
     {if $cid == 'rp' && $product.rewards_program == 'y' && $product.rewards_points > 0}
     <span>Rewards Points: {$product.rewards_points}</span>
     {else}
     <span>{if $product.special == 'y' && $product.standard_price > $product.special_price}<del>{$currency_type}{$product.standard_price|commify}</del> </span><span class="sale-price">{/if}{$currency_type}{$product.price*$minQty|commify}</span>
     {/if}
    </div>
   {/if}
  {/if*}

  <div class="form">
  {*** CATEGORY FORM LAYOUT ***}
  {if $view == category}

   {if $allow_purchase}
    {if $product.is_parent != 'y' && $product.has_attributes != 'y' && $product.gift_set != 'y' && $product.text_field != 'y' && ($product.form_id == 0 || $product.form_id == '') && ($product.gift_certificate != 'y' || ($product.gift_certificate_value > '0' && $product.gift_certificate_send != 'y'))}

     {if $error != ''}
      <div class="errors">
       <p><em>{$error}</em></p>
      </div>
     {/if}

     <form method="post" action="index.php" name="product_form" id='product{$pid}_form'>
     <input type="hidden" name="action" value="AddCart" />
     {if $product.qty_in_set > 1 && $product.num_sets_displayed > 1}
      <div class="qty-line"><span class="qty-label">Qty</span> <select name="qty{if $one_add_button}{$prod_id}{/if}" id="qty_{$prod_id}" onclick="priceChange('{$prod_id}','sub','');">
      <option value="{$minQty}">{$minQty}</option>
      {assign var="disp_qty" value=$product.min_qty}
      {section name="set" loop=$product.num_sets_displayed start=1}
      {math equation="x+y" x=$product.qty_in_set y=$disp_qty assign="disp_qty"}
      <option value="{$disp_qty}">{$disp_qty}</option>
      {/section}
      </select></div>
     {else}
      <div class="qty-line"><span class="qty-label">Qty</span> <input type="number" class='qty' name="qty{if $one_add_button}{$prod_id}{/if}" id="qty_{$prod_id}" value="{if !$one_add_button}{$minQty}{/if}" {if $settings.interactive_pricing == 'y'}onKeyUp="priceChange('{$prod_id}','dynamic','');"{/if} />  {if $settings.interactive_pricing == 'y'} <img src="{$img_prefix}/images/plus.gif" class="inline" alt="Increase Quantity" onclick="javascript: priceChange('{$product.prod_id}','add','{$product.price}','{$currency_type}');" style="cursor: pointer;" /> <img src="{$img_prefix}/images/minus.gif" class="inline" alt="Decrease Quantity" onclick="javascript: if (checkMinQty('qty_{$product.prod_id}',{$product.min_qty},'interactive')) priceChange('{$product.prod_id}','sub','{$product.price}','{$currency_type}');" />{/if}</div>
     {/if}

     <input type="hidden" id="hidden_price_{$prod_id}" value="{$product.price}" />
     <input type="hidden" name="prod_id" value="{$prod_id}" />
     <input type="hidden" name="cat_id" value="{if $product.cid > 0}{$product.cid}{else}{$cid}{/if}" />
     <input type="hidden" name="sku" value="{$product.sku}" />
     {if $cid == 'rp'}
       {if $member.points_available >= $product.rewards_points}
         <input type="hidden" name="reward_amount" id="reward_amount_{$prod_id}" value="{$product.rewards_points}" />
         <input type="submit" name="addtocart_submit" class="button medium style1" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty},'');" />
       {/if}
     {else}
     <input type="submit" name="addtocart_submit" class="button medium style1" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty},'');" />
     {/if}
     </form>
    {else}
     <div class="more-link"><a href="{$smarty.capture.product_url}">more details ></a></div>
    {/if}
   {else}
    <div class="more-link"><a href="{$smarty.capture.product_url}">more details ></a></div>
   {/if}

  {*** PRODUCT FORM LAYOUT ***}
  {elseif ($view == product || view == 'product_builder') && $product.children|@count == ''}
  <form method="post" action="index.php" name="product_form" id='product{$pid}_form'>
   <input type="hidden" name="action" value="AddCart" />

   {if $error != ''}
    <div class="errors">
     <p><em>{$error}</em></p>
    </div>
   {/if}

   {if $view == 'product_builder'}
    <input type="hidden" value="{$bp_id}" name="bp_id">
    <input type="hidden" value="{$st_id}" name="st_id">
    <input type="hidden" value="1" name="qty">
   {/if}
   {include file="custom_form.tpl"}
   {include file="gift_wrap.tpl"}
   {include file="gc_send.tpl"}
   {include file="product_mapping.tpl"}
   {if $product.gift_set == 'y'}{include file="prodgiftset.tpl"}{/if}
   <div class="prodname">{$product.prod_name}</div>
   {if $view == 'product' || view == 'product_builder'}
    {if $product.is_parent == 'y' || $product.has_attributes == 'y'} 
     <div class='price'>{include file="price_ranges.tpl" p=$product}</div>
    {else}
     <div class='price'>
      {if $cid == 'rp' && $product.rewards_program == 'y'}
        Reward Points: {$product.rewards_points}
      {else}
      {if $product.special == 'y' && $product.standard_price > $product.special_price}<del>{$currency_type}{$product.standard_price|commify}</del>{/if}
      {if $product.is_donation == 'y'}{$currency_type}{/if}<input type="text"{if $product.is_donation == 'y'} name="donation_amount{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}"{/if} class="{if $product.is_donation != 'y'}dynamic_qty{/if}{if $product.special == 'y' && $product.standard_price > $product.special_price && $product.is_donation != 'y'} sale-price{elseif $product.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{if $product.is_donation != 'y'}{$currency_type}{if $product.min_qty > 1}{math equation="x*y" x=$product.price y=$product.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$product.price|commify}{/if}{else}0{/if}"{if $product.is_donation != 'y'} readonly="readonly" onfocus="this.blur()"{/if} />
      {/if}
     </div>
    {/if}
   {/if}
   {if $product.text_field == 'y'}<div class="note"><input type="text" name="note{if $one_add_button}{$prod_id}{/if}" /></div>{/if}
   {if $product.gift_certificate == 'y' && $product.gift_certificate_value < '1'}<div class="gc-value"><label>Value:</label> <input type="number" name="gift_certificate_value{if $one_add_button}{$prod_id}{/if}" /></div>{/if}
   {if $product.has_attributes == 'y'}<div class="attributes">{include file="attributes.tpl"}</div>{/if}

   {if $allow_purchase}
    {if $view != 'product_builder'}
     {if $product.qty_in_set > 1 && $product.num_sets_displayed > 1}
      <div class="qty-line"><span class="qty-label">Qty</span> <select name="qty{if $one_add_button}{$prod_id}{/if}" class="qty" id="qty_{$prod_id}" onclick="priceChange('{$prod_id}','sub','');">
      <option value="{$minQty}">{$minQty}</option>
      {assign var="disp_qty" value=$product.min_qty}
      {section name="set" loop=$product.num_sets_displayed start=1}
       {math equation="x+y" x=$product.qty_in_set y=$disp_qty assign="disp_qty"}
       <option value="{$disp_qty}">{$disp_qty}</option>
      {/section}
      </select></div>
     {else}
      <div class="qty-line"><span class="qty-label">Qty</span> <input type="number" class='qty' name="qty{if $one_add_button}{$prod_id}{/if}" id="qty_{$prod_id}" value="{if !$one_add_button}{if $product.min_qty > 1}{$product.min_qty}{else}1{/if}{/if}" {if $settings.interactive_pricing == 'y'}onKeyUp="priceChange('{$prod_id}','dynamic','','{$currency_type}');"{/if} />  {if $settings.interactive_pricing == 'y'} <img src="{$img_prefix}/images/plus.gif" class="inline" alt="Increase Quantity" onclick="javascript: priceChange('{$product.prod_id}','add','{$product.price}','{$currency_type}');" style="cursor: pointer;" /> <img src="{$img_prefix}/images/minus.gif" class="inline" alt="Decrease Quantity" onclick="javascript: if (checkMinQty('qty_{$product.prod_id}',{$product.min_qty},'interactive')) priceChange('{$product.prod_id}','sub','{$product.price}','{$currency_type}');" />{/if}</div>
     {/if}
    {/if}
    <input type="hidden" id="hidden_price_{$prod_id}" value="{$product.price}" />
   {/if}

   {if $one_add_button != 'y'}
    {if $allow_purchase}
     <input type="hidden" name="prod_id" value="{$prod_id}" />
     <input type="hidden" name="cat_id" value="{if $product.cid > 0}{$product.cid}{else}{$cid}{/if}" />
     <input type="hidden" name="sku" value="{$product.sku}" />
     {if $product.rewards_program == 'y' && $cid == 'rp'}
{$minPoints}
       {if $member.points_available >= $product.rewards_points}
         <input type="hidden" name="reward_amount" id="reward_amount_{$prod_id}" value="{$product.rewards_points}" />
         <div class="btn-add"><input type="submit" name="addtocart_submit" class="button medium style1" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty},'');"/></div>
       {/if}
     {else}
         <div class="btn-add"><input type="submit" name="addtocart_submit" class="button medium style1" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty},'');"/></div>
     {/if}
     {if $memberinfo.id}<div class="btn-wishlist"><input type="submit" name="wishlist_add" class="button medium style2" value="Add to Wishlist" /></div>{/if}
     {if $memberinfo.id}<div class="btn-reorder"><input type="submit" name="reorder_add" class="button medium style2" value="Easy Reorder" /></div>{/if}

    {/if}
    {if $notify}<div><a href="{$notify_url}">Notify me when this item is in stock</a></div>{/if}
   {/if}

 {elseif $product.children|@count != ''}

  {if $settings.child_display_type == '2'}
   {assign var=oneButton value="1"}
  {/if}

  {*** FORM FOR ONE BUTTON ***}
  {*if $oneButton}
   <form method="post" name="product_form" action="index.php" id="product{$pid}_form">
   <input type="hidden" name="action" value="AddCart" />
  {/if*}

  {include file="custom_form.tpl"}
  {include file="gift_wrap.tpl"}
  {include file="gc_send.tpl"}
  {include file="product_mapping.tpl"}
  {if $product.gift_set == 'y'}{include file="prodgiftset.tpl"}{/if}
  {include file="display_child_product.tpl"}

  {*if $oneButton}
   </form>
  {/if*}

 {/if}

 </div>

 </div>

 </div>

{/if}
</section>

{else}

{/if}
