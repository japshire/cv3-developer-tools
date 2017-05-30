{**** if logged in as member populate variables; else get correct variables depending on page ****}
{if $memberinfo}
  {assign var='email' value=$memberinfo.email}
  {assign var='first' value=$memberinfo.first_name}
  {assign var='last' value=$memberinfo.last_name}
{elseif ($view == 'checkout_shipping' || $view == 'checkout') && $valid.email != ''}
  {assign var='email' value=$valid.email}
  {assign var='first' value=$valid.first_name}
  {assign var='last' value=$valid.last_name}
{elseif $view == 'checkout_confirmation' && $info.billing.email != ''}
  {assign var='email' value=$info.billing.email}
  {assign var='first' value=$info.billing.first_name}
  {assign var='last' value=$info.billing.last_name}

{/if}

{if $where != 'checkout_thanks'}

 {* Begin Talkable integration code for HEAD area *}

  {if $live}
    {assign var='site_id' value='rishi-tea'}
    <script src="//d2jjzw81hqbuqv.cloudfront.net/integration/clients/rishi-tea.min.js"></script>
  {else}
    {assign var='site_id' value='rishi-tea-staging'}
    <script src="//d2jjzw81hqbuqv.cloudfront.net/integration/clients/rishi-tea-staging.min.js"></script>
  {/if}
  <script>
    window._talkableq = window._talkableq || [];
    window._talkableq.unshift(['init', {ldelim} site_id: '{$site_id}' {rdelim}]);
    window._talkableq.push(['authenticate_customer', {ldelim}
      email: '{$email}',
      first_name: '{$first}',
      last_name: '{$last}'
    {rdelim}]);
    window._talkableq.push(['register_affiliate', {ldelim}{rdelim}]);
  </script>

  {* End Talkable integration code for HEAD area *}

{else}

  {* Begin Talkable integration code for checkout_thanks area *}
  {if $view == 'checkout_thanks' && isset($placed.order.id)}
  {math equation='w-x-y-z' w=$placed.info.totals.grandtotal x=$placed.info.totals.shiptotal y=$placed.info.totals.taxtotal z=$placed.info.totals.gifttotal assign='subtotal'}
  <script>
    var _talkable_data = {ldelim}
      purchase: {ldelim}
        order_number: '{$placed.order.id}',
        subtotal: '{$subtotal}', //pre-tax, post-discount
        coupon_code: '{if $placed.gift_certificates.codes|@count > 1}[{/if}{assign var="thecounter" value=1}{foreach from=$placed.gift_certificates.codes item=gc}{$gc.code}{if $thecounter < $placed.gift_certificates.codes|@count},{/if}{math equation="x+1" x=$thecounter assign="thecounter"}{/foreach}{if $placed.gift_certificates.codes|@count > 1}]{/if}'
      {rdelim},
      customer: {ldelim}
        email: '{$placed.info.billing.email}'
      {rdelim}
    {rdelim};
    _talkableq.push(['register_purchase', _talkable_data]);
  </script>
  {/if}
  {* End Talkable integration code for checkout_thanks area *}

{/if}