{assign var="pops" value=$smarty.get.pop}
{if $pops}
{include file="display_teawear_product.tpl" product=$product}

{else}
{include file="_top.tpl"}

{if $product.is_parent != 'y' || $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || ($product.gift_certificate == 'y' && $product.gift_certificate_send == 'y') || $product.gift_wrap == 'y' || $possible_mappings.display=='y' || $settings.additional_prod_display_type != '2'}
 <form method="post" name="product_form" action="index.php">
 <input type="hidden" name="action" value="AddCart" />
{/if}

{include file="display_teawear_product.tpl" product=$product}

{if ($product.is_parent != 'y' || $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || $product.gift_wrap == 'y' || $possible_mappings.display == 'y') && $settings.additional_prod_display_type != '2'}
 </form>
{/if}

{if $product.additional_prods|@count > 0}
 {assign var=hasAdditional value="y"}
 {include file="additional_products.tpl"}
{/if}

{* testing for 39793

<div class="qty-line"><span class="qty-label">Qty.</span> <input type="number" class='qty' name="qty{if $one_add_button}{$prod_id}{/if}" id="qty_{$prod_id}" value="{if !$one_add_button}{$minQty}{/if}" {if $settings.interactive_pricing == 'y'}onKeyUp="priceChange('{$prod_id}','dynamic','');"{/if} /></div>

<input type="submit" name="submit" value="Add to Cart" class="button medium style1" />
{if $memberinfo.id}<div class="btn-wishlist"><input type="submit" name="wishlist_add" class="button medium style2" value="Add to Wishlist" /></div>{/if}
{if $memberinfo.id}<div class="btn-reorder"><input type="submit" name="reorder_add" class="button medium style2" value="Easy Reorder" /></div>{/if}
</form>
*}

{if $settings.additional_prod_display_type == '2'}
 <input type="hidden" name="process_type" value="2" />
 <input type="hidden" name="add_process_type" value="2" />
 {if $settings.child_display_type == '2' || $product.is_parent != 'y'}
  <input type="submit" name="submit" value="Add to Cart" class="button medium style1" />
 {/if}
 {if $memberinfo.id}<div class="btn-wishlist"><input type="submit" name="wishlist_add" class="button medium style2" value="Add to Wishlist" /></div>{/if}
 {if $memberinfo.id}<div class="btn-reorder"><input type="submit" name="reorder_add" class="button medium style2" value="Easy Reorder" /></div>{/if}
 </form>
{/if}

{include file="display_product_group.tpl" label="We Also Recommend" products=$product.rel_prods max=4}
{include file="display_product_group.tpl" label="Customers Also Bought" products=$also_bought max=4}


<br clear=all />

{* add product reviews below we also recommend *}
<h6 class="cross">Reviews</h6>
{include file="show_reviews.tpl"}


<div id='image_overlay'>
 <div id='fade'></div>
 <img id='popup' src='{$image}' alt='' />
 <img id='close' src='{$img_prefix}/images/close_button.png' alt='Close' />
</div>
{** POPUP JS MOVED TO extra-js.tpl ***}

{include file="_bottom.tpl"}
{/if}