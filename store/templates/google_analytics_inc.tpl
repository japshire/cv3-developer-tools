{if $use_google_analytics == 'y'}
{* Google Analytics code *}
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '{$google_analytics_acct}']);
  _gaq.push(['_trackPageview']);

  (function() {ldelim}
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  {rdelim})();

{if $view == 'checkout_thanks' && isset($placed.order.id) && isset($placed.totals.grandtotal)}
  _gaq.push(['_addTrans',
    "{$placed.order.id}",                      // Order ID
    "",                                        // Affiliation
    "{$placed.totals.grandtotal}",             // Total
    "{$placed.totals.taxtotal}",               // Tax
    "{$placed.totals.shiptotal}",              // Shipping
    "{$placed.info.billing.billing_city}",     // City
    "{$placed.info.billing.billing_state}",    // State
    "{$placed.info.billing.billing_country}"   // Country
  ]);

  {foreach from=$placed.cart item=item}
  _gaq.push(['_addItem',
    "{$placed.order.id}",                      // Order ID
    "{$item.sku}",                             // SKU
    "{$item.name}",                            // Product Name 
    "{$item.cat}",                             // Category
    "{$item.price}",                           // Price
    "{$item.qty}"                              // Quantity
    ]);
  {/foreach}

  _gaq.push(['_trackTrans']);
{/if}
</script>
{* End Google Analytics code *}
{/if}
