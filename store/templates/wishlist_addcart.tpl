<form method="post" action="index.php">

 <div class="wishlist clearfix">

  <ul class="header-row">
   <li class="wish-sku3">Sku</li>
   <li class="wish-desc3">Description</li>
   <li class="wish-price2">Price</li>
   <li class="wish-qty">Qty</li>
   <li class="wish-add">&nbsp;</li>
  </ul>

  <ul>
   <li class="wish-sku3">{if $product.prod_id == $pr_id}{$product.sku}{else}{$product.children.$pr_id.sku}{/if}</li>
   <li class="wish-desc3">
    {if $prod.parent != '' && $prod.parent != 0}{assign var=par value=$prod.parent}{$parent_names.$par.prod_name}&nbsp;-&nbsp;{/if}{$prod.prod_name} {if $prod.attribute1 != ''}&nbsp;-&nbsp;{$prod.attribute1} {$prod.attribute2} {$prod.attribute3} {$prod.attribute4}{/if} {if $prod.child_attribute != ''}&nbsp;-&nbsp;{$prod.child_attribute}{/if}
   </li>
   <li class="wish-price2">
    {if $product.prod_id == $pr_id}
     <span class="productprice">
     {if $product.special == 'y'}<del>{$currency_type}{$product.standard_price|commify}</del></span><span class="saleprice">{/if}
     {$currency_type}{$product.price|commify}</span>
    {else}
     <span class="productprice">
     {if $product.children.$pr_id.special == 'y'}<del>{$currency_type}{$product.children.$pr_id.standard_price|commify}</del></span><span class="saleprice">{/if}
     {$currency_type}{$product.children.$pr_id.price|commify}</span>
    {/if}
   </li>
 {if $product.outseason != 'y'}
  {if ($settings.inventory_control != 'y' || ($product.has_attributes == 'y' && $attributes.count > 1) || ($settings.inventory_control == 'y' && ($product.inventory_control > 0 || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))) && $product.stock_status != 'Out of Stock'}
   <li class="wish-qty"><input type="text" name="qty" value="1" maxlength="3" class="formtext" size="1" /></li>
   <li class="wish-add">
    <input type="hidden" name="action" value="WishlistAddCart" />
    <input type="hidden" name="id" value="{$product.id}" />
    <input type="submit" name="submit" value="Add to Cart" class="button medium style2" />
   </li>
  {else}
   <li class="wish-qty">&nbsp;</li>
   <li class="wish-add">Out of Stock</li>
  {/if}
 {else}
   <li class="wish-qty">&nbsp;</li>
   <li class="wish-add">Out of Season</li>
 {/if}
  </ul>

 </div>

</form>