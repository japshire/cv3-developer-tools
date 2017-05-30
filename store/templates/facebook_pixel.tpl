{assign var='fbpixelid' value='416153522065996'}

<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s){ldelim}if(f.fbq)return;n=f.fbq=function(){ldelim}n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments){rdelim};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s){rdelim}(window,
document,'script','//connect.facebook.net/en_US/fbevents.js');
fbq('init', '{$fbpixelid}');
fbq('track', "PageView");
<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->

{* FACEBOOK PRODUCT ADS - PRODUCT VIEW *}
{if $view == 'product'}
fbq('track', 'ViewContent', {ldelim}
  content_name: '{$product.prod_name}',
 {rdelim});
{/if}

{* FACEBOOK PRODUCT ADS - CART ADD *}
{if $view == 'viewcart'}
  {assign var='cartskus' value=''}
  {foreach from=$cart item=prod}
    {assign var='cartskus' value=$cartskus|cat:'\''|cat:$prod.sku|cat:'\','}
  {/foreach}
  {assign var='cartskus' value=$cartskus|substr:0:-1}
fbq('track', 'AddToCart', {ldelim}
  content_name: 'Shopping Cart',
  content_ids: [{$cartskus}],
  content_type: 'product'
{rdelim});
{/if}

{* FACEBOOK PRODUCT ADS - CHECKOUT *}
{if $view == 'checkout'}
{assign var='cartskus' value=''}
{foreach from=$cart item=prod}
 {assign var='cartskus' value=$cartskus|cat:'\''|cat:$prod.sku|cat:'\','}
{/foreach}
{assign var='cartskus' value=$cartskus|substr:0:-1}

fbq('track', 'InitiateCheckout', {ldelim}
  content_name: 'Checkout',
  content_category: 'Shopping Cart',
  content_ids: [{$cartskus}],
  num_items: {$totals.qty},
  content_type: 'product'
{rdelim});
{/if}

{* FACEBOOK PRODUCT ADS - ADD PAYMENT INFO *}
{if $view == 'checkout_confirmation'}
{assign var='cartskus' value=''}
{foreach from=$cart item=prod}
 {assign var='cartskus' value=$cartskus|cat:'\''|cat:$prod.sku|cat:'\','}
{/foreach}
{assign var='cartskus' value=$cartskus|substr:0:-1}

fbq('track', 'AddPaymentInfo', {ldelim}
  content_category: 'Shopping Cart',
  content_ids: [{$cartskus}],
  content_type: 'product'
{rdelim});
{/if}

{* FACEBOOK PRODUCT ADS - PURCHASE *}
{if $view == 'checkout_thanks' && isset($placed.order.id)}
  {assign var='purchaseskus' value=''}
  {foreach from=$placed.cart key=key item=prod}
    {assign var='purchaseskus' value=$purchaseskus|cat:'\''|cat:$prod.sku|cat:'\','}
  {/foreach}
  {assign var='purchaseskus' value=$purchaseskus|substr:0:-1}
fbq('track', 'Purchase', {ldelim}
  content_name: 'Checkout',
  content_ids: [{$purchaseskus}],
  content_type: 'product',
  value: {$placed.totals.grandtotal|commify},
  currency: 'USD'
{rdelim});
{/if}


{* FACEBOOK PRODUCT ADS - SEARCH *}

{if $SCRIPT_NAME == '/category/s'}
<!-- Custom Audience Pixel Code -->
fbq('track', 'Search', {ldelim}
  content_name: 'Search',
  content_category: 'Search'
{rdelim});
{/if}

{* OPT_INS *}

{* FACEBOOK PRODUCT ADS - LEADS *}
{if $view == "checkout_display" && $saved_data.optin != 'y' || $view == "checkout_confirmation" && $saved_data.optin != 'y'}
fbq('track', 'Lead', {ldelim}
  content_name: 'Shopping Cart',
  content_category: 'Shopping Cart Opt-In'
{rdelim});
{/if}


{if $view == "catalog_thanks" && $saved_data.opt_out != 'y'}
fbq('track', 'Lead', {ldelim}
  content_name: 'Catalog Request Thanks',
  content_category: 'Opt-In Lead'
{rdelim});
{/if}

{if $view == "contact_thanks" && $saved_data.opt_out != 'y'}
fbq('track', 'Lead', {ldelim}
  content_name: 'Contact Thanks',
  content_category: 'Opt-In Lead'
{rdelim});
{/if}

{if $view == "newsletter_thanks"}
fbq('track', 'Lead', {ldelim}
  content_name: 'Newsletter Thanks',
  content_category: 'Opt-In Lead'
{rdelim});
{/if}

{if $view == "member" && $member.opt_out != 'y' && $saved_data.register_submit == 'Register'}
fbq('track', 'Lead', {ldelim}
  content_name: 'Member',
  content_category: 'Opt-In Lead'
{rdelim});
{/if}


{* FACEBOOK PRODUCT ADS - MEMBER REGISTRATION *}

{if $view == 'member' && $saved_data.register_submit == 'Register'}
fbq('track', 'CompleteRegistration', {ldelim}
  content_name: 'Member',
  content_category: 'Member Registration',
  status: 'Complete'
{rdelim});
{/if}

{if $view == 'checkout_shipping' && $saved_data.create_account == 'on'}
fbq('track', 'Lead', {ldelim}
  content_name: 'Member',
  content_category: 'CompleteRegistration',
  status: 'Complete'
{rdelim});
{/if}

</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id={$fbpixelid}&ev=PageView&noscript=1"/></noscript>
<!-- End Facebook Pixel Code -->