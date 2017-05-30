<div id="left_column" class="hidden-xs col-sm-3 col-md-3 pdd_rt0 pull-left pdd_rt15">
    {if $view == checkout || $view == checkout_billing || $view == checkout_payment || $view == checkout_shippingdetailk || $view == checkout_thanks || $view == checkout_confirmation || $view == checkout_shipping || $view == express_order || $view == express_info || $view == checkout_fpinfo || $view == checkout_freeprod || $view == checkout_shippingdetail || $view == quickbuy_confirm || $view == checkout_shippingaddress || $view == checkout_display || $view == viewcart_freeprod || $view == ship_calculator || $view == checkout_addressconfirm}
        {include file="checkout_minicart.tpl"}
    {else}
        {include file="category_filter.tpl"}
        {include file="category_menu.tpl" forpos='left'}
        {include file="global_filter.tpl"}
        {include file="shopbyprice_menu.tpl"}
        {if $view!= 'newsletter'}
            {include file="newsletter.tpl"}
        {/if}
        {include file="display_product_group.tpl" products=$recently_viewed label="Recently Viewed"}
    {/if}
</div>