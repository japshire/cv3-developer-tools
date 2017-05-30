{if $smarty.session.mobile}
{*** DEFINE YOUR MOBILE HERO LINKS/IMAGE BELOW ***}


{ *** //////////////  begin date range item ////////////////////***}

{*gift certificate*}

{if $smarty.now|date_format:"%Y%m%d%H%M" > '201704031015' && $smarty.now|date_format:"%Y%m%d%H%M" < '201704102359'}   
 <div class="slide_hp">
       <a href="/product/winter-sprout-dong-pian-oolong-tea/oolong-tea"><img src="{$img_prefix}/images/Hero/GardenDirect_Intro_Hero.jpg" alt="Rishi Tea Garden Direct" width="973" height="412" /></a>  
</div>
 {/if}

{* cyber monday *}
{if $smarty.now|date_format:"%Y%m%d%H%M" > '201611280600' && $smarty.now|date_format:"%Y%m%d%H%M" < '201611282359'}   
 <div class="slide_hp">
        <a href="/category/tea?p=FREEGIFT"><img src="{$img_prefix}/images/Hero/BulkTea2016Hero.jpg" alt="Cyber Monday Deals" width="973" height="412" /></a>
</div>
 {/if}




 { *** //////////////  end date range item ////////////////////***}

 { *** //////////////  ongoing mobile hero item ////////////////////***}
<a href=category/whats-new-and-fresh?utm_source=hero&utm_campaign=GD_2017&utm_medium=mobile><img src="{$img_prefix}/images/Hero/GardenDirect_Thailand-1_2017_Hero.jpg" alt="Rishi Tea Garden Direct" width="973" height="412" /></a>
</div>

 


{else}



{*** DEFINE YOUR SLIDESHOW LINKS/IMAGES BELOW ***}
<div id="slide_container">
  <div id="lnav" onclick="$('#slideshow').cycle('prev');"></div>
    <div id="slideshow">



{ *** //////////////  OPTIONAL DATE RANGE SLIDESHOW ITEM  ////////////////////***}


{* winter warmth *}

{if $smarty.now|date_format:"%Y%m%d%H%M" > '201612080900' && $smarty.now|date_format:"%Y%m%d%H%M" < '201612112359'}   
 <div class="slide_hp">
        <a href="/category/featured-teas/?p=WINTERWARMTH"><img src="{$img_prefix}/images/Hero/15OnAllCinnamonTeaHero.jpg" alt="Winter Warmth" width="973" height="412" /></a> 
</div>
 {/if}

{* weekend sale *}
{if $smarty.now|date_format:"%Y%m%d%H%M" > '201611260900' && $smarty.now|date_format:"%Y%m%d%H%M" < '201611272359'}   
 <div class="slide_hp">
        <a href="/category/tea?p=SAVE102030"><img src="{$img_prefix}/images/Hero/ChooseYourSavings2016Hero.jpg" alt="Holiday Deals" width="973" height="412" /></a>
</div>
 {/if}

{* cyber monday *}
{if $smarty.now|date_format:"%Y%m%d%H%M" > '201611280600' && $smarty.now|date_format:"%Y%m%d%H%M" < '201611282359'}   
 <div class="slide_hp">
        <a href="/category/whats-new-and-fresh?p=FREEGIFT"><img src="{$img_prefix}/images/Hero/BulkTea2016Hero.jpg" alt="Cyber Monday Deals" width="973" height="412" /></a>
</div>
 {/if}

 { *** /////////////// END OPTIONAL DATE RANGE ITEM /////////////////***}


{ *** //////////////  REGULAR SLIDESHOW ITEMS  ////////////////////***}

{ *** //////////////  BEGIN FIRST SLIDE ITEM ////////////////////***}
   
<div class="slide_hp"> 
<a href=category/whats-new-and-fresh?utm_source=hero&utm_campaign=GD_2017&utm_medium=web><img src="{$img_prefix}/images/Hero/GardenDirect_Thailand-1_2017_Hero.jpg" alt="Rishi Tea Garden Direct" width="973" height="412" /></a>
</div>   
 

 { *** //////////////  END SLIDE ITEM ////////////////////***}

{ *** //////////////  BEGIN SECOND SLIDE ITEM ////////////////////***}

<div class="slide_hp"> 
<a href=category/whats-new-and-fresh?utm_source=hero&utm_campaign=GD_2017&utm_medium=web"><img src="{$img_prefix}/images/Hero/GardenDirect_Intro_Hero.jpg" alt="Rishi Tea Garden Direct" width="973" height="412" /></a>
</div>
  

 { *** //////////////  END SLIDE ITEM ////////////////////***}

 { *** //////////////  BEGIN THIRD SLIDE ITEM ////////////////////***}
<div class="slide_hp"> 
<a href=category/matcha-tea-powder?utm_source=hero&utm_campaign=CM_2017&utm_medium=web><img src="{$img_prefix}/images/Hero/CeremonialMatcha2017_Hero.jpg" alt="Rishi Tea Ceremonial Matcha" width="973" height="412" /></a>
</div>
{ *** //////////////  END SLIDE ITEM ////////////////////***}

{ *** //////////////  BEGIN FOURTH SLIDE ITEM ////////////////////***}
<div class="slide_hp"> 
<a href=category/whats-new-and-fresh?utm_source=hero&utm_campaign=GD_2017&utm_medium=web><img src="{$img_prefix}/images/Hero/SpringDetox2017_Hero-1.jpg" alt="Rishi Tea Spring Cleanse" width="973" height="412" /></a>
</div>
{ *** //////////////  END SLIDE ITEM ////////////////////***}
    
</div>

{* <noscript>

<a href="/category/matcha-blends?utm_source=hero&utm_campaign=matcha_blends_2017&utm_medium=web"><img src="{$img_prefix}/images/Hero/MatchaBlends2017_Hero.jpg" alt="Rishi Tea New Matcha Blends" width="973" height="412" /></a>

<a href="/product/winter-sprout-dong-pian-oolong-tea/oolong-tea"><img src="{$img_prefix}/images/Hero/WinterSprout2017Hero.jpg" alt="Rishi Tea Winter Sprout" width="973" height="412" /></a>

<a href="product/executive-mug-ceramic-infuser/teacups?utm_source=hero&utm_campaign=ExecMug_2017&utm_medium=web"><img src="{$img_prefix}/images/Hero/ExecutiveMugHero.jpg" alt="Rishi Tea Executive Mug" width="973" height="412" /></a>

<a href="category/featured-teas?utm_source=hero&utm_campaign=PatagoniaBlends_2017&utm_medium=web"><img src="{$img_prefix}/images/Hero/PatagoniaBlendsHero.jpg" alt="Rishi Tea Patagonia Super Berry Herbal Tea Blends" width="973" height="412" /></a>

<a href="category/tea?utm_source=hero&utm_campaign=SPRING17&utm_medium=web"><img src="{$img_prefix}/images/Hero/BulkTea10percentHero.jpg" alt="Rishi Tea SPRING17" width="973" height="412" /></a>

<a href="category/featured-teas?utm_source=hero&utm_campaign=PatagoniaBlends_2017&utm_medium=web"><img src="{$img_prefix}/images/Hero/PatagoniaBlendsHero.jpg" alt="Rishi Tea Patagonia Super Berry Herbal Tea Blends" width="973" height="412" /></a>

<a href="category/new-blends?utm_source=hero&utm_campaign=Turmeric_Blends_2017&utm_medium=web"><img src="{$img_prefix}/images/Hero/TurmericDoubleTakeHero.jpg" alt="Rishi Tea Turmeric Herbal Tea Blends" width="973" height="412" /></a>

<a href="/category/caffeine-free-herbal"><img src="{$img_prefix}/images/Hero/NewBlends2017Hero.jpg" alt="Rishi Tea New Herbal Blends" width="973" height="412" /></a>

<a href="/category/specialty-teaware"><img src="{$img_prefix}/images/Hero/NewTeaware2016Hero.jpg" alt="Rishi Tea New Teaware" width="973" height="412" /></a> 

<a href="/product/winter-tea-gift-set/gifts?utm_source=hero&utm_campaign=wellness-kit_2017&utm_medium=web"><img src="{$img_prefix}/images/Hero/WinterWellnessDiscountHero.jpg" alt="Rishi Winter Wellness width="973" height="412" /></a> 

<a href="/category/featured-teas?utm_source=hero&utm_campaign=valentine_omija&utm_medium=web"><img src="{$img_prefix}/images/Hero/OmijaBerryHero.jpg" alt="Rishi Tea Valentine Omija Beauty Berry" width="973" height="412" /></a>

<a href="/category/pu-erh-tea"><img src="{$img_prefix}/images/Hero/PuerhPerfection2017Hero.jpg" alt="Rishi Tea Pu-erh Perfection Chinese New Year" width="973" height="412" /></a>

<a href="/category/caffeine-free-herbal"><img src="{$img_prefix}/images/Hero/NewBlends2017Hero.jpg" alt="Rishi Tea New Herbal Blends" width="973" height="412" /></a>

<a href="/category/specialty-teaware"><img src="{$img_prefix}/images/Hero/NewTeaware2016Hero.jpg" alt="Rishi Tea New Teaware" width="973" height="412" /></a> 

<a href="/category/featured-teas"><img src="{$img_prefix}/images/Hero/HighMountainOolong2017Hero.jpg" alt="Rishi New High Mountain Oolongs" width="973" height="412" /></a> 

<a href="/product/turmeric-ginger-chai-organic-caffeine-free-concentrate/caffeine-free-herbal"><img src="{$img_prefix}/images/Hero/SparklingTurmeric2017Hero.jpg" alt="Rishi Sparkling Turmeric Ginger" width="973" height="412" /></a> 

<a href="/category/specialty-teaware"><img src="{$img_prefix}/images/Hero/NewTeaware2016Hero.jpg" alt="Rishi Tea New Teaware" width="973" height="412" /></a>

<a href="/category/whats-new-and-fresh"><img src="{$img_prefix}/images/Hero/Yunnan2016Hero.jpg" alt="Rishi Tea 2016 Yunnan Limited Reserve Teas" width="973" height="412" /></a>

<a href="/product/everyday-matcha-organic-green-tea-powder/green-tea"><img src="{$img_prefix}/images/Hero/EverydayMatchaHero.jpg" alt="Rishi Tea Organic Everyday Culinary Matcha" width="973" height="412" /></a>

<a href="/category/teaware"><img src="{$img_prefix}/images/Hero/NewTeaware2016Hero.jpg" alt="Rishi Tea New Teaware" width="973" height="412" /></a>

<a href="/category/148"><img src="{$img_prefix}/images/Hero/NewTeaware2016Hero.jpg" alt="Rishi Tea New Teaware" width="973" height="412" /></a>

<a href="/product/hibiscus-rooibos-organic-herbal-blend/caffeine-free-herbal"><img src="{$img_prefix}/images/Hero/RooibosRemixHero.jpg" alt="Rishi Tea 2016 Hibiscus Rooibos" width="973" height="412" /></a>

<a href="/product/nishi-gyokuro-saemidori-organic-green-tea/green-tea"><img src="{$img_prefix}/images/Hero/NishiGyokuro2016Hero.jpg" alt="Rishi Tea 2016 Nishi Gyokuro Saemidori" width="973" height="412" /></a>

<a href=”/category/whats-new-and-fresh"><img src="{$img_prefix}/images/Hero/SpringTea2016Hero.jpg" alt="Rishi Tea 2016 Spring Tea" width="973" height="412" /></a>

<a href="/category/matcha-tea-powder"><img src="{$img_prefix}/images/Hero/MatchaMarchHero.jpg" alt="Rishi Tea 15% off Matcha Tea for Matcha March" width="973" height="412" /></a>

<a href="/category/featured-teas"><img src="{$img_prefix}/images/Hero/HerbLabChaiHeroACTUAL.jpg" alt="Rishi Tea Turmeric and Tulsi Chai Limited Edition Herb Lab Series" width="973" height="412" /></a>

<a href="/whole-planet-foundation"><img src="{$img_prefix}/images/Hero/WholePlanetHerop12016.jpg" alt="Rishi Tea 2016 Whole Planet Foundation Whole Foods Market" width="973" height="412" /></a>

<a href="/product/gyokuro-super-green-japanese-green-tea-blend/green-tea"><img src="{$img_prefix}/images/Hero/GyokuroSuperGreenHero.jpg" alt="Rishi Tea Organic Gyokuro Super Green Limited Edition Green Tea" width="973" height="412" /></a>

<a href="/category/features"><img src="{$img_prefix}/images/Hero/FireMonkey2016Hero.jpg" alt="Rishi Tea 25 Off Rishi Turmeric Ginger FIREMONKEY Chinese New Year" width="973" height="412" /></a>

<a href="/product/everyday-matcha-organic-green-tea-powder/green-tea"><img src="{$img_prefix}/images/Hero/EverydayMatchaHero.jpg" alt="Rishi Tea Organic Everyday Culinary Matcha" width="973" height="412" /></a>

<a href="/category/featured-teas"><img src="{$img_prefix}/images/Hero/2016HighMountainOolongHero.jpg" alt="Rishi Tea 2015 Aperitif Herbal Blend" width="973" height="412" /></a>

<a href="/category/features"><img src="{$img_prefix}/images/Hero/FireMonkey2016Hero.jpg" alt="Rishi Tea 25 Off Rishi Turmeric Ginger FIREMONKEY Chinese New Year" width="973" height="412" /></a>

<a href="/category/features"><img src="{$img_prefix}/images/Hero/Valentines2016Hero.jpg" alt="Rishi Tea 2016 Valentines Day 200% off Select Tea" width="973" height="412" /></a>

<a href="/category/tea-bags"><img src="{$img_prefix}/images/Hero/TeaBagNoHassleHero.jpg" alt="Rishi Tea Tea Bag No Hassel" width="973" height="412" /></a>

<a href="/product/aperitif-caffeine-free-herb-lab-series-blend/caffeine-free-herbal"><img src="{$img_prefix}/images/Hero/AperitifHero.jpg" alt="Rishi Tea 2015 Aperitif Herbal Blend" width="973" height="412" /></a>

<a href="/product/digestivo-caffeine-free-herbal-blend/caffeine-free-herbal"><img src="{$img_prefix}/images/Hero/DigestivoHero.jpg" alt="Rishi Tea 2015 Digestivo Herbal Blend" width="973" height="412" /></a>

<a href="/category/tea"><img src="{$img_prefix}/images/Hero/HotTeaMonth2016Hero.jpg" alt="Rishi Tea January 2016 Hot Tea Month Free Shipping" width="973" height="412" /></a>

<a href="/category/s?keyword=teaser"><img src="{$img_prefix}/images/Hero/TeaserStockingStuffersHero.jpg" alt="2015 Holiday Stocking Stuffers" width="973" height="412" /></a>

<a href="/category/black-tea"><img src="{$img_prefix}/images/Hero/BountifulBlackTeaHero.jpg" alt="2015 Holiday Bulk" width="973" height="412" /></a>

<a href="/category/tea-bags?p=DUNKERSDELIGHT"><img src="{$img_prefix}/images/Hero/2015HolidayTeaBagSale.jpg" alt="25 off All Rishi Tea Tea Bags" width="973" height="412" /></a>

<a href="/category/tea?p=BULK15"><img src="{$img_prefix}/images/Hero/22015HolidayBulkTeaHero.jpg" alt="Cyber Monday Rishi Tea 15 off all bulk tea" width="973" height="412" /></a>

<a href="/category/tea?p=SITEWIDE20"><img src="{$img_prefix}/images/Hero/2015BlackFridayHero.jpg" alt="Black Friday 20 off Sitewide" width="973" height="412" /></a>

<a href="category/features"><img src="{$img_prefix}/images/Hero/CalmBeforeStorm_Hero.jpg" alt="Calm Before Storm 15% Off" width="973" height="412" /></a> 

<a href="/category/matcha-tea-powder"><img src="{$img_prefix}/images/Hero/PremiumMatchaHero.jpg" alt="2015 Japanese Premium Matcha" width="973" height="412" /></a>

<a href="/product/paradise-punch-caffeine-free-herbal-blend/whats-new-and-fresh"><img src="{$img_prefix}/images/Hero/ParadisePunchHero.jpg" alt="Rishi Tea Organic Paradise Punch" width="973" height="412" /></a> 

<a href="/product/ruby-oolong-organic-oolong-tea/oolong-tea"><img src="{$img_prefix}/images/Hero/RubyOolonghero.jpg" alt="Rishi Organic Ruby Oolong" width="973" height="412" /></a>

<a href="/category/whats-new-and-fresh"><img src="{$img_prefix}/images/Hero/ShinchaHeroGeneral.jpg" alt="2015 Japanese Shincha" width="973" height="412" /></a>

<a href="/category/featured-teas"><img src="{$img_prefix}/images/Hero/20105MothersDaySaleHero.jpg" alt="Rishi Tea Mothers Day 2015" width="973" height="412" /></a>

<a href="/product/lemon-ginger-caffeine-organic-black-tea-blend/black-tea"><img src="{$img_prefix}/images/Hero/LemonGinger_Hero.jpg" alt="Rishi Tea Lemon Ginger" width="973" height="412" /></a>

<a href="/category/tea"><img src="{$img_prefix}/images/Hero/WholePlanetHero2015.jpg" alt="Rishi Tea Whole Foods Whole Planet Foundation" width="973" height="412" /></a>
</div>

<a href="/product/english-breakfast-organic-black-tea/black-tea"><img src="{$img_prefix}/images/Hero/EnglishBreakfast_Hero.jpg" alt="Organic English Breakfast Black Tea" width="973" height="412" /></a> 

<a href="/product/cui-feng-high-mountain-oolong-tea/oolong-tea"><img src="{$img_prefix}/images/Hero/CuiFengHero.jpg" alt="High Mountain Cui Feng Oolong" width="973" height="412" /></a>

<a href="/category/s?keyword=otur"><img src="{$img_prefix}/images/Hero/TurmericGingerHero.jpg" alt="Rishi Tea Turmeric Ginger" width="973" height="412" /></a>


<a href="/category/tea"><img src="{$img_prefix}/images/Hero/HappyNewYearActualHero.jpg" alt="2014 Happy New Year from Rishi" width="973" height="412" /></a>

<a href="/shipping"><img src="{$img_prefix}/images/Hero/HolidayShippingChart2014.jpg" alt="2014 Holiday Shipping Schedule" width="973" height="412" /></a>

<a href="/product/Digital-gift-certificate/gift-certificate"><img src="{$img_prefix}/images/Hero/EGiftCertificateHero.jpg" alt="New Digital Gift Certificate" width="973" height="412" /></a>

<a href="/product/cocoa-mint-organic-caffeine-free-blend/caffeine-free-herbal"><img src="{$img_prefix}/images/CocoaMintHero.jpg" alt="Organic Cocoa Mint" width="973" height="412" /></a>

<a href="/product/masala-chai-organic-chai-tea-blend/chai"><img src="{$img_prefix}/images/MasalaChai_Hero.jpg" alt="Organic Masala Chai" width="973" height="412" /></a>

 <a href="/product/cocoa-mint-organic-caffeine-free-blend/caffeine-free-herbal"><img src="{$img_prefix}/images/CocoaMintHero.jpg" alt="Organic Cocoa Mint" width="973" height="412" /></a>

<a href="/product/teahouse-matcha-gift-set/tea-sample-sets"><img src="{$img_prefix}/images/Hero/MatchaHero.jpg" alt="Teahouse Matcha Gift Set" width="973" height="412" /></a>

 <a href="/product/cinnamon-plum-sample-set/tea-sample-sets"><img src="{$img_prefix}/images/Hero/CinnamonPlumHero.jpg" alt="Cinnamon Plum Gift Set" width="973" height="412" /></a>

Iced Tea <strong>Fair Trade Tea</strong> Refreshment Redefined <a href="/category/iced-tea">Iced Tea: Refreshment Redefined</a>
<br>
Organic <strong>Cocoa Cabernet</strong><a href="/product/cocoa-cabernet-organic-caffeine-free-herbal-blend/tea-sachets"> Organic Cocoa Cabernet </a>
<br>
<strong>Organic Black Tea</strong>, darjeeling first flush tumsong estate neroli blossom organic fair trade tea. The Embodyment of Spring <a href="/product/darjeeling-first-flush-tumsong-estate-neroli-blossom-organic-fair-trade-black-tea/black-tea">Organic Darjeeling Black Tea</a>
<br>
<a href="/category/tea-bags"><img src="{$img_prefix}/images/hero2.jpg" alt="The Evolution of the Tea Bag" width="973" height="412" /></a>

<a href="/category/tea"><img src="{$img_prefix}/images/Hero/2014SeasonsGreetingsHero.jpg" alt="2014 Season Greetings from Rishi" width="973" height="412" /></a>
</noscript> *}

  <div id="rnav" onclick="$('#slideshow').cycle('next');"></div>
</div>

{*<div id="slideshow_texthp">
  <div id="headline">
      <br>
  </div>
  <div id="slide_body">
    <div id="slide_body_img"></div>
  </div>

</div>*}

<div id="nav" style="margin-top:-40px"></div>
{/if}