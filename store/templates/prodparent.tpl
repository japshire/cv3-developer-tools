<div class="spacer"></div>

<div align="right">

{if $error != ''}
 <div align="center" class="normaltext" style="color:#ff0000;"><b>{$error}</b></div>
 <div class="spacer"></div>
{/if}

{if $product.stock_status=='Backordered' && $product.backordered_date != ''}
 <font color="#ff0000">*Backordered: {$product.backordered_date}</font>
 <div class="spacer"></div>
{/if}

<table width="550" cellspacing="0" cellpadding="5" border="0">
{* <tr>
  <th><div align="left">Description</div></th>
  <th>Item #</th>
  <th>Price</th>
  <th>Weight</th>
  {if ($product.text_field == 'y' || ($product.gift_certificate == 'y' && $product.gift_certificate_value < '1')) && $product.outseason != 'y'}
  <th>Customize</th>
  {/if}
  {if $product.has_attributes == 'y' && $product.outseason != 'y'}
  <th>Options</th>
  {/if}
  <th>Qty</th>
  {if $settings.additional_prod_display_type == '1' || $view == 'prod_detail_list'}
    <th>&nbsp;</th>
  {/if}
 </tr>*}
 <tr class="btm_border">
  <td class="prod_name">
   {$product.prod_name}
  </td>
{*  <td class="normaltext" align="center">
   {$product.sku}
  </td>*}
{*  <td class="normaltext" align="center">
   {if $product.shipping_weight == ''}&nbsp;{else}{$product.shipping_weight} {$product.unit}{/if}
  </td>  *}

{if $product.outseason != 'y'}
 {if ($settings.inventory_control != 'y' || ($product.has_attributes == 'y' && $attributes.count > 1) || ($settings.inventory_control == 'y' && ($product.inventory_control > $product.out_of_stock_point || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))) && $product.stock_status != 'Out of Stock'}
  {if $product.text_field == 'y' || ($product.gift_certificate == 'y' && $product.gift_certificate_value < '1')}

    
     {if $product.text_field == 'y'}<td class="qty_field" align="center">
      <input type="text" name="note{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" value="" size="20" class="formtext" /></td>
     {/if}
     {if $product.gift_certificate == 'y' && $product.gift_certificate_value < '1'}
      <td class="qty_field" align="center">
      <span class="green_price">Value: {$currency_type}&nbsp;</span><input type="text" name="gift_certificate_value{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" value="" size="3" class="qty_text" /></td>
     {/if}

  {/if}
  {if $product.has_attributes == 'y'}
    <td class="normaltext">
      {include file="attributes.tpl"}
    </td>
  {/if}

<td{if $product.gift_certificate != 'y'} class="green_price"{/if} valign="middle" align="center">
  {if $product.gift_certificate != 'y'}
   {if $product.special == 'y'}
    <del>{$currency_type}{$product.standard_price|commify}</del>
   {/if}
   <input type="text" class="dynamic_qty{if $product.special == 'y'} saleprice{/if}" id="price_{$prod_id}" value="{$currency_type}{if $product.min_qty > 1}{math equation="x*y" x=$product.price y=$product.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$product.price|commify}{/if}" readonly="readonly" />
  {else}
   &nbsp;
  {/if}
</td>

    <td align="center" class="qty_field" valign="middle">
	<font class="green_price">Qty</font>
     {if $product.qty_in_set > 1 && $product.num_sets_displayed > 1}
       <select name="qty{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" id="qty_{$prod_id}" onclick="javascript: priceChange('{$prod_id}','sub','','$');">
         <option label="{$product.min_qty}" value="{$product.min_qty}">{$product.min_qty}</option>
         {assign var="disp_qty" value=$product.min_qty}
         {section name="set" loop=$product.num_sets_displayed start=1}
           {math equation="x+y" x=$product.qty_in_set y=$disp_qty assign="disp_qty"}
           <option label="{$disp_qty}" value="{$disp_qty}">{$disp_qty}</option>
         {/section}
       </select>
     {else}
     <input type="text" name="qty{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" id="qty_{$prod_id}" value="{if $settings.additional_prod_display_type == '1' || $view == 'prod_detail_list'}{if $product.min_qty > 1}{$product.min_qty}{else}1{/if}{/if}" maxlength="2" class="qty_text" size="1"{if $settings.interactive_pricing == 'y'} onKeyUp="javscript: priceChange('{$prod_id}','dynamic','','$');"{/if} />{if $settings.interactive_pricing == 'y'} <img src="{$img_prefix}/images/plus.gif" class="inline" alt="Increase Quantity" onclick="javascript: priceChange('{$prod_id}','add','','$');" style="cursor: pointer;" /> <img src="{$img_prefix}/images/minus.gif" class="inline" alt="Decrease Quantity" onclick="javascript: if (checkMinQty('qty_{$prod_id}',{$product.min_qty},'interactive')) priceChange('{$prod_id}','sub','','$');" style="cursor: pointer;" />{/if}
   {/if}
    <input type="hidden" id="hidden_price_{$prod_id}" value="{$product.price}" />
    </td>
    {if $settings.additional_prod_display_type == '1' || $view == 'prod_detail_list'}
      <td class="add_btn_child">
        <input type="submit" name="submit" value="Add to Cart" class="addtocart_btn btnstyle1 fixed" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty},'');" />
        {include file="wishlist_add.tpl"}
        {*include file="reorder_add.tpl"*}
        <input type="hidden" name="prod_id" value="{$prod_id}" />
        <input type="hidden" name="cat_id" value="{if $product.cid > 0}{$product.cid}{else}{$cid}{/if}" />
        <input type="hidden" name="sku" value="{$product.sku}" />
      </td>
    {/if}
  {else}
    <td colspan="2" align="left" class="normaltext2">
      <b>Out of Stock</b>
    </td>
  {/if}
{else}
    <td colspan="2" align="left" class="normaltext2">
      <b>Out of Season</b>
    </td>
{/if}
  </tr>
</table>
</div>

{if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'}
  <div align="center"><a href="/product_notify/{if $view == 'product'}{$var1}/{$var2}{else}{$prod_id}/{$var1}{/if}">Notify me when this item is in stock</a></div>
{/if}
