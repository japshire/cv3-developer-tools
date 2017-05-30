{config_load file="store.conf" scope="global"}
{include file="email_header.tpl"}

{assign var="src" value="?utm_source=helpemail&utm_medium=email&utm_campaign=cartemail1&"|cat:$session_link}
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF" style="border-left:1px solid #093c6a;border-right:1px solid #093c6a;">
  
<td style="padding:15px;font-family:Verdana, sans-serif; font-size:12px; color:#333333; line-height:17px;">
    
Dear Valued Customer,
<br/>
<br/>
Thanks so much for visiting the {#store_name#}'s website! For your convenience, we've saved the items you added to your shopping cart. When you're ready to 
complete your purchase, just <a href="http://www.domain.com/viewcart{$src}" target="_blank" style="color:#093863">follow this link to return to your shopping cart to complete your order</a>.
<br>
<br><br>
<div> {if $cart|@count > 0}
 <table width="600" border="0" cellspacing="0" cellpadding="5" style="font-family:Verdana, sans-serif;font-size:12px;color:#292929">
   
   <tr>
     <th colspan="2">Product</th>
     <th width="100" align="center">Qty</th>
     <th width="100" align="right">Total Price</th>
   </tr>
{foreach from=$cart key=key item=prod}
<tr>
  <td width="100"><img src="{$img_prefix}{$prod.web_image}" alt="{$prod.name}" style="border:1px solid #dfd2b2;width:75px;display:block;"></td>
  <td width="300">{$prod.name}</td>
  <td width="100" align="center"> {$prod.qty} </td>
  <td width="100" align="right">{math equation='x*y' x=$prod.price y=$prod.qty assign='line_total'} {$currency_type}{$line_total|commify} </td>
 </tr>
{/foreach}
</table>

{/if}</div>

 <br />
 <br />
 
<a href="http://www.domain.com/viewcart{$src}" target="_blank" style="text-decoration: none;"><div style="width: 189px; height: 30px; background-color: #272727; text-align: center; color: #fff; padding-top: 15px;">Return to Shopping Cart</div></a><br/>
<br/>
We value your comments and hope that with your help we can make the checkout experience run smoothly for everyone. 
<br/>
<br/>
Please email us at <a href="mailto:info@yourdomain.com" style="color:#093863">info@yourdomain.com</a> or call us toll free 
at <a href="tel:+18005555555" style="color:#333333;text-decoration:none">(800) 555-5555</a> if there is anything we can do to help you complete your order.
<br/>
<br/>
As always, our products are backed by our no risk guarantee.  If you are not totally pleased with your purchase we will cheerfully exchange the product, issue a credit, 
or refund your payment.
<br/>
<br/>
We look forward to hearing from you!
<br/>
<br/>
Sincerely,<br>
{#store_name#} Customer Service Team
<br/>
<br/>

</td>
</tr>
</table>

{include file="email_footer.tpl"}