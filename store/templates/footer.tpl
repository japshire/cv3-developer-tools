<div class="footerbg">
    <footer id="footer" class="container">
        <div class="row">
            <div class="col-md-4">
                <div id="quicklink" class="row">
                    <div class="col-xs-10">
                        <h3>Service</h3>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-5">
                        <a href="/contact" title="{#store_name#} Contact Us">Contact Us</a>
                        <a href="/faqs" title="{#store_name#} FAQs">FAQs</a>
                        <a href="/shipping" title="{#store_name#} Shipping ">Shipping</a>
                    </div>
                    <div class="col-xs-5">
                        <a href="/store_locator" title="{#store_name#} Retail Locator">Retail Locator</a>
                        <a href="/tracking" title="{#store_name#} Track Order">Track Order</a>
                        <a href="/returns" title="{#store_name#} Exchanges & Returns">Exchanges & Returns</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div id="quicklink2" class="row">
                    <div class="col-xs-10">
                        <h3>Company</h3>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-5">
                        <a href="/aboutus" title="{#store_name#} About">About</a>
                        <a href="/careers" title="{#store_name#} Careers">Careers</a>
                        <a href="/press" title="{#store_name#} Press">Press</a>
                    </div>
                    <div class="col-xs-5">
                        <a href="/wholesale" title="{#store_name#} Wholesale">Wholesale</a>
                        <a href="/catalog_request" title="{#store_name#} Catalogs">Catalogs</a>
                        <a href="/terms" title="{#store_name#} Terms of Use'">Terms of Use</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4" id="connect">
                {include file="newsletter2.tpl"}
                <div class="social">
                    <a href="/" target="_blank"><img src="{$img_prefix}/images/twitter.png" alt="Twitter"></a>
                    <a href="/" target="_blank"><img src="{$img_prefix}/images/instagram.png" alt="Instagram"></a>
                    <a href="/" target="_blank"><img src="{$img_prefix}/images/facebook.png" alt="Facebook"></a>
                </div>
            </div>
            <div class="col-xs-12" id="footer-disclaimer">
                © {$smarty.now|date_format:"%Y"} {#store_name#}. All Rights Reserved. | No images of copy on this site may be used without written permission by Rishi Tea. | 1-877-552-7977 Customer Service M-F 9AM-6PM CST
            </div>
        </div>
        <div class="meta_post_body">{$gateway_links}</div>
        <div class="meta_post_body">{$meta.post_body}</div>
    </footer>
</div>