<div id="menu-cart">
<ul>


  <li>
<a href="{if $view == 'checkout_shipping' || $view == 'checkout_confirmation'}/checkout{else}#{/if}" {if $view == 'checkout'}class="cart-on"{/if}>1. Begin Checkout</a>
  </li>


  <li>
<a href="{if $view == 'checkout_confirmation'}/checkout_shipping{else}#{/if}" {if $view == 'checkout_shipping'}class="cart-on"{/if}>2. Shipping & Billing Info</a>
  </li>


  <li>
<a href="#" {if $view == 'checkout_confirmation'}class="cart-on"{/if}>3. Confirmation</a>
  </li>


</ul>
</div>

{*
<div id="menu-cart">


 <ul>


  <li>
{if $view == 'checkout_shipping' || $view == 'checkout_confirmation'}<a href="/checkout">{/if}<img src="{$img_prefix}/images/leaf-cart.png" />1. Begin Checkout</a>{if $view == 'checkout_shipping' || $view == 'checkout_confirmation'}</a>{/if}
  </li>



  <li>
{if $view == 'checkout_confirmation'}<a href="/checkout_shipping">{/if}<img src="{$img_prefix}/images/leaf-cart.png" /><img src="{$img_prefix}/images/leaf-cart.png" />{if $view == 'checkout_shipping'}<span class="active">{/if}2. Shipping & Billing Info{if $view == 'checkout'}</span>{/if}{if $view == 'checkout_confirmation'}</a>{/if}
  </li>


  <li>
<img src="{$img_prefix}/images/leaf-cart.png" /><img src="{$img_prefix}/images/leaf-cart.png" /><img src="{$img_prefix}/images/leaf-cart.png" />{if $view == 'checkout_confirmation'}<span class="active">{/if}3. Confirmation{if $view == 'checkout'}</span>{/if}
  </li>


 </ul>

</div>
*}



