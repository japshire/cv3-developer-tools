{if $categories.$cat_id.all_parents.0 != ''}{include file="catbreadcrumb_recur.tpl" cat_id=$categories.$cat_id.all_parents.0}{/if}<a href="/{$prod_display_type}/{if $categories.$cat_id.url_name != ''}{$categories.$cat_id.url_name}{else}{$cat_id}{/if}">{$categories.$cat_id.name|replace:"& ":"&amp; "}</a><span class="separator">/</span>