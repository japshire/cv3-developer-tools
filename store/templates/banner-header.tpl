{if $view == 'index'}
    <!-- SLIDESHOW - MODIFY OPTIONS IN _BOTTOM.TPL -->
    <div id="Carousel" class="carousel slide carousel-fade col-lg-12 col-offset-2 pdd_rt0 pdd_lt0" data-ride="carousel">
        {*<ol class="carousel-indicators">
            <li data-target="#Carousel" data-slide-to="0" class="active"><span class="carousel_count">1</span></li>
            <li data-target="#Carousel" data-slide-to="1"><span class="carousel_count">2</span></li>
            <li data-target="#Carousel" data-slide-to="2"><span class="carousel_count">3</span></li>
        </ol>*}

        <div class="carousel-inner">
            <div class="item active">
                <a href="/"><img src="{$img_prefix}/images/slide1.jpg" alt="Hero1" class="img-responsive"></a>
            </div>
            <div class="item">
                <a href="/"><img src="{$img_prefix}/images/slide2.jpg" alt="Hero2" class="img-responsive"></a>
            </div>
            <div class="item">
                <a href="/"><img src="{$img_prefix}/images/slide3.jpg" alt="Hero3" class="img-responsive"></a>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#Carousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#Carousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="clearfix"></div>
{elseif $view == 'category'}
    {if $categories.$cid.image}
        <div class="cat-top">
            <img src="{$categories.$cid.image}" alt="{$categories.$cid.name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" class="img-responsive">
        </div>
    {/if}
{else}

{/if}