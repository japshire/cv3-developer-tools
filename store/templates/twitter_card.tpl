{if $view == 'product'}
{*array_debug*}
<meta name="twitter:card" content="product">
<meta name="twitter:site" content="@storename">
<meta property="twitter:account_id" content="73950169" />
<meta name="twitter:creator" content="@storename">
<meta name="twitter:title" content="{$product.prod_name}">
<meta name="twitter:description" content="{$product.prod_description|strip_tags}">
<meta name="twitter:image" content="https://www.storename.com{$product.large_image}">
<meta name="twitter:label1" content="Price">

{if $product.is_parent != 'y' && $product.has_attributes != 'y' && $product.price != '0.00'}
        <meta name="twitter:data1" content="{$currency_type}{$product.price|commify}">

{elseif $product.is_parent == 'y'}
        {foreach from=$product.children key=key item=prod}
        <meta name="twitter:data1" content="{$currency_type}{$prod.price|commify}">
        {/foreach}


{elseif $product.is_parent != 'y' && $product.has_attributes == 'y'}
        {foreach from=$attributes.attributes key=key item=attributes}
        <meta name="twitter:data1" content="{$currency_type}{$attributes.price|commify}">
        {/foreach}

{elseif $product.is_parent == '' && $product.has_attributes == '' && $attributes == ''}
        {foreach from=$attys.attributes key=key item=attyprice}
        <meta name="twitter:data1" content="{$currency_type}{$attyprice.price|commify}">
        {/foreach}

{elseif  $product.is_parent != 'y' && $product.additional_products != ''}
        {foreach from=$products.additional_prods key=key item=addprods}
        <meta name="twitter:data1" content="{$currency_type}{$addprods.price|commify}">
        {/foreach}
{/if} 

<meta name="twitter:label2" content="Category">
<meta name="twitter:data2" content="{$canon_cat.name}">
{/if}