    <div itemscope itemtype="http://schema.org/Product">
        <meta itemprop="name" content="{$product.prod_name}">
        <meta itemprop="description" content="{$product.prod_description}">
        <meta itemprop="sku" content="{$product.sku}">
        <meta itemprop="url" content="https://www.{$settings.domain}{$SCRIPT_NAME}">
        <meta itemprop="image" content="https://www.{$settings.domain}{$product.large_image}">

  {if $product.reviews.num > 0}
      <div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
        <meta itemprop="ratingCount" content="{$product.reviews.num}">
        <meta itemprop="ratingValue" content="{$product.reviews.rating}">
        <meta itemprop="bestRating" content="5">
      </div>
  {/if}

{if $product.is_parent == ''}
      <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        <meta itemprop="price" content="{$currency_type}{$product.price|commify}">
        <meta itemprop="availability" href="http://schema.org/InStock" content="{if $product_status == ''}In Stock{else}{$product_status}{/if}">
      </div>
{/if}


{if $product.is_parent == 'y'}
      <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        {foreach from=$product.children key=key item=prod}
        <meta itemprop="price" content="{$currency_type}{$prod.price|commify}">
        {/foreach}
        <meta itemprop="availability" href="http://schema.org/InStock" content="{if $product_status == ''}In Stock{else}{$product_status}{/if}">
      </div>
{/if} 

    </div>