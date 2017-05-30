{include file="_top.tpl"}

<h1>Project Nepal: Beautiful Teas with a Mission</h1>
<span style="line-height:24px">The sweet flavor of the Himalayas sweeps the palate away. Its human story stirs the soul...</span>

{include file="slideshow_lp.tpl"}

<div id="landing_page_text" style="text-align:center;margin:30px 20px;color:#fff !important">
<span style="font-size:18px;font-weight:bold;line-height:36px">– Experience our Next Four Project Nepal Teas –</span>
<br>
From every kilo of tea we purchase from Jun Chiyabari Tea Garden, Rishi will donate $2 to FWEAN to support advocacy and training for women in Nepal.
</div>


<div id="four_promo">
  <div id="left_promo" style="background:#fff">
   <a href="/s"><img src="{$img_prefix}/images/Nepalpromo1.jpg" width="224" height="242" alt="Himalayan Green Tea" /></a>
   <div class="promo_content">
    <div class="promo_lg_text_lp"><a href="/product/himalayan-evergreen-nepalese-organic-green-tea/green-tea">Himalayan Green</a></div>
    {*<div class="promo_sm_text"><a href="/">promo text here...</a></div>*}
   </div>
  </div>
  <div id="cntr_promo" style="background:#fff">
   <a href="/"><img src="{$img_prefix}/images/Nepalpromo2.jpg" width="224" height="242" alt="Himalayan Classic Tea" /></a>
   <div class="promo_content">
    <div class="promo_lg_text_lp"><a href="/product/himalayan-2nd-flush-black-tea/black-tea">Himalayan Classic</a></div>
    {*<div class="promo_sm_text"><a href="/">promo text here...</a></div>*}
   </div>
  </div>
  <div id="cntr_promo" style="background:#fff">
   <a href="/"><img src="{$img_prefix}/images/Nepalpromo3.jpg" width="224" height="242" alt="Himalayan Gold Tea" /></a>
   <div class="promo_content">
    <div class="promo_lg_text_lp"><a href="/product/golden-hand-rolled-himalayan-tips-organic-black-tea/black-tea">Himalayan Gold</a></div>
    {*<div class="promo_sm_text"><a href="/">promo text here...</a></div>*}
   </div>
  </div>
  <div id="right_promo" style="background:#fff">
   <a href="/"><img src="{$img_prefix}/images/Nepalpromo4.jpg" width="224" height="242" alt="Himalayan Royal Tea" /></a>
   <div class="promo_content">
    <div class="promo_lg_text_lp"><a href="/product/himalayan-royal-ruby-organic-black-tea/black-tea">Himalayan Royal</a></div>
    {*<div class="promo_sm_text"><a href="/">promo text here...</a></div>*}
   </div>
  </div>
</div>

{include file="display_product_group.tpl" products=$specials label='On Sale' max='4'}
{include file="display_product_group.tpl" products=$new label='New Products' max='4'}
{include file="display_product_group.tpl" products=$best_sellers label='Best Sellers' max='4' *}

{include file="_bottom.tpl"}