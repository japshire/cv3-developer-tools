</div><!-- END #content -->

<!-- SIDE NAV COLUMN -->	
{*include file="left_column.tpl"*}

<div class="clearfix"></div>
<section id="newsletter-block">
    <div class="container">
        <h2>Be First to Learn about Limited Releases & Receive 15% Off Your First Order</h2>
        {include file="newsletter.tpl"}
    </div>
</section>

</div><!-- END #main -->

<!-- FOOTER CONTENT -->
{include file="footer.tpl"}

</div><!-- END #container -->

<!-- EXTRA JS -->
{include file="extra-js.tpl"}

<!-- Email sign up popup  -->
 {if $view == 'index' }{include file="newsletter-popup.tpl"} {/if}

</body>
<!--{$meta.post_comment}-->
</html>