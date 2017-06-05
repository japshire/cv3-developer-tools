{if $product.images|@count > 1}
 <div class='alternate_images'>
 {counter start=0 assign=num}
   {foreach from=$product.images item=img}
     {if ($img_type == '' || $img.type == $img_type) && $img.type != 'attribute'}
       <a data-zoom-id="zoom{$prod_id}" href="{if $img.popup==''}{$img.large|img_prefix}{else}{$img.popup|img_prefix}{/if}" data-image="{$img.large|img_prefix}">
         <img src="{$img.thumbnail|img_prefix}">
       </a>
       {*
       <img src="{$img.thumbnail|img_prefix}" alt="{$img.title|replace:"& ":"&amp; "}" onmouseover="$('#product_image-{$prod_id}').attr('src', '{$img.large}'); $('#product_image-{$prod_id}').attr('data-img', '{$img.popup}'); enlarge = '{$img.popup}';" {if $img.popup != ''}onclick="overlayImage('{$img.popup}');"{/if} />
       {if $img_type == 'color_swatch'}<caption>{$img.title}</caption>{/if}
       *}
    {counter assign=num}
    {/if}
  {/foreach}
 </div>
{/if}
