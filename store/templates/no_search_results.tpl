<div class="largertext">
<h2>Sorry!</h2>
Your search for "{$products.keyword|stripslashes}" returned no matching results. 
<br />
You can try searching again with more specific terms... 
</div>
<br />
<div id="custom_search">
<form method="post" action="index.php" class="form_spacing" name="searchform" onSubmit="if (searchform.keyword.value=='search...') searchform.keyword.value='';">

  <input type="hidden" name="action" value="Search">
  <input type="hidden" name="page" value="{$prod_display_type}">
  <input type="text" name="keyword" id="search_keyword" size="15" maxlength="50" class="formtext" value="{if isset($products.keyword) && $products.keyword != ''}{$products.keyword|stripslashes|replace:'"':'"'}{else}search...{/if}" onFocus="javascript: if (this.value=='search...') this.value='';" onBlur="if (this.value=='') this.value='search...';" {if $use_suggested_search == 'y'}onKeyUp="javascript:suggestedSearchSniff(event,'suggested_search','Product_Ext_Class','getSuggestedSearch',this);" autocomplete="off"{/if}>
  <input type="submit" name="submit" value="" class="custom_sitesearch_btn">
  <div id="suggestions">
  </div>
  <input type="hidden" name="fields" value="keywords,prod_name,sku,desc_header,prod_description,cust_1,cust_2,cust_3,cust_4,cust_5,cust_6,attribute1,attribute2,attribute3,attribute4">
  <input type="hidden" name="search_type" value="prodcat">
  <!-- <input type="hidden" name="category" value="4">
  <input type="hidden" name="category_andor" value="and"> -->
  <input type="hidden" name="andor" value="and">
</form>
</div>
<br /><br />
<div class="largertext">
<br />...Or perhaps you'd be interested in some of our most popular items:
<br>
</div>

{include file="display_product_group.tpl" products=$best_sellers label='Best Sellers' max='4'}