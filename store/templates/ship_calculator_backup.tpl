{if $settings.ship_calculator == 'y'}
{if $settings.product_mapping == 'add_cart'}
  {* $id is set in cartitems.tpl *}
  {assign var="recip" value=$id|escape:"quotes"} {* escape recip quotes *}
  {assign var="label" value="_"|cat:$id} {* do NOT escape the label quotes *}
  {assign var="id" value="_"|cat:$id|escape:"quotes"} {* escape id quotes *}
{else}
  {assign var="id" value=""}
{/if}

<script type="text/javascript" src="/shipEstimator.js"></script>
<div id="cart_ship_estimator_header{$label}" style="display: none;">
  <table width="100%" cellspacing="0" cellpadding="0">
   <tr>
    <th nowrap="nowrap"><div align="left">Calculate Shipping Costs{if $settings.product_mapping == 'add_cart'} for {$recip|replace:"\'":"'"}{/if}</div></th>
    <th><div align="right"><a href="javascript: void(0);" onclick="javascript: hideShowCalc('{$recip}');" id="hideShowCalc{$label}">Show Details</a></div></th>
   </tr>
  </table>
</div>
<div id="cart_ship_estimator{$label}" style="display: none;">
  {if $settings.product_mapping != 'add_cart'}
    <form onsubmit="javascript: getNewShipCost(document.getElementById('zip{$id}').value,document.getElementById('country{$id}').value,document.getElementById('method{$id}').value,'s_address_type{$id}','{$smarty.session.store}','{$recip}'); return false;" action="">
  {/if}
<table width="100%" cellpadding="0" cellspacing="0" class="normaltext">
 <tr valign="top">
  <td width="50%" valign="top">
   <table cellpadding="5" cellspacing="0" width="100%">
    <tr>
     <td align="left" class="normaltext">
      Select Country:
     </td>
     <td align="right">
      <select id="country{$label}" name="country{$label}" class="formtext" onchange="hideShowCalcStateZip('{$label}',this.value); getInfo('limit_shipping_method','Shipping_Class','limitMethods',this.value+'||method{$label}');">
       <option value="">- Select Country -</option>
       {html_options options=$options.country}
      </select>
     </td>
    </tr>
    <tr id="staterow{$label}" style="display: none;">
     <td align="left" class="normaltext">
      Select State:
     </td>
     <td align="right">
      <select id="state{$label}" name="state{$label}" class="formtext" onchange="getInfo('limit_shipping_method','Shipping_Class','limitMethods','United States|'+this.value+'|method{$label}');">
       <option value="">- Select State -</option>
       {html_options options=$options.usstate}
      </select>
     </td>
    </tr>
    <tr id="ziprow{$label}" style="display: none;">
     <td align="left" class="normaltext">
      Enter Zip:
     </td>
     <td align="right">
      <input type="text" id="zip{$label}" size="5" maxlength="5" class="formtext" {if $settings.product_mapping == 'add_cart'} onkeypress="javascript: if (event.keyCode == '13') {ldelim} getNewShipCost(document.getElementById('zip{$id}').value,document.getElementById('country{$id}').value,document.getElementById('method{$id}').value,'s_address_type{$id}','{$smarty.session.store}','{$recip}'); return false; {rdelim}" {/if} />
     </td>
    </tr>
    <tr>
     <td align="left" class="normaltext">
      Select Method:
     </td>
     <td align="right">
      <select id="method{$label}" class="formtext">
       <option value="">- Select Method -</option>
       {html_options options=$options.shipping.method}
      </select>
     </td>
    </tr>
    {if $get_ship_type}
      <tr>
        <td align="left" class="normaltext" valign="top">
          Type:
        </td>
        <td align="center" class="normaltext">
          {include file="ship_address_type.tpl" num=$label}
        </td>
      </tr>
    {/if}
    <tr>
     <td colspan="2" align="right">
      <input type="button" value="Calculate Shipping" onclick="javascript: getNewShipCost(document.getElementById('zip{$id}').value,document.getElementById('country{$id}').value,document.getElementById('method{$id}').value,'s_address_type{$id}','{$smarty.session.store}','{$recip}');"  class="addtocart_btn btnstyle1" />
     </td>
    </tr>
   </table>
  </td>
  <td width="50%">
   <table cellpadding="5" cellspacing="0" width="100%">
    <tr>
     <td align="left" class="normaltext">
      Cart Total:
     </td>
     <td align="right" class="normaltext">
      {if $settings.product_mapping == 'add_cart'}
       {assign var="total" value="0"}
       {foreach from=$smarty.session.cart item=prod key=key}
        {if $prod.recipient_mapping == $recip|replace:"\'":"'"}
         {math equation="x+y" x=$total y=$prod.total assign="total"}
        {/if}
       {/foreach}
      {else}
       {assign var="total" value=$totals.price}
      {/if}
       <b>{$currency_type}{$total|commify}</b> {* $total is set in cartitems *}
      </td>
     </tr>
     <tr>
      <td align="left" class="normaltext">
       <b><span id="method_label{$label}"></span></b>Shipping Cost:
      </td>
      <td align="right" class="normaltext">
       <b><span id="method_cost{$label}"></span></b>
      </td>
     </tr>
     <tr>
      <td align="left" class="normaltext"><span id="tax_label{$label}"></span>Tax:</td>
      <td align="right" class="normaltext"><b><span id="tax_cost{$label}"></span></b></td>
     </tr>
     {if $settings.product_mapping != 'add_cart'}
      <tr>
       <td align="left" class="normaltext">
        <b><span id="promo"></span></b>
       </td>
       <td align="right" class="normaltext">
        <b><span id="promo_price"></span></b>
       </td>
      </tr>
     {/if}
     <tr>
      <td align="left" class="normaltext">
       Total Cost:
      </td>
      <td align="right" class="normaltext">
       <b><span id="total_cost{$label}"></span></b>
      </td>
     </tr>
     <tr>
      <td colspan="2" align="left" class="normaltext">
       Note: {if $settings.product_mapping == 'add_cart'}Promotional discounts and t{else}T{/if}axes may be applied to your order total and/or shipping total based on your shipping and/or billing state.
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
{if $settings.product_mapping != 'add_cart'}
 </form>
{/if}
</div>

<noscript><center><span class="normaltext"><b>If you had JavaScript enabled, you could calculate your shipping charges here.</b><br /><br /></span></center></noscript>
<script type="text/javascript">
  document.getElementById('cart_ship_estimator_header{$id}').style.display = 'block';
</script>
{/if}
