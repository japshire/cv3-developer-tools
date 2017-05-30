{***PRODUCT TABS***}

<div class="clearfix"></div>
<div id="product_tabs">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-justified" role="tablist">
        <li role="presentation" class='active'><a href="#section1_{$product.prod_id}" role="tab" data-toggle="tab">Details</a></li>
        <li role="presentation"><a href="#section2_tab_{$product.prod_id}" role="tab" data-toggle="tab">Recipes</a></li>
        <li role="presentation"><a href="#section3_tab_{$product.prod_id}" role="tab" data-toggle="tab">Q and A</a></li>
        <li role="presentation"><a href="#section4_tab_{$product.prod_id}" role="tab" data-toggle="tab">Additional Info</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content tab_data_container">
        <div role="tabpanel" class="tab-pane active" id='section1_{$product.prod_id}'>
        {if $product.prod_description}{$product.prod_description}{/if}
    </div>
    <div role="tabpanel" class="tab-pane" id="section2_tab_{$product.prod_id}">
        {include file="prodrecipe.tpl"}
    </div>
    
    <div role="tabpanel" class="tab-pane" id="section3_tab_{$product.prod_id}">
        <iframe src="/product_qanda/{$product.prod_id}/{*$cid*}{if $var2 != ''}{$var2}{else}{$var1}{/if}" width="100%" height="400" frameborder="0" marginheight="0" marginwidth="0"></iframe>
    </div>
    <div role="tabpanel" class="tab-pane" id="section4_tab_{$product.prod_id}">
    {if $product.cust_1}{$product.cust_1}{/if}
</div>
</div>

</div>
{*** TAB JS MOVED TO extra-js.tpl ***}