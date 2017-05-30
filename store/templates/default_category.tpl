{include file="_top.tpl"}

<section id="cat">
    {if $cid != 's' && $cid != 'o' && $cid != 'p' && $cid != 'r' && $cid != 'n'}
        {*if $categories.$cid.image}
            <div class="cat-img"><img src="{$categories.$cid.image}" alt="{$categories.$cid.name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" /></div>
        {/if*}
        <header><h1>{$categories.$cid.name|replace:"& ":"&amp; "}</h1></header>
    {if $categories.$cid.cat_description}<div class="cat-desc">{$categories.$cid.cat_description|replace:"& ":"&amp; "}</div>{/if}
    {else}<header><h1>Search Results</h1></header>
    {/if}

{if $products.error}<div class='error'>{$products.error}</div>{/if}

{*include file="catcascmenu.tpl"*}

{*** BE SURE TO UNCOMMENT THE JAVASCRIPT IN _BOTTOM.TPL AND _META.TPL IF USING THE GRID/LIST TOGGLE ***}
{*if $products.data|@count}
    <div id="category_options" class="clearfix">
        <ul class="list-inline">
            <li id="prev-next">{include file="prevnextmenu.tpl"}</li>
            <li id="sort">{include file="category_sort.tpl"}</li>
            <li id="per-page">{include file="prods_per_page.tpl"}</li>
            <li id="toggle"><label>VIEW&nbsp;&nbsp;</label><a href="#" id="list"><img id="listImg" src="{$img_prefix}/images/list_off.png"></a>  <a href="#" id="grid"><img id="gridImg" src="{$img_prefix}/images/grid_off.png"></a></li>
            <li id="compare">
              {if $compare}
                <form class="form-inline" method="post" action="index.php">
                  <input type="hidden" name="action" value="CompareProducts" />
                  <input type="hidden" id="compare_ids" name="prod_ids" value="" />
                 <input type="submit" value="Compare Products" class="btn btn-default" />
               </form>
             {/if}
            </li>
        </ul>
    </div>
{/if*}

{include file="category_filter.tpl"}

{if $products.data|@count}
    <div class="clearfix">
        <ul class="display grid pad_tp20 pdd_rt0 pdd_lt0 col-lg-12 col-sm-12 col-md-12 col-xs-12">
            {foreach from=$products.data item=product}
                {cycle values="col1,col2,col3,col4" assign=pos name=pos}
                <li class="{$pos} iefix col-lg-4 col-md-4 col-xs-6 mar_btm">{include file="display_category_product.tpl" product=$product}</li>
                {/foreach}
        </ul>
    </div>

    <div id="prev-next2">{include file="prevnextmenu.tpl"}</div>

{/if}
</section>
{include file="sub_cat_list.tpl"}
{include file="related_cats.tpl"}

{include file="_bottom.tpl"}