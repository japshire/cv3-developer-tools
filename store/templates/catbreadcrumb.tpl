<div id="breadcrumb">
 <div id="sort">{include file="category_sort.tpl"}</div>
 <a href="/">Home</a>&nbsp;/&nbsp;{if $cid != 's' && $cid != 'p' && $cid != 'r' && $cid != 'o' && $cid != 'n' && $cid != 'f' && $cid != 'e' && $cid != 'w' && $cid != 'b'  && $cid != 'rp'}{if $categories.$cid.all_parents.0 != ''}{include file="catbreadcrumb_recur.tpl" cat_id=$categories.$cid.all_parents.0}{/if}{$categories.$cid.name|replace:"& ":"&amp; "}{elseif $cid == 'p'}Shop by Price{elseif $cid == 'r'}Shop by Rating{elseif $cid == 'f'}Search Results{elseif $cid == 's' && $products.keyword == ''}Search Results{elseif $cid == 'rp'}Rewards Program{else}results for "{$products.keyword|stripslashes|replace:"& ":"&amp; "}"{/if}
</div>
