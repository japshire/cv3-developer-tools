{if $product.prev != $product.prod_id && $product.next != $product.prod_id && $product.prev != '' && $product.next != ''}
 {*<div class="spacer"></div>*}
 <div class="detail_prev_next">
  <a href="/product/{$product.prev}{$url_split_char}{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}">&laquo; previous</a> &nbsp; | &nbsp; <a href="/product/{$product.next}{$url_split_char}{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}">next &raquo;</a>
 </div>
{/if}