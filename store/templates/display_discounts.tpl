{*** $discount.label is available to be used also. ***}
<script>
var disclist = [];
</script>
{if $discounts|@count}
  {foreach from=$discounts item=discount}
    <script>disclist.push({ldelim}qty:{$discount.qty},type:'{$discount.type}',amount:{$discount.amount},additional:'{$discount.additional}'{rdelim});</script>
    {if $discount.type == 'amount_off'}
      {if $discount.additional == 'n'}
        Buy {$discount.qty} or more and save {$currency_type}{$discount.amount|commify} per item<br />
      {else}
        Save {$currency_type}{$discount.amount|commify} on additional products above {$discount.qty}<br />
      {/if}
    {elseif $discount.type == 'percent_off'}
      {if $discount.additional == 'n'}
        Buy {$discount.qty} or more and save {$discount.amount|string_format:"%d"}%<br />
      {else}
        Save {$discount.amount|string_format:"%d"}% on additional products above {$discount.qty}<br />
      {/if}
    {elseif $discount.type == 'new_price'}
      {if $discount.additional == 'n'}
        Buy {$discount.qty} or more for {$currency_type}{$discount.amount|commify} each<br />
      {else}
        Additional products above {$discount.qty} are {$currency_type}{$discount.amount|commify} each<br />
      {/if}
    {elseif $discount.type == 'free_products'}
      Buy {$discount.qty} and get {$discount.amount|string_format:"%d"} free<br />
      {********************************************
        if they don't want to include the free prods in the number they have to purchase, use this code instead: 
        Buy {math equation="x-y" x=$discount.qty y=$discount.amount} and get {$discount.amount|string_format:"%d"} free<br />
       ********************************************}
    {/if}
  {/foreach}
{/if}
<script>
  disclist.reverse(); //reverse so that each loop below hits larger qtys first
  function discountQty(qty) {ldelim}
    var price = {if $product.special == 'y' && $product.standard_price > $product.special_price}{$product.special_price}{else}{$product.standard_price}{/if};
    $.each(disclist, function (index, value) {ldelim}
      if (qty >= value.qty && value.additional == 'n') {ldelim}
        switch(value.type) {ldelim}
          case 'amount_off':
            price = price - value.amount;
            break;
          case 'percent_off':
            price = price - (price * (value.amount/100));
            break;
          case 'new_price':
            price = value.amount;
            break;
        {rdelim}
        return false; //Found greatest qty that matches, get out of each
      {rdelim}
    {rdelim});
    $(".dynamic_qty").val('{$currency_type}' + price.toFixed(2)); //always set price to set back to standard once qty is below discounts
  {rdelim}
</script>
