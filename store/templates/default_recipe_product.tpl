 {include file="_top.tpl"}


        {include file="display_recipe_product.tpl" product=$product}


{include file="display_product_group.tpl" label="We Also Recommend" products=$product.rel_prods max=4}
{include file="display_product_group.tpl" label="Customers Also Bought" products=$also_bought max=4}

<div id='image_overlay'>
    <div id='fade'></div>
    <img id='popup' src='{$image}' alt='' />
    <img id='close' src='{$img_prefix}/images/close_button.png' alt='Close' />
</div>
{** POPUP JS MOVED TO extra-js.tpl ***}

{include file="_bottom.tpl"}
