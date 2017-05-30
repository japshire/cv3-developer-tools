<section id="search" class="">
    <form method="post" action="index.php" name="searchform">
        <input type="hidden" name="action" value="Search" />
        <input type="hidden" name="page" value="category" />
        <input type="hidden" name="search_type" value="prodcat" />
        <!-- <input type="hidden" name="category" value="4" />
        <input type="hidden" name="category_andor" value="and" /> -->
        <label for="keyword" class="sr-only">Search Keyword:</label>
        <input class="form-control" type="text" name="keyword" id="search_keyword" value="{if isset($products.keyword) && $products.keyword != ''}{$products.keyword|stripslashes|replace:'"':'&quot;'}{/if}" placeholder="Search" {if $use_suggested_search == 'y'}onkeyup="javascript:suggestedSearchSniff(event, 'suggested_search', 'Product_Ext_Class', 'getSuggestedSearch', this);" autocomplete="off"{/if} />
        <!-- <input type="submit" name="submit" value="Search" class="button medium style2 iefix" /> -->
        <input class="search-image" type='image' src="{$img_prefix}/images/search.png" alt="Search">
        <div id="suggestions"></div>
    </form>
</section>