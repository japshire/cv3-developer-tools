{include file="_top.tpl"}

<section id="cat">
<div id="no-results">

<header>
<h1>Oops!</h1>
<br />
We're sorry, the page you're looking for was not found! You can try searching for the item or page you're looking for:
<br /><br />

<form method="post" action="index.php" name="searchform" onsubmit="if (searchform.keyword.value=='Item # or Keywords') searchform.keyword.value='';">
 <input type="hidden" name="action" value="Search" />
 <input type="hidden" name="page" value="category" />
 <input type="hidden" name="search_type" value="prodcat" />
 <!-- <input type="hidden" name="category" value="4" />
 <input type="hidden" name="category_andor" value="and" /> -->

 <input type="text{*search*}" {* results="5"*} name="keyword" id="search_keyword" value="{if isset($products.keyword) && $products.keyword != ''}{$products.keyword|stripslashes|replace:'"':'&quot;'}{else}Item # or Keywords{/if}" onfocus="javascript: if (this.value=='Item # or Keywords') this.value='';" onblur="if (this.value=='') this.value='Item # or Keywords';" {if $use_suggested_search == 'y'}onkeyup="javascript:suggestedSearchSniff(event,'suggested_search','Product_Ext_Class','getSuggestedSearch',this);" autocomplete="off"{/if} />
 <input type="submit" name="submit" value="Search" class="button medium style2 iefix" />
</form>
</header>
<br /><br />
<h6>...Or May We Suggest These Customer Favorites:</h6>


{include file="display_product_group.tpl" products=$best_sellers  max="4"}
</div>
</section>
{include file="_bottom.tpl"}