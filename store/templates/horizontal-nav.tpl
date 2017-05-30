{*** ORIGINAL CODE I HAD ***}

{*<div id="nav_links">  
  <ul id="drop">
 {foreach from=$categories key=key item=category}
  {if $category.parent == '' && $category.inactive != 'y'}
    <li><span class="left"></span><a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}"{if $category.sub_cats.0 != ''}{/if}{if $first == y}{/if}">{$category.name|replace:"& ":"&amp; "}{assign var="first" value="n"}
  <!--[if gte IE 7]><!--></a><span class="right"></span>  {if $category.sub_cats.0 != ''}
  <!--[if gte IE 7]><!--></a><!--<![endif]-->
  <!--[if lte IE 6]><table><tr><td><![endif]-->
   {include file="cat_menu_recur.tpl" cat_id=$key prefix="sub"}
  <!--[if lte IE 6]></td></tr></table></a><![endif]-->
 {else}
  </a>
  {/if}
  </li>
 {/if}
{/foreach}
  </ul>
</div>*}

{*** END ORIGINAL CODE I HAD ***}

{*** NEW CODE ***}

{*<div id="nav_links"> 
  {foreach from=$categories key=key item=category} 
    {if $category.parent == '' && $category.inactive != 'y'}
      <ul id="drop">
        <li><span class="left"></span><a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}">{$category.name}</a><span class="right"></span>
     {if $category.sub_cats.0}{include file="cat_menu_recur.tpl" cat_id=$key}{/if}
          {else}
            <ul>
             {include file="cat_menu_recur.tpl" cat_id=$key prefix="sub_menu"}
            </ul>
        </li>
      </ul>
    {/if}
  {/foreach}
</div>

{literal}
<script type='text/javascript'>

$('#nav_links ul ul').hide();

$('#nav_links li').hover(
      function() { $(this).children("ul").show(); },
      function() { $(this).children("ul").hide(); }
);

</script>
{/literal*}

{*** END NEW CODE ***}

<div id="menu">
<ul>{strip}
{foreach from=$categories key=key item=category}
	
{if $category.parent == '' && $category.inactive != 'y'}
 <li><a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}">{$category.name}</a>
 {if $category.sub_cats.0 != ''}
	{assign var="subcat" value="n"}
	{foreach from=$category.sub_cats key1=key1 item=subcategory}		
		{if $categories.$subcategory.inactive != 'y'}
			{assign var="subcat" value="y"}
		{/if}		
	{/foreach}
	
  {if $subcat == y}
	<div class="sub"{*{if $key == 1 || $key == 9 || $key == 13 || $key == 37} style="width:550px;"*}{if $key == 1 || $key == 9 || $key == 13 || $key == 37} style="width:360px;"{/if}>{include file="cat_menu_recur.tpl" cat_id=$key prefix="sub_menu"}</div>
  {/if}
  
 {/if}
 </li>
{/if}
{/foreach}
{/strip}
   <li><a href="/category/sale">Sale</a></li>
   <li><a href="/learn">Learn</a>
	<div class="sub" style="width:360px;">
        <ul><li><h3><a href="/category/no-leaf-unturned">Categories of Tea</a></h3></li></ul>
        <ul><li><h3><a href="/aboutus">Origins of Rishi</a></h3></li></ul>
        <ul><li><h3><a href="/tea_faq">Tea FAQ</a></h3></li></ul>
        <ul><li><h3><a href="/category/travelogue">Travelogue</a></h3></li></ul>
        <ul><li><h3><a href="/category/recipes">Recipes</a></h3></li></ul>
       </div>
  </li>
</ul>
</div>

<div id="search">
{include file="sitesearch.tpl"}
</div>