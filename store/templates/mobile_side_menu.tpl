<nav id="menu">
  <ul>
    <li class="Divider"><a href="/">Home</a></li>
    <li><a href="/shop">Shop</a>
      <ul>
      {foreach from=$categories key=key item=category}
        {if $category.parent == '' && $category.inactive != 'y'}
          <li{if $cid == $key} class="category_top_active"{/if}>
          <a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" title="{$category.name|replace:"& ":"&amp; "}">{$category.name|replace:"& ":"&amp; "}</a>
          {if $category.sub_cats.0 != ''}
            {include file="mobile_side_menu_recur.tpl" cat_id=$key prefix="sub"}
          {/if}
          </li>
        {/if}
      {/foreach}
      </ul>
    </li>
    <li><span>Customer Service</span>
      <ul>
        <li><a href="/aboutus">About Us</a></li>
        <li><a href="/contact">Contact</a></li>
        <li><a href="/faq-and-tips">FAQs</a></li>
        <li><a href="/shipping">Shipping</a></li>
      </ul>
    </li>
  </ul>
</nav>