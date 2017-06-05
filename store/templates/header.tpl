<div id="header-wrapper" class="">
    <header id="header" class="clearfix">
        <div class="container">
            <div class="mobile-header row hidden-sm hidden-md hidden-lg">
                <div class="col-xs-4">
                    <a href="#menu" class="menu-icon"><span class="glyphicon glyphicon-menu-hamburger"></span> Menu</a>
                </div>
                <div class="col-xs-4 visible-xs text-right">
                    <a href="/viewcart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a>
                </div>
                <div class="col-xs-4 visible-xs text-right">
                    <a href="javascript:slideSearch();"><span class="glyphicon glyphicon-search"></span> Search</a>
                </div>
                <!-- Logo for mobile -->
                <div class="mobile-logo visible-xs col-xs-12">
                    <figure class="figure_align">
                        <a href="/" title="{#store_name#}"><img src="{$img_prefix}/images/logo.png" alt="{#store_name#}" title="{#store_name#}" class="img-responsive center-block"></a>
                    </figure>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4 hidden-xs visible-sm visible-md visible-lg">
                  <!-- Logo for sm md lg -->
                    <figure class="figure_align">
                      <a href="/" title="{#store_name#}"><img src="{$img_prefix}/images/logo.png" alt="{#store_name#}" title="{#store_name#}" class="img-responsive center-block"></a>
                    </figure>
                </div>
                <div class="col-sm-6 col-md-4 text-right">
                    <div class="promo-msg hidden-xs visible-sm visible-md visible-lg">{#header_promo#}</div>
                    <div class="header-links hidden-xs visible-sm visible-md visible-lg">
                        {if $memberinfo.id}<a href="/member" title="{#store_name#} My Account">My Account</a>{else}<a href="/member_login" title="{#store_name#} Account Login">My Account</a>{/if}
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        {include file="cart_count.tpl"}
                    </div>
                    <div id="mobile-search">{include file="sitesearch.tpl"}</div>
                </div>
            </div>
            {include file="minicart.tpl"}
        </div>
    </header>

    <div class="clearfix"></div>

    <!-- Navigation -->
    <div class="nav-wdmanage hidden-xs">
        <nav id="horizontal" class="navbar navbar-default" role="navigation">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="container text-center" id="nav-menu-container">
                <ul class="nav navbar-nav">
                    <!-- HORIZONTAL DROP DOWN BAR EXAMPLE -->
                    <li id="new" class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">New</a>
                        <ul class="dropdown-menu">
                            {assign var=totalSubcats value=$categories.129.sub_cats|@count}
                            {math equation="(y+1)/x" x=2 y=$totalSubcats assign=catsPerColumn format="%d"}
                            <li>
                                {counter assign=columnBreak start=0}
                                {foreach from=$categories key=key item=category}
                                    {if $category.parent == '129' && $category.inactive != 'y'}
                                        <a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" class="iefix" title="{$category.name|replace:"& ":"&amp; "}" data-category-name="{$category.name|replace:'&':'and'|replace:' ':'-'|lower}">{$category.name|replace:"& ":"&amp; "}</a>
                                        {counter assign=columnBreak}
                                    {/if}
                                    {if $catsPerColumn == $columnBreak}
                                        </li>
                                        {counter assign=columnBreak start=0}<li>
                                    {/if}
                                {/foreach}
                            </li>
                            {assign var=totalSubcats value="0"}
                            <li class="prod-col">
                              <div class="image">
                                  <img src="{$img_prefix}/images/dd_prod_img.jpg" class="img-responsive" alt="Promo Image">
                              </div>
                            </li>
                        </ul>
                    </li>
                    <!-- HORIZONTAL DROP DOWN BAR EXAMPLE -->
                    <li id="loose-leaf" class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Loose Leaf</a>
                        <ul class="dropdown-menu">
                            {*assign var=totalSubcats value=$categories.1.sub_cats|@count*}
                            {*math equation="(y+1)/x" x=2 y=$totalSubcats assign=catsPerColumn format="%d"*}
                            {assign var=catsPerColumn value=5}
                            <li>
                                {counter assign=columnBreak start=0}
                                {foreach from=$categories key=key item=category}
                                    {if $category.parent == '1' && $category.inactive != 'y'}
                                        <a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" class="iefix" title="{$category.name|replace:"& ":"&amp; "}" data-category-name="{$category.name|replace:'&':'and'|replace:' ':'-'|lower}">{$category.name|replace:"& ":"&amp; "|replace:" Tea":""}</a>
                                        {counter assign=columnBreak}
                                    {/if}
                                    {if $catsPerColumn == $columnBreak}
                                        </li>
                                        {counter assign=columnBreak start=0}<li>
                                    {/if}
                                {/foreach}
                            </li>
                            {assign var=totalSubcats value="0"}
                            <li class="prod-col">
                              <div class="image">
                                  <img src="{$img_prefix}/images/TopNav/green-tea.jpg" class="img-responsive" alt="Promo Image">
                              </div>
                            </li>
                        </ul>
                    </li>
                    <!-- HORIZONTAL DROP DOWN BAR EXAMPLE -->
                    <li id="tea-sachets" class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Tea Sachets</a>
                        <ul class="dropdown-menu">
                            {assign var=totalSubcats value=$categories.113.sub_cats|@count}
                            {math equation="(y+1)/x" x=2 y=$totalSubcats assign=catsPerColumn format="%d"}
                            <li>
                                {counter assign=columnBreak start=0}
                                {foreach from=$categories key=key item=category}
                                    {if $category.parent == '113' && $category.inactive != 'y'}
                                        <a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" class="iefix" title="{$category.name|replace:"& ":"&amp; "}" data-category-name="{$category.name|replace:'&':'and'|replace:' ':'-'|lower}">{$category.name|replace:"& ":"&amp; "}</a>
                                        {counter assign=columnBreak}
                                    {/if}
                                    {if $catsPerColumn == $columnBreak}
                                        </li>
                                        {counter assign=columnBreak start=0}<li>
                                    {/if}
                                {/foreach}
                            </li>
                            {assign var=totalSubcats value="0"}
                            <li class="prod-col">
                              <div class="image">
                                  <img src="{$img_prefix}/images/dd_prod_img.jpg" class="img-responsive" alt="Promo Image">
                              </div>
                            </li>
                        </ul>
                    </li>
                    <!-- HORIZONTAL DROP DOWN BAR EXAMPLE -->
                    <li id="teaware" class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Teaware</a>
                        <ul class="dropdown-menu">
                            {assign var=totalSubcats value=$categories.9.sub_cats|@count}
                            {math equation="(y+1)/x" x=2 y=$totalSubcats assign=catsPerColumn format="%d"}
                            <li>
                                {counter assign=columnBreak start=0}
                                {foreach from=$categories key=key item=category}
                                    {if $category.parent == '9' && $category.inactive != 'y'}
                                        <a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" class="iefix" title="{$category.name|replace:"& ":"&amp; "}" data-category-name="{$category.name|replace:'&':'and'|replace:' ':'-'|lower}">{$category.name|replace:"& ":"&amp; "}</a>
                                        {counter assign=columnBreak}
                                    {/if}
                                    {if $catsPerColumn == $columnBreak}
                                        </li>
                                        {counter assign=columnBreak start=0}<li>
                                    {/if}
                                {/foreach}
                            </li>
                            {assign var=totalSubcats value="0"}
                            <li class="prod-col">
                              <div class="image">
                                  <img src="{$img_prefix}/images/dd_prod_img.jpg" class="img-responsive" alt="Promo Image">
                              </div>
                            </li>
                        </ul>
                    </li>
                    <!-- HORIZONTAL DROP DOWN BAR EXAMPLE -->
                    <li id="gifts" class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Gifts</a>
                        <ul class="dropdown-menu">
                            {assign var=totalSubcats value=$categories.13.sub_cats|@count}
                            {math equation="(y+1)/x" x=2 y=$totalSubcats assign=catsPerColumn format="%d"}
                            <li>
                                {counter assign=columnBreak start=0}
                                {foreach from=$categories key=key item=category}
                                    {if $category.parent == '13' && $category.inactive != 'y'}
                                        <a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" class="iefix" title="{$category.name|replace:"& ":"&amp; "}" data-category-name="{$category.name|replace:'&':'and'|replace:' ':'-'|lower}">{$category.name|replace:"& ":"&amp; "}</a>
                                        {counter assign=columnBreak}
                                    {/if}
                                    {if $catsPerColumn == $columnBreak}
                                        </li>
                                        {counter assign=columnBreak start=0}<li>
                                    {/if}
                                {/foreach}
                            </li>
                            {assign var=totalSubcats value="0"}
                            <li class="prod-col">
                              <div class="image">
                                  <img src="{$img_prefix}/images/dd_prod_img.jpg" class="img-responsive" alt="Promo Image">
                              </div>
                            </li>
                        </ul>
                    </li>
                    <!-- HORIZONTAL DROP DOWN BAR EXAMPLE -->
                    <li id="learn" class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Learn</a>
                        <ul class="dropdown-menu">
                            {assign var=totalSubcats value=$categories.37.sub_cats|@count}
                            {math equation="(y+1)/x" x=2 y=$totalSubcats assign=catsPerColumn format="%d"}
                            <li>
                                {counter assign=columnBreak start=0}
                                {foreach from=$categories key=key item=category}
                                    {if $category.parent == '37' && $category.inactive != 'y'}
                                        <a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" class="iefix" title="{$category.name|replace:"& ":"&amp; "}" data-category-name="{$category.name|replace:'&':'and'|replace:' ':'-'|lower}">{$category.name|replace:"& ":"&amp; "}</a>
                                        {counter assign=columnBreak}
                                    {/if}
                                    {if $catsPerColumn == $columnBreak}
                                        </li>
                                        {counter assign=columnBreak start=0}<li>
                                    {/if}
                                {/foreach}
                            </li>
                            {assign var=totalSubcats value="0"}
                            <li class="prod-col">
                              <div class="image">
                                  <img src="{$img_prefix}/images/dd_prod_img.jpg" class="img-responsive" alt="Promo Image">
                              </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>

{if $smarty.config.promo_banner}
    <div class="row promo-banner checkout_hide">
        <div class="col-md-12 col-xs-12 font_mini13">
            {#promo_banner#}
        </div>
    </div>
{/if}