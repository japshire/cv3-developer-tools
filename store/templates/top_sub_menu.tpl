{foreach from=$categories.$cat_id.sub_cats item=c}
 {assign var="scategory" value=$categories.$c}
 {in_array val=$cid arr=$categories.$cat_id.all_subcats}
 {*if ($ret == 'y' || $cid==$c || $scategory.parent == $cid) && $scategory.inactive != 'y'}
  {assign var=showSubs value=y}
 {/if*}
 {if $scategory.inactive != 'y'}
  {assign var=showSubs value=y}
 {/if}
{/foreach}

{if $showSubs == 'y'}
<ul>
{foreach from=$categories.$cat_id.sub_cats item=c}
 {assign var="scategory" value=$categories.$c}
 {in_array val=$cid arr=$categories.$cat_id.all_subcats}
 {if $scategory.inactive != 'y'}
   <li><a href="/{$prod_display_type}/{if $scategory.url_name != ''}{$scategory.url_name}{else}{$c}{/if}">{$scategory.name|replace:"& ":"&amp; "}</a></li>
  {*if $c.sub_cats.0 != ''}
   {include file="cat_menu_recur.tpl" cat_id=$c prefix=$prefix|cat:"-sub"}
  {/if*}
 {/if}
{/foreach}
</ul>
{/if}