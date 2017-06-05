{* -----[ Variable Definitions ]----- *}

{if $p.url_name != ''}{assign var=url_name value=$p.url_name}
{else}{assign var=url_name value=$p.prod_id}
{/if}

{if $p.cid_name != ''}{assign var=cid_name value=$p.cid_name}
{else}{assign var=cid_name value=$p.cid}
{/if}

{assign var=url value='/product/'|cat:$url_name|cat:$url_split_char|cat:$cid_name}

{if $p.large_image != ''}{assign var=image value=$p.large_image}
{elseif $p.web_image != ''}{assign var=image value=$p.web_image}
{else}{assign var=image value='/images/nopicture_tn.jpg'}
{/if}

{* -----[ Begin Display ]----- *}
<div class='thumb-product'>
<div class='image'><a href="{$url}" title="{$p.prod_name}"><img src="{$image|img_prefix}" alt="{$p.prod_name}" title="{$p.prod_name}" /></a></div>
<div class='info'>
<div class='name'><a href="{$url}" title="{$p.prod_name}">{$p.prod_name}</a></div>
{if $label != 'Recently Viewed' && $label != 'Related Items'}
<div class='price'>
  {if ($p.has_attributes == 'y' || $p.is_parent == 'y') && $label != 'Related Products'}
    {include file="price_ranges.tpl" }
  {else}
    {if $p.special == 'y' && $p.standard_price > $p.special_price && $p.special_price > 0.00}
      <del>{$currency_type}{$p.standard_price|commify}</del>
      <span class="sale-price">{$currency_type}{$p.special_price|commify}</span>
    {elseif $p.standard_price > 0.00}
      {$currency_type}{$p.standard_price|commify}
    {/if}
  {/if}
</div>
{/if}
</div>
</div>