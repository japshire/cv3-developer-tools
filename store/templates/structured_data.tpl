{** SET ARRAYS **}
{if $view == 'product'}
  {if $product.is_parent != 'y' && $product.has_attributes != 'y' && $product.price != '0.00'}
	{assign var='prodprice' value=$currency_type|$product.price|commify}
  {** PRODS WITH ATTYS **}
  {elseif $product.is_parent != 'y' && $product.has_attributes == 'y'}
	{foreach from=$attributes.attributes key=key item=attributes}
 	{assign var='prodprice' value=$currency_type|$attributes.price|commify}
	{/foreach}
	{assign var='prodprice' value=$prodprice}
  {elseif $product.is_parent == '' && $product.has_attributes == '' && $attributes == ''}
	{foreach from=$attys.attributes key=key item=attyprice}
 	{assign var='prodprice' value=$currency_type|$attyprice.price|commify}
	{/foreach}
	{assign var='prodprice' value=$prodprice}
  {elseif  $product.is_parent != 'y' && $product.additional_products != ''}
	{foreach from=$products.additional_prods key=key item=addprods}
 	{assign var='prodprice' value=$currency_type|$addprods.price|commify}
	{/foreach}
	{assign var='prodprice' value=$prodprice}
  {/if}
{/if}



{if $view == 'product'}
<script type="application/ld+json">
// PRODUCTS
  {if $product.is_parent == 'y'}{** PRODS WITH SUBS/SHILDREN **}
    {ldelim}
     "@context": "https://schema.org",
     "@type": "Product",
     "image": "https://s3.amazonaws.com/cdn.rishi-tea.com{if $product.full_image != ''}{$product.full_image}{else}{$product.large_image}{/if}",
     "description": "{$product.prod_description|strip_tags|escape:'html'}",
     "name": "{$product.prod_name|strip_tags|escape:'html'}",
     "mpn": "{$product.sku}",
     "brand": {ldelim}
   	 "@type": "Thing",
   	 "name": "{if $product.brand != ''}{$product.brand|strip_tags|escape:'html'}{else}{#store_name#|strip_tags|escape:'html'}{/if}"
     {rdelim},
      {if $product.reviews.num > 0}
   	"aggregateRating": {ldelim}
   	   "@type": "AggregateRating",
   	   "ratingValue": "{$product.reviews.rating|commify:1}",
   	   "reviewCount": "{$product.reviews.num}",
   	   "worstRating": "1",
   	   "bestRating": "5"
   	{rdelim},
      {/if}
     "offers": [
   	 {foreach from=$product.children key=key item=child name=children}
   	   {assign var='childprice' value=$child.price}
   	   {assign var='childsku' value=$child.sku}
   	   {assign var='childname' value=$child.prod_name}
   	   {assign var='childbrand' value=$child.brand}
   	   {assign var='childstock_status' value=$child.stock_status}
   		 {ldelim}
   		 "@type": "Offer",
   		 "name": "{$childname|strip_tags|escape:'html'}",
   		 "priceCurrency": "USD",
   		 "price": "{$childprice|commify:2|replace:",":""}",
   		 "availability": "{if $childstock_status == 'In Stock'}InStock{else}OutOfStock{/if}",
   		 "itemOffered": "{$childprod_name|strip_tags|escape:'html'}",
   		 "itemCondition": "https://schema.org/NewCondition",
   		 "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$SCRIPT_NAME}",
   		 "seller": {ldelim}
   		  "@type": "Organization",
   		  "name": "{#store_name#|strip_tags|escape:'html'}"
   		  {rdelim}
   	   {rdelim}{if !$smarty.foreach.children.last},{/if}
   	 {/foreach}
      ]
    {rdelim}
  {else}{** STANDARD PRODS - NO SUB/CHILDREN **}
    {ldelim}
     "@context": "https://schema.org",
     "@type": "Product",
     "name": "{$product.prod_name|strip_tags|escape:'html'}",
     "image": "https://s3.amazonaws.com/cdn.rishi-tea.com{if $product.full_image != ''}{$product.full_image}{else}{$product.large_image}{/if}",
     "description": "{$product.prod_description|strip_tags|escape:'html'}",
     "mpn": "{$product.sku}",
     "brand": {ldelim}
   	 "@type": "Thing",
   	 "name": "{if $product.brand != ''}{$product.brand|strip_tags|escape:'html'}{else}{#store_name#|strip_tags|escape:'html'}{/if}"
     {rdelim},
      {if $product.reviews.num > 0}
   	"aggregateRating": {ldelim}
   	   "@type": "AggregateRating",
   	   "ratingValue": "{$product.reviews.rating|commify:1}",
   	   "reviewCount": "{$product.reviews.num}",
   	   "worstRating": "1",
   	   "bestRating": "5"
   	{rdelim},
      {/if}
     "offers": {ldelim}
   	 "@type": "Offer",
   	 "priceCurrency": "USD",
   	 "price": "{$product.standard_price|commify:2|replace:",":""}",
   	 {*"priceValidUntil": "2020-11-05",*}
   	 "itemCondition": "https://schema.org/NewCondition",
   	 "availability": "{if $product.stock_status == 'In Stock'}InStock{else}OutOfStock{/if}",
   	 "url": "{$protocol}://{$smarty.server.HTTP_HOST}{$SCRIPT_NAME}",
   	 "itemOffered": "{$product.prod_name|strip_tags|escape:'html'}",
   	 "seller": {ldelim}
   	  "@type": "Organization",
   	  "name": "{#store_name#|strip_tags|escape:'html'}"
   	  {rdelim}
   	{rdelim}
    {rdelim}
  {/if}
</script>
{/if}


<script type="application/ld+json">
// LOCAL LISTING
  {ldelim}
   "@context": "https://schema.org",
   "@type": "LocalBusiness",
   "image": "https://s3.amazonaws.com/cdn.rishi-tea.com/images/rishi-logo-white.png",
   "@id": "{$protocol}://{$smarty.server.HTTP_HOST}",
   "name": "{#store_name#|strip_tags|escape:'html'}",
   "description": "{$meta.Description|strip_tags|escape:'html'}",
   "address": {ldelim}
      "@type": "PostalAddress",
      "streetAddress": "185 S. 33rd Court",
      "addressLocality": "Milwaukee",
      "addressRegion": "WI",
      "postalCode": "53208",
      "addressCountry": "US"
   {rdelim},
   "geo": {ldelim}
      "@type": "GeoCoordinates",
      "latitude": 43.028413,
      "longitude": -87.954678
   {rdelim},
   "url": "{$protocol}://{$smarty.server.HTTP_HOST}",
 "sameAs" : [ "https://www.facebook.com/pages/Rishi-Tea/39035256828",
"https://twitter.com/RishiTea",
"https://instagram.com/rishitea/",
"https://www.pinterest.com/rishitea/"
    ],
   "telephone": "+1-866-747-4483",
   "openingHoursSpecification": [
      {ldelim}
   	"@type": "OpeningHoursSpecification",
   	"dayOfWeek": [
   	  "Monday",
   	  "Tuesday",
   	  "Wednesday",
   	  "Thursday",
   	  "Friday"
   	],
   	"opens": "08:30",
   	"closes": "17:00"
      {rdelim}
   ]
  {rdelim}
</script>

<script type="application/ld+json">
// ORGANIZATION
  {ldelim}
    "@context": "https://schema.org",
    "@type": "Organization",
    "url": "{$protocol}://{$smarty.server.HTTP_HOST}",
    "logo": "https://s3.amazonaws.com/cdn.rishi-tea.com/images/rishi-logo-white.png",
    "contactPoint": [{ldelim}
      "@type": "ContactPoint",
      "telephone": "+1-866-747-4483",
      "contactType": "customer service",
      "contactOption": "TollFree",
      "areaServed": "US"
    {rdelim}]
  {rdelim}
</script>



