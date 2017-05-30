{* ORIG
<a href="/{if $prod.build_product != 'y'}product{else}product_builder{/if}/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$prodcid}{/if}"><img src="{if $prod.web_image == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$prod.web_image|img_prefix}{/if}" border="0" alt="{$prod.prod_name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}{if $prod.desc_header != ''}, {$prod.desc_header}{/if}" /></a>
*}
{*array_debug*}
<div class="npop_custom_img_{$product.prod_id}" onmouseout="npopimg({$product.prod_id})" onmouseover="popimg({$product.prod_id});">
	
        <div>
		<a href="/{if $product.build_product != 'y'}product{else}product_builder{/if}/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$prodcid}{/if}">
			<img src="{if $product.web_image == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$product.web_image|img_prefix}{/if}" border="0" alt="{$product.prod_name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}{if $product.desc_header != ''}, {$product.desc_header}{/if}" />
		</a>
	</div>

        {if $cid != '40'}
	<div class="pop_custom_img_{$product.prod_id}" onmouseout="nnpopimg({$product.prod_id})" onmouseover="ppopimg({$product.prod_id});" style="display:none;height:0px;position:relative;top:-50px; width:150px;">


		<a class="pop_customm" href="/{if $product.build_product != 'y'}product{else}product_builder{/if}{$url_split_char}{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}?pop=1{else}{$prodcid}{/if}">

                {* Don't show this for the recipe category, #143 *}
                {if $cid != '143'}                
                <img class="npop_custom_{$prod.prod_id}" src="{$img_prefix}/images/quickshop.gif" border="0" />  
                <img class="pop_custom_{$prod.prod_id}" style="display:none;" src="{$img_prefix}/images/quickshop-hover.gif" border="0"/>
                {/if}
	</a>
	</div>
        {/if}

</div>


