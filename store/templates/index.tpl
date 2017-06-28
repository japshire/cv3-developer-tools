{include file="_top.tpl"}

<section id="promos" class="row">
    <div class="col-sm-4">
        <a href="/category/whats-new-and-fresh" title="Promo1"><img src="{$img_prefix}/images/promo1.jpg" class="img-responsive center-block"></a>
        <h2>New + Seasonal</h2>
       <h3>Visit Often</h3>
    </div>
    <div class="col-sm-4">
        <a href="/product/teahouse-matcha-organic-japanese-green-tea-powder/matcha-tea-powder" title="Promo2"><img src="{$img_prefix}/images/promo2.jpg" class="img-responsive center-block"></a>
        <h2>Teahouse Matcha</h2>
       <h3>Umami + Vibrant</h3>
    </div>
    <div class="col-sm-4">
        <a href="/product/masala-chai-tea-concentrate-organic-chai-tea/chai" title="Promo3"><img src="{$img_prefix}/images/promo3.jpg" class="img-responsive center-block"></a>
        <h2>Masala Chai</h2>
       <h3>With Loose Leaf or Concentrate</h3>
    </div>
</section>

<hr>

<div id="welcome" class="text-center">
    <img src="{$img_prefix}/images/magnifying-glass.jpg" alt="Rishi Magnifying Glass" class="img-responsive center-block">
    <h2>{#home_title#}</h2>
    <div class="row">
        <div class="col-xs-6 col-sm-3">
            <img src="{$img_prefix}/images/welcome-img-block.jpg" class="img-responsive" alt="Welcome1">
            <a href="/" class="text-block">
                <h2>Hubei Province, China</h2>
                <p>Green Tea Co-op</p>
            </a>
        </div>
        <div class="col-xs-6 col-sm-3">
            <img src="{$img_prefix}/images/welcome-img-block.jpg" class="img-responsive" alt="Welcome2">
            <a href="/" class="text-block">
                <h2>Hubei Province, China</h2>
                <p>Green Tea Co-op</p>
            </a>
        </div>
        <div class="col-xs-6 col-sm-3">
            <img src="{$img_prefix}/images/welcome-img-block.jpg" class="img-responsive" alt="Welcome3">
            <a href="/" class="text-block">
                <h2>Hubei Province, China</h2>
                <p>Green Tea Co-op</p>
            </a>
        </div>
        <div class="col-xs-6 col-sm-3">
            <img src="{$img_prefix}/images/welcome-img-block.jpg" class="img-responsive" alt="Welcome4">
            <a href="/" class="text-block">
                <h2>Hubei Province, China</h2>
                <p>Green Tea Co-op</p>
            </a>
        </div>
        <div class="col-xs-6 col-sm-3">
            <img src="{$img_prefix}/images/welcome-img-block.jpg" class="img-responsive" alt="Welcome5">
            <a href="/" class="text-block">
                <h2>Hubei Province, China</h2>
                <p>Green Tea Co-op</p>
            </a>
        </div>
        <div class="col-xs-6 col-sm-3">
            <img src="{$img_prefix}/images/welcome-img-block.jpg" class="img-responsive" alt="Welcome6">
            <a href="/" class="text-block">
                <h2>Hubei Province, China</h2>
                <p>Green Tea Co-op</p>
            </a>
        </div>
        <div class="col-xs-6 col-sm-3">
            <img src="{$img_prefix}/images/welcome-img-block.jpg" class="img-responsive" alt="Welcome7">
            <a href="/" class="text-block">
                <h2>Hubei Province, China</h2>
                <p>Green Tea Co-op</p>
            </a>
        </div>
        <div class="col-xs-6 col-sm-3">
            <img src="{$img_prefix}/images/welcome-img-block.jpg" class="img-responsive" alt="Welcome8">
            <a href="/" class="text-block">
                <h2>Hubei Province, China</h2>
                <p>Green Tea Co-op</p>
            </a>
        </div>
    </div>
</div>

{*include file="display_product_group.tpl" products=$featured label='Featured Products' max=4 seemore=1 link='/'|cat:$prod_display_type|cat:'/e'*}
{*include file="display_product_group.tpl" products=$best_sellers label='Best Sellers' max=4 seemore=1 link='/'|cat:$prod_display_type|cat:'/b'*}
{*include file="display_product_group.tpl" products=$specials label='On Sale' max=4 seemore=1 *}
{*include file="display_product_group.tpl" products=$new label='New Products' seemore=1 max=4 link='/'|cat:$prod_display_type|cat:'/n'*}
{*include file="featured_cats.tpl" max=4*}

{include file="_bottom.tpl"}