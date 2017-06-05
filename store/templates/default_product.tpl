{include file="_top.tpl"}

{if $product.is_parent != 'y' || $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || ($product.gift_certificate == 'y' && $product.gift_certificate_send == 'y') || $product.gift_wrap == 'y' || $possible_mappings.display=='y' || $settings.additional_prod_display_type != '2'}
    <form method="post" name="product_form" action="index.php">
        <input type="hidden" name="action" value="AddCart" />
{/if}

    {include file="display_product.tpl" product=$product}

{if ($product.is_parent != 'y' || $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || $product.gift_wrap == 'y' || $possible_mappings.display == 'y') && $settings.additional_prod_display_type != '2'}
    </form>
{/if}

{if $product.additional_prods|@count > 0}
    {assign var=hasAdditional value="y"}
    {include file="additional_products.tpl"}
{/if}

{if $settings.additional_prod_display_type == '2'}
    <input type="hidden" name="process_type" value="2" />
    <input type="hidden" name="add_process_type" value="2" />
    {if $settings.child_display_type == '2' || $product.is_parent != 'y'}
        <div class="btn-add text-uppercase"><input type="submit" name="submit" value="Add to Cart" class="btn btn-primary addtocart_button" /></div>
        {/if}
    {if $memberinfo.id}<div class="btn-wishlist text-uppercase"><input type="submit" name="wishlist_add" class="btn btn-primary" value="Add to Wishlist" /></div>{/if}
{if $memberinfo.id}<div class="btn-reorder text-uppercase"><input type="submit" name="reorder_add" class="btn btn-primary " value="Easy Reorder" /></div>{/if}
</form>
{/if}

{*if $product.build_product != 'y' && $product.content_only != 'y'}
  {include file="product_tabs.tpl"}
{/if*}
{*include file="display_product_group.tpl" label="SUGGESTED PRODUCTS" products=$product.rel_prods max=6*}
{*include file="display_product_group.tpl" label="Customers Also Bought" products=$also_bought max=6*}

{***  Product Reviews *}
<div id="reviews" class="row">
  <div class="col-md-6"><hr class="green"></div>
  <div class="col-xs-12">
    <h3>Reviews</h3>
    {if $product.review_data|@count > 0}
      <a href="/create_review/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}/{if $var2 != ''}{$var2}{else}{$var1}{/if}">Write a review</a>
      <div id="review-sort" class="text-center">
        <a href="#" class="active">Most Recent</a>
        &nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="#">Highest Rates</a>
        &nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="#">Lowest Rates</a>
      </div>
      <div class="row">
        {foreach from=$product.review_data item=rev key=key}
          <div class="col-xs-12 col-sm-6 col-md-4 text-center">
            <div class="review-block">
              <div class="rev-stars">{include file="product_review.tpl" rating=$rev.rating}</div>
              <div class="rev-title">{$rev.title}</div>
              <div class="rev-date">{$rev.date_created|date_format}</div>
              <div class="rev-comments">{$rev.comments}</div>
              {if $rev.owner_comments != ''}
                <div class='content_box'>Owner Response: {$rev.owner_comments}</div>
              {/if}
              <div class="rev-info">{$rev.creator_name}<br>{$rev.city}, {$rev.state} {$rev.country}</div>
            </div>
          </div>
        {/foreach}
      </div>
    {else}
      <a href="/create_review/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}/{if $var2 != ''}{$var2}{else}{$var1}{/if}">Be the first to write a review</a>
    {/if}
  </div>
</div>

{*include file="prodprevnextmenu.tpl"*}

<div id='image_overlay'>
  <div id='fade'></div>
  <img id='popup' src='{$image}' alt='' />
  <img id='close' src='{$img_prefix}/images/close_button.png' alt='Close' />
</div>
{** POPUP JS MOVED TO extra-js.tpl ***}

{include file="_bottom.tpl"}
