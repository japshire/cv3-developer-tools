{counter start=0 assign=total_price}
{counter start=0 assign=total_qty}
{foreach from=$cart key=key item=prod}
 {if $prod.qty > 0 && $prod.build_prod_id == ''}
  {if $prod.build_parent == 'y'}
   {assign var=total value=0}
   {foreach from=$cart key=key item=pr}
    {if $pr.build_prod_id == $prod.prod_id && $pr.build_link == $prod.build_link}
     {math equation="x+(y*z)" x=$total y=$pr.price z=$pr.qty assign="total"}
    {/if}
   {/foreach}
  {else}
   {assign var=total value=$prod.total}
  {/if}

  {math equation="x+y" x=$total_price y=$total|replace:",":"" assign=total_price format="%.2f"}
  {math equation="x+y" x=$total_qty y=$prod.qty assign=total_qty}
  
  {if $prod.gift_wrap == 'y' && $prod.gift_wrap_info != ''}
   {math equation="x+y" x=$total_price y=$prod.gift_wrap_info.total|replace:",":"" assign=total_price format="%.2f"}
   {math equation="x+y" x=$total_qty y=$prod.qty assign=total_qty}
  {/if}
 {/if}
{/foreach}

{*
<section id="cartitems">
  <span class="num">{$total_qty}</span> Items  <span class="num">{$currency_type}{$total_price|commify}</span> <a href="/viewcart"><img src="{$img_prefix}/images/cart.png" alt="Shopping Cart icon" /></a> <a href="/viewcart">View Cart</a>
</section>
*}


{if $totals.price !='' && $totals.price < 48.99 && $totals.price > 20}
   {math equation='49-x' x=$total_price assign='freeShipSpend'}
    {if $freeShipSpend > 0}
<a href="/shipping">Just <b>{$currency_type}{$freeShipSpend|commify}</b> more and you'll receive free domestic shipping</a>
    {else}
Your order qualifies for <b>free domestic shipping</b> to a single domestic address!
    {/if}

{else}
<a href="/shipping">
Free Domestic Shipping<br>
on all orders over $49
</a>
{* <img src="{$img_prefix}/images/fs-banner.jpg"> *}

{/if}