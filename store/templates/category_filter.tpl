{*if $category_filters|@count}
<div id="category_filter">
 <div class="filter-narrowed-by">
  <span class="label">List Narrowed By:</span>
  {foreach from=$category_filters item=category_filter key=label}
   {$filter_options.labels.$label}: {$category_filter} <a href="/category_filter/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$label}_">(remove)</a>
  {/foreach}
 </div>
</div>
{/if*}

{if $filter_options.filters|@count}
  <div id="category_filter">
    <div class="filter-list">
      <header><h2>Begin Your Tea Journey</h2></header>
      <div class="row">
      <form name="category_filter" action="">
      {assign var="total_filters" value=$filter_options.filters|@count }
      {assign var="cntr" value="0"}
         {foreach from=$filter_options.filters item=filter_option key=filter_option_id}
          {assign var="cntr" value=$cntr+1 }
          <div class="form-group col-xs-12 col-sm-6 col-md-3 text-center">
            <label>{$filter_option.label}</label>
            <select class="filters form-control" name="category_filter_{$filter_option_id}" id="category_filter_{$filter_option_id}" onchange="javascript:goID(this.id);">
               <option label="Choose" value="/category_filter/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$filter_option_id}_">Choose</option>
               {*<option label="{$filter_option.label}" value="/category_filter/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$filter_option_id}_">{$filter_option.label}</option>*}
               {foreach from=$filter_option.values item=value key=value_id}
                 <option label="{$value} ({$filter_option.counts.$value_id})" value="/category_filter/{$cid}/{$filter_option_id}_{$value}" {if $filter_option.selected == $value}selected="{$filter_option.selected}"{/if}>{$value} ({$filter_option.counts.$value_id})</option>
               {/foreach}
            </select>
          </div>
         {/foreach}
         </div>
        </form>
        <div class="col-xs-12 text-center">
          <a class="btn btn-default" href="/category_filter/{$cid}/all">Reset Search</a>
        </div>
      </div>
    </div>
  </div>
{/if}

{***
{if $filter_options.filters|@count}
<section id="category_filter">
<div class="catfilter">
 <div class="filter-list">
  <form name="category_filter" action="">
   {foreach from=$filter_options.filters item=filter_option key=filter_option_id}
     <div class="individual_filter">
      <header><h2>{$filter_option.label}</h2></header>
      <div class="filter_container">
       <ul>
       {foreach from=$filter_option.values item=value key=value_id}
        <li><input type="checkbox" name="{$value}" value="{$filter_option_id}_{$value}" onclick={if $filter_option.selected == $value}"location.href='/category_filter/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$filter_option_id}_';"{else}"location.href='/category_filter/{$cid}/{$filter_option_id}_{$value}';"{/if} {if $filter_option.selected == $value}checked="checked"{/if} /> {$value}</li>
       {/foreach}
       </ul>
      </div>
     </div>
   {/foreach}
    <div class="individual_filter">
      <header><h2>Clear All</h2></header>
      <div class="filter_container">
       <ul>
        <li><input type="checkbox" name="Clear all" value="_" onclick="location.href='/category_filter/{$cid}/all';" /> Clear All</li>
       </ul>
      </div>
    </div>
  </form>
 </div>
</div>
</section>
{/if}
***}