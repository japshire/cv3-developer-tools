<link rel="stylesheet" type="text/css" href="/styles.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/base/jquery-ui.css" type="text/css" />
{include file = "google_analytics_inc.tpl"}


<section class='product clearfix'>
    <div class='image image_quick iefix'>
        {if $image}
            <a href="{$product.full_image}" class="MagicMagnifyPlus" id="Magnifier1">
                <img src="{if $view == 'product' && $isAdditional != y}{$image|img_prefix}{else}{$thumb_image|img_prefix}{/if}" alt="{$name}" id='product_image-{$pid}' class='product_image popup-img' data-img="{$product.full_image}" {if $pops}width="200"{/if}/>
            </a>
        {/if}
        {*if $full_image || $product.images|@count > 1}
        {include file="product_images.tpl"}
        {/if*}

    </div>

    <div class='info quick_info iefix'>

        <div class="content">
            {if $view == category}
            {if !$child}<a href='{$smarty.capture.product_url}'><h2>{if $product.cust_1 != 'N'}<img src="{$img_prefix}/images/uploads/Recycled_Icon_Small.gif" class="cat_recycle_img" alt="Made from recycled material">{/if}{$product.prod_name}</h2></a>
        {else}<h2>{if $product.cust_1 != 'N'}<img src="{$img_prefix}/images/uploads/Recycled_Icon_Small.gif" class="cat_recycle_img" alt="Made from recycled material">{/if}{$product.prod_name}</h2>
            {/if}
        {elseif ($view == product || view == 'product_builder') && $isAdditional == y}
        <h2 style="margin-bottom:10px">{$product.prod_name}</h2>
    {else}
        <h1 style="margin-bottom:10px">{$product.prod_name}</h1>
    {/if}


    {if $product.cust_1 || $product.cust_3}{* FOR REG PRODUCTS *}
        {if $product.cust_1}Tasting Notes: {$product.cust_1}<br /><br />{/if}
    {if $product.cust_3}Ingredients: {$product.cust_3}<br /><br />{/if}
{else if $product.prod_description}{* FOR TEAWARE *}
    {$product.prod_description}
{/if}

{*<div class="qanda"><a href="/product_qanda/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}">Product Q&A</a></div>*}
{if $product.children|@count == ''}
    {if $product.outseason != 'y'}
        {if ($settings.inventory_control != 'y' || ($product.has_attributes == 'y' && $attributes.count > 1) || ($settings.inventory_control == 'y' && ($product.inventory_control > $product.out_of_stock_point || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))) && $product.stock_status != 'Out of Stock'}
            {assign var=product_status value='In Stock'}
            {assign var=allow_purchase value=1}
        {else}
            {assign var=product_status value='Out of Stock'}
            {assign var=allow_purchase value=''}
        {/if}
    {else}
        {assign var=product_status value='Out of Season'}
        {assign var=allow_purchase value=''}
    {/if}
    {if $product.stock_status == 'Backordered' && $product.backordered_date != ''}
        {assign var=product_status value='Backordered'}
        {assign var=allow_purchase value=1}
    {/if}

{/if}

{*if $product.shipping_weight}Weight: {$product.shipping_weight} {$product.unit}{/if*}

{if $view == 'product' || view == 'product_builder'}
    {include file="display_discounts.tpl" discounts=$product.discounts}
{/if}

{*if $product.prod_description}
<p>{if $product.new == 'y'}<span class="red">NEW!</span> {/if}{$product.prod_description}</p>
{/if*}

{if $view == 'product' || view == 'product_builder'}
    {*if $product.special == 'y' && $product.short_description}<p>{$product.short_description}</p>{/if}
    {include file="product_kit.tpl"}
    {include file="prodrecipe.tpl"*}

    {*if $product.cust_1 != 'N'}
    <img class="recycle_ico_big" src="{$img_prefix}/images/uploads/Recycled_Icon.gif" alt="Made from recycled material" align="left">
    {/if*}
{if $backorder}<div class='backordered_quick'>*Backordered: {$product.backordered_date}</div>{/if}
{if $product.children|@count == ''}{*if $prod.is_parent == '' && in_array($cust_group,$arRetailGroups)*}<div class='sku_quick'>Item #: {$product.sku}</div>{/if}

    {*if $product.cust_2 == 'N' && in_array($cust_group ,$arConsignmentGroups)}
    <div class="red">This item is non-returnable</div>
    {/if*}

    {*if $product.cust_4 == 'N' && in_array($cust_group ,$arNSPricing)}
    <div class="red">This product has non-standard pricing</div>
    {/if*}
{/if}



{*if $view == 'product' || view == 'product_builder'}

{if $product.is_parent == 'y' || $product.has_attributes == 'y'} 
<div class='price_quick'>{include file="price_ranges.tpl" p=$product}</div>
{else}
<div class='price_quick'>
{if $cid == 'rp' && $product.rewards_program == 'y'}
Reward Points: {$product.rewards_points}
{else}
{if $product.special == 'y' && $product.standard_price > $product.special_price}<del>{$currency_type}{$product.standard_price|commify}</del>{/if}
{if $product.is_donation == 'y'}{$currency_type}{/if}<input type="text"{if $product.is_donation == 'y'} name="donation_amount{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}"{/if} class="{if $product.is_donation != 'y'}dynamic_qty{/if}{if $product.special == 'y' && $product.standard_price > $product.special_price && $product.is_donation != 'y'} sale-price-quick{elseif $product.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{if $product.is_donation != 'y'}{$currency_type}{if $product.min_qty > 1}{math equation="x*y" x=$product.price y=$product.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$product.price|commify}{/if}{else}0{/if}"{if $product.is_donation != 'y'} readonly="readonly" onfocus="this.blur()"{/if} />
{/if}
</div>
{/if}
{/if*}
{if $product_status == 'Backordered'}
    <div class="price_quick"><b class="orange">{$product_status}{if $product.backordered_date}({$product.backordered_date}){/if}</b></div>
{/if}
</div>

<div class="form">
    {*** CATEGORY FORM LAYOUT ***}
    {if $view == category}

        {if $allow_purchase}
            {if $product.is_parent != 'y' && $product.has_attributes != 'y' && $product.gift_set != 'y' && $product.text_field != 'y' && ($product.form_id == 0 || $product.form_id == '') && ($product.gift_certificate != 'y' || ($product.gift_certificate_value > '0' && $product.gift_certificate_send != 'y'))}

                {if $error != ''}
                    <div class="errors">
                        <p><em>{$error}</em></p>
                    </div>
                {/if}

                <form method="post" action="index.php" name="product_form" id='product{$pid}_form'>
                    <input type="hidden" name="action" value="AddCart" />

                    {if $product_status == 'Backordered'}
                        <div class="status"><b class="orange">{$product_status}{if $product.backordered_date}({$product.backordered_date}){/if}</b></div>
                    {/if}
                    {if $product.qty_in_set > 1 && $product.num_sets_displayed > 1}
                        <div class="qty-line"><span class="qty-label">Qty.</span> <select name="qty{if $one_add_button}{$prod_id}{/if}" id="qty_{$prod_id}" onclick="priceChange('{$prod_id}', 'sub', '', '{$currency_type}');">
                                <option value="{$minQty}">{$minQty}</option>
                                {assign var="disp_qty" value=$product.min_qty}
                                {section name="set" loop=$product.num_sets_displayed start=1}
                                    {math equation="x+y" x=$product.qty_in_set y=$disp_qty assign="disp_qty"}
                                    <option value="{$disp_qty}">{$disp_qty}</option>
                                {/section}
                            </select></div>
                        {else}
                        <div class="qty-line quick_qty_line"><span class="qty-label">Qty.</span> <input type="number" {if $product.fractional_qty == 'y'}step="any"{/if} class='qty qty_quick' name="qty{if $one_add_button}{$prod_id}{/if}" id="qty_{$prod_id}" value="{if !$one_add_button}{$minQty}{/if}" {if $settings.interactive_pricing == 'y'}onKeyUp="priceChange('{$prod_id}', 'dynamic', '', '{$currency_type}');"{/if} /></div>
                        {/if}

                    <input type="hidden" id="hidden_price_{$prod_id}" value="{$product.price}" />
                    <input type="hidden" name="prod_id" value="{$prod_id}" />
                    <input type="hidden" name="cat_id" value="{if $product.cid > 0}{$product.cid}{else}{$cid}{/if}" />
                    <input type="hidden" name="sku" value="{$product.sku}" />
                    {if $cid == 'rp'}
                        {if $member.points_available >= $product.rewards_points}
                            <input type="hidden" name="reward_amount" id="reward_amount_{$prod_id}" value="{$product.rewards_points}" />
                            <input type="submit" name="addtocart_submit" class="button medium style1 {*addtocart_button*} addtocart_buttonP" value="Add to Cart" onclick="_gaq.push(['_trackEvent', 'quickshop', 'addtocart', '{$product.prod_name}']);
                                javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty}, '');" />
                        {/if}
                    {else}
                        <input type="submit" name="addtocart_submit" class="button medium style1 {*addtocart_button*}addtocart_buttonP" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty}, '');" />
                    {/if}
                </form>
            {else}
                <div class="more-link"><a href="{$smarty.capture.product_url}">View Product Options &gt;</a></div>
            {/if}
        {else}
            <div class="more-link"><a href="{$smarty.capture.product_url}">View Product Options &gt;</a></div>
        {/if}

        {*** PRODUCT FORM LAYOUT ***}
    {elseif ($view == product || view == 'product_builder') && $product.children|@count == ''}
        <form method="post" action="index.php" name="product_form" id='product{$pid}_form'>
            <input type="hidden" name="action" value="AddCart" />

            {if $error != ''}
                <div class="errors">
                    <p><em>{$error}</em></p>
                </div>
            {/if}

            {if $view == 'product_builder'}
                <input type="hidden" value="{$bp_id}" name="bp_id">
                <input type="hidden" value="{$st_id}" name="st_id">
                <input type="hidden" value="1" name="qty">
            {/if}
            {if in_array($cust_group,$arGiftWrapGroups)}
                {include file="custom_form.tpl"}
            {/if}
            {include file="gift_wrap.tpl"}
            {include file="gc_send.tpl"}
            {if $settings.additional_prod_display_type != '2' || $product.additional_prods|@count > 0}
                {include file="product_mapping.tpl"}
            {/if}
        {if $product.gift_set == 'y'}{include file="prodgiftset.tpl"}{/if}
{if $product.text_field == 'y'}<div class="note"><input type="text" name="note{if $one_add_button}{$prod_id}{/if}" /></div>{/if}
{if $product.gift_certificate == 'y' && $product.gift_certificate_value < '1'}<div class="gc-value"><label>Value:</label> <input type="number" name="gift_certificate_value{if $one_add_button}{$prod_id}{/if}" /></div>{/if}
{if $product.has_attributes == 'y'}<div class="attributes">{include file="attributes.tpl"}</div>{/if}

{if $allow_purchase}
    {if $view != 'product_builder'}

        {if $product.qty_in_set > 1 && $product.num_sets_displayed > 1}
            <div class="qty-line"><span class="qty-label">Qty.</span> <select name="qty{if $one_add_button}{$prod_id}{/if}" class="qty" id="qty_{$prod_id}" onclick="priceChange('{$prod_id}', 'sub', '', '{$currency_type}');">
                    <option value="{$minQty}">{$minQty}</option>
                    {assign var="disp_qty" value=$product.min_qty}
                    {section name="set" loop=$product.num_sets_displayed start=1}
                        {math equation="x+y" x=$product.qty_in_set y=$disp_qty assign="disp_qty"}
                        <option value="{$disp_qty}">{$disp_qty}</option>
                    {/section}
                </select></div>
            {else}
            <div class="qty-line"><span class="qty-label">Qty.</span> <input type="number" {if $product.fractional_qty == 'y'}step="any"{/if} class='qty qty_quick' name="qty{if $one_add_button}{$prod_id}{/if}" id="qty_{$prod_id}" value="{if !$one_add_button}{if $product.min_qty > 1}{$product.min_qty}{else}1{/if}{/if}" {if $settings.interactive_pricing == 'y'}onKeyUp="priceChange('{$prod_id}', 'dynamic', '', '{$currency_type}');"{/if} />{if $product.fractional_qty == 'y'}{#fractional_qty#}{/if}</div>
            {/if}
        {/if}
    <input type="hidden" id="hidden_price_{$prod_id}" value="{$product.price}" />
{else}
    <div class="status"><b class="orange">{$product_status}</b></div>
    {/if}

{if $one_add_button != 'y'}
    {if $allow_purchase}
        <input type="hidden" name="prod_id" value="{$prod_id}" />
        <input type="hidden" name="cat_id" value="{if $product.cid > 0}{$product.cid}{else}{$cid}{/if}" />
        <input type="hidden" name="sku" value="{$product.sku}" />
        {if $product.rewards_program == 'y' && $cid == 'rp'}
            {$minPoints}
            {if $member.points_available >= $product.rewards_points}
                <input type="hidden" name="reward_amount" id="reward_amount_{$prod_id}" value="{$product.rewards_points}" />
                <div class="btn-add quick_btn_add"><input type="submit" name="addtocart_submit" class="button medium style1 addtocart_buttonP" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty}, '');"/></div>
                {/if}
            {else}
            <div class="btn-add quick_btn_add"><input type="submit" name="addtocart_submit" class="button medium style1 addtocart_buttonP" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty}, '');"/></div>
            {/if}
            {*if $memberinfo.id}<div class="btn-wishlist"><input type="submit" name="wishlist_add" class="button medium style2" value="Wishlist" /></div>{/if*}
            {*if $memberinfo.id}<div class="btn-reorder"><input type="submit" name="reorder_add" class="button medium style2" value="Easy Reorder" /></div>{/if*}

    {/if}
{if $notify}<div><a href="{$notify_url}">Notify me when this item is in stock</a></div>{/if}
{/if}

{elseif $product.children|@count != ''}

    {if $settings.child_display_type == '2'}
        {assign var=oneButton value="1"}
    {/if}

    {*** FORM FOR ONE BUTTON ***}
    {*if $oneButton}
    <form method="post" name="product_form" action="index.php" id="product{$pid}_form">
    <input type="hidden" name="action" value="AddCart" />
    {/if*}
    {if in_array($cust_group,$arGiftWrapGroups)}
        {include file="custom_form.tpl"}
    {/if}
    {include file="gift_wrap.tpl"}	 
    {include file="display_child_product.tpl"}	 

    {*if $oneButton}
    </form>
    {/if*}

{/if}

</div>  <!-- .form -->
{*php}			
$this->assign( "p_prod_url",$_SERVER['SCRIPT_URL']);
{/php*}

{assign var='p_prod_url' value=$smarty.server.SCRIPT_URL}

<a href="#" class="goto_product_detail" onClick="_gaq.push(['_trackEvent', 'quickshop', 'gotopage', '{$product.prod_name}']);">Go To Product Page</a>
<input type="hidden" value="{$p_prod_url}" class="goto_link">
</div> <!-- .order -->




</div> <!-- .info -->

</section>
{*literal*}
<script type="text/javascript">

                            $('.goto_product_detail').click(function() {ldelim}
                                var go_link = $('.goto_link').val();
                                parent.$.fn.colorbox.close();
                                parent.window.location.href = go_link;
    {rdelim});


                            $('.addtocart_buttonP').click(function(e) {ldelim}
                                $form = $(this).parents('form');

                                if (optionCheck2($form[0])) {ldelim}
                                    var prod_id = $form.find('input[name=prod_id]').val();
                                    $form.append('<input type="hidden" id="action_input_' + prod_id + '" name="action_forward" value="/floating_cart" />');

                                    $.post('/', $(this).parents('form').serialize(),
                                            function(data) {ldelim}
                                                buildFloatingCart1(data);
                                                $('#action_input_' + prod_id).remove();
                                                location.href = "#minicart_a";
    {rdelim}, 'json');
    {rdelim}
                                return false;
    {rdelim});

                            $('.minicart_exit').click(function(e){ldelim}
                                e.preventDefault();
                                $('#minicart_overlay_box').fadeOut('fast');
                                return false;
    {rdelim});

                            function buildFloatingCart1(data) {ldelim}
                                var minicart_count = 0;
                                var show_prods = '';
                                $.each(data.cart, function(index, prod){ldelim}
                                    show_prods += "<div style='padding-top: 15px; clear: both; float:left; width:100%; '>";
                                    show_prods += "  <img src='" + prod.web_image + " ' width='65' border='0' align='left' />";
                                    show_prods += "  <div style='margin-left: 65px; margin-bottom: 5px; padding-left:10px' class='overlay_info'; text-align:left;>";
                                    show_prods += "    <div><strong>" + prod.name + " " + prod.att_list + "</strong></div>";
                                    show_prods += "    <div>{$currency_type}" + prod.price + "</div>";
                                    show_prods += "    <div>Qty: " + prod.qty + "</div>";
                                    show_prods += "    <div>Item No. " + prod.sku + "</div>";
                                    show_prods += "  </div>";
                                    show_prods += "</div>";
    {rdelim});
                                console.log(show_prods);
                                parent.$("#minicart_overlay").show();
                                parent.$('#minicart_products').html(show_prods);
                                parent.$('.minicart_total_price').html(data.totals.total_price);
                                parent.$('.minicart_total_qty').html(data.totals.total_qty);
                                parent.$('#minicart_overlay_box').slideDown();

                                //var items = [];
                                //$.each(data, function(prod_id, product){ldelim}
                                //items.push('<li><a href="/product/'+product.prod_id+'"><img src="'+//product.web_image+'" />'+product.prod_name+'</a></li>');

                                //items.length = 3;
                                //$('<ul/>', {html: items.join('')}).appendTo('#minicart_related_products');
                                parent.$.fn.colorbox.close();
                                //{rdelim});
    {rdelim}


</script>
{*/literal*}


{include file="extra-js.tpl"}