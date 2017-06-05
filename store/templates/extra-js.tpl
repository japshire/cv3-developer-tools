    <link rel="stylesheet" href="/jquery_mmenu_all.css" type="text/css" />
    <script type="text/javascript" src="/jquery_mmenu_min_all.js"></script>
    <script type="text/javascript" src="/downloads/js-libs/bootstrapmin.js"></script>

 {if $rejoiner_enable == 'y'}
   {include file="rejoiner.tpl"}
 {/if}

{* JS for dropdown *}
    <script type='text/javascript'>
        $(".dropdown").hover(
                function() {ldelim}
                    $('.dropdown-menu', this).stop(true, true).fadeIn("fast");
                    $(this).toggleClass('open');
                    $('b', this).toggleClass("caret caret-up");
                {rdelim},
                function() {ldelim}
                    $('.dropdown-menu', this).stop(true, true).fadeOut("fast");
                    $(this).toggleClass('open');
                    $('b', this).toggleClass("caret caret-up");
                 {rdelim});
        $(".dropdown-menu a").hover(
                function() {ldelim}
                    var $this = $(this);
                    var categoryName = $this.data("category-name");
                    $this.parent().parent().find(".prod-col img").each(function(index, value) {ldelim}
                        var src = "/images/TopNav/" + categoryName + ".jpg";
                        $(value).attr("src", src);
                    {rdelim});
                {rdelim});
    </script>

{if $view == product}
  {*** CODE FOR LIGHTBOX POPUP ***}
  <link rel="stylesheet" href="/jquery_fancybox.css"  type="text/css" />
  <script type="text/javascript" src="/fancybox_patched.js"></script>

  <script type="text/javascript">
    $(document).ready(function() {ldelim}
                $(".fancybox").fancybox({ldelim}
                        'width' : 'auto',
                        'height': 'auto',
                        'autoScale': false,
                        'scrolling': 'no',
                        'autoDimensions': true,
                        'showCloseButton': true,
                        'autoScale': true,
                        'fitToView': true,
                         'autoResize': true,
                        //'autoSize': true,
                        //'autoWidth': true,
                        //'autoHeight': true,
                        {rdelim});
    {rdelim});
    </script>

    {* POPUP JS *}
    <script type='text/javascript'>
        function overlayImage(image) {ldelim}
            var altname = '{$name}';
            $('#image_overlay img#popup').attr({ldelim}
                src: image,
                alt: altname
        {rdelim});
            $("#fade, #image_overlay").show();
        {rdelim};
       
            $("#image_overlay, #close").click(function(){ldelim}
                $("#fade, #image_overlay").hide();
        {rdelim});
       
        $(".popup-img").click(function(e){ldelim}
            var popimg = $(this).attr('data-img');
            overlayImage(popimg);
            return false;
        {rdelim});
        $(".popup-link").click(function(e){ldelim}
            var popid = $(this).attr('data-id');
            var popimg = $("#" + popid).attr('data-img');
            overlayImage(popimg);
            return false;
        {rdelim});
    </script>

    {* PRODUCT TABS JS *}
        <script type='text/javascript'>
            $('#tab-row .tab').click(function(){ldelim}
                var pid = this.id.split('_')[2];
                activate_tab(this.id.split('_')[0], pid);
            {rdelim});

            function activate_tab(id, pid) {ldelim}
                $('.product_tabs_' + pid + ' .content').hide();
                $('#' + id + '_' + pid).show();
                $('.product_tabs_' + pid + ' .tab').removeClass('active');
                $('#' + id + '_tab_' + pid).addClass('active');
            {rdelim}

            $(function(){ldelim}
                activate_tab('{$smarty.get.tab|default:"section1"}', '{$prod_id}');
            {rdelim});
        </script>

    <script type='text/javascript'>
        $('form[name="product_form"]').submit(function() {ldelim}
            var qty = $('input[name="qty"]').val();
            var pass = false;
            if (typeof qty != 'undefined'){ldelim}
                pass = true;
                if (!$.isNumeric(qty)) {ldelim}
                    alert('Please enter a valid numerical quantity');
                    return false;
        {rdelim} else if (parseInt(qty) <= 0) {ldelim}
                    alert('Please enter a quantity greater than 0');
                    return false;
        {rdelim}
        {rdelim} else{ldelim} //must be a subproduct page
                $("[id^=qty]").each(function() {ldelim}
                    qty = $(this).val();
                    if ($.isNumeric(qty)) {ldelim}
                        pass = true;
        {rdelim}
        {rdelim});
        {rdelim}
            if (!pass){ldelim}
                alert('Please enter a valid numerical quantity');
                return false;
        {rdelim}
        {rdelim});
    </script>
{/if}

{* SLIDESHOW PLUGIN *}
{if $view == index}
    <script type="text/javascript">
        $(function() {ldelim}
        {*bootstrap carousel*}
            $('.carousel').carousel();
        {rdelim});
        function changeCaption(){ldelim}
            alert('hi');
        {rdelim}
    </script>

    {* newsletter popup script *}
    <script>
        $(function(){ldelim}
            var hasShown = getCookie("emailpopup");
            if (hasShown != 'shown') {ldelim}
                $('#npfade').show();
                $('#popcontainer').fadeIn(1000);
                //set_cookie('supress_ad', 1, 183);
                setCookie('emailpopup', 'shown', 7 * 24 * 60 * 60 * 1000);
        {rdelim} else{ldelim}
                /*$('#npfade').show();
                 $('#popcontainer').fadeIn(1000);*/
        {rdelim}
            $('#close, #npfade, #go').click(closeOverlay);
        {rdelim});
        function closeOverlay() {ldelim}
            $('#popcontainer').fadeOut(1000, function(){ldelim}
                $('#npfade').hide();
        {rdelim});
        {rdelim}
    </script>
{/if}

{* MOBILE - PULL OUT MENU AND SEARCH DROP DOWN *}
    {literal} 
        <script type='text/javascript'>
            function slideSearch() {
                if ($('#mobile-search').css('display') == 'none') {
                    $('#mobile-search').slideDown(600);
                }
                else {
                    $('#mobile-search').slideUp(600);
                }
            }
            $('nav#menu').mmenu();
        </script>
    {/literal}

{*if $view == category || $view == 'prod_detail_list'}
<!-- GRID/LIST TOGGLE SCRIPT -->
<script type="text/javascript">
var delete_cookie = function(name) {ldelim}
document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
{rdelim};  

$(document).ready(function() {ldelim}
    $(function() {ldelim}
        var cc = $.cookie('list_grid');
        console.log(cc);
        if (cc == 'g' || cc == null) {ldelim}
            $('.display').removeClass('list');
        $('.display').addClass('grid');
        $('#listImg').attr('src','/images/list_off.png');
        $('#gridImg').attr('src','/images/grid_on.png');
        {rdelim} else {ldelim}console.log('yu');
        $('.display').removeClass('grid');
        $('.display').addClass('list');
        $('#listImg').attr('src','/images/list_on.png');
        $('#gridImg').attr('src','/images/grid_off.png');
        {rdelim}
        toggleGrid();
        {rdelim});
    $('#grid').click(function() {ldelim}
        $('.display').fadeOut(300, function() {ldelim}
            $(this).addClass('grid').fadeIn(300).removeClass('list');
            toggleGrid();
            $('#listImg').attr('src','/images/list_off.png');
            $('#gridImg').attr('src','/images/grid_on.png');
            delete_cookie('list_grid');
            $.cookie('list_grid', 'g');
            {rdelim});
        return false;
        {rdelim});
    $('#list').click(function() {ldelim}
        $('.display').fadeOut(300, function() {ldelim}
            $(this).removeClass('grid').fadeIn(300).addClass('list');
            toggleGrid();
            $('#listImg').attr('src','/images/list_on.png');
            $('#gridImg').attr('src','/images/grid_off.png');
            delete_cookie('list_grid');
            $.cookie('list_grid', 'l');
            {rdelim});
        return false;
        {rdelim});
    {rdelim});
var toggleGrid = (function() {ldelim}
    $('.display').find('li').each(function(index, value) {ldelim}
        if ($('.display').hasClass('grid')) {ldelim}
            $(value).removeClass('col-xs-12').addClass('col-xs-6 col-md-4 col-lg-3');
        {rdelim} else {ldelim}
        $(value).removeClass('col-md-4 col-xs-6 col-lg-3').addClass('col-xs-12');
        {rdelim}
        {rdelim});
    {rdelim});
</script>
<script>
    if( $.cookie('list_grid') === 'g')
        $("#gridImg").attr('src' , "{$img_prefix}/images/grid_on.png");
    else
        $("#listImg").attr('src' , "{$img_prefix}/images/list_on.png");
</script>
{/if*}

{if $view == 'catalog_request' || $view == 'contact' || $view == 'member_address' || $view == 'member_wishlist'}
    <script type='text/javascript'>
        // Show State/Province when Country changed
        $('select#country').change(function(){ldelim}
            if ($(this).val() == 'United States')
                showDomestic();
            else if ($(this).val() == 'Canada')
                showCanadian();
            else
                showInternational();
        {rdelim}).change();

        function showDomestic() {ldelim}
            $('#state').attr('name', 'state').show();
            $('#province, #ca_province').attr('name', '').hide();
        {rdelim}

        function showCanadian() {ldelim}
            $('#ca_province').attr('name', 'state').show();
            $('#province, #state').attr('name', '').hide();
        {rdelim}

        function showInternational() {ldelim}
            $('#province').attr('name', 'state').show();
            $('#state, #ca_province').attr('name', '').hide();
        {rdelim}
    </script>
{/if}

{if $view == 'checkout_shippingaddress' || $view=='checkout_corporate'}
    <script type='text/javascript'>
        // Show State/Province when Country changed

        {counter start=0 assign=num}
            {section name=shipscript loop=$ship_num}
            {counter}
            
        $('select#s_country{$num}').change(function(){ldelim}
            if ($(this).val() == 'United States')
                showDomestic({$num});
            else if ($(this).val() == 'Canada')
                showCanadian({$num});
            else
                showInternational({$num});
            getInfo('limit_shipping_method', 'Shipping_Class', 'limitMethods', this.value + '|' + document.getElementById('s_state{$num}').value + '|s_method{$num}');
        {rdelim}).change();

        $('select#s_state{$num}').change(function(){ldelim}
            getInfo('limit_shipping_method', 'Shipping_Class', 'limitMethods', document.getElementById('s_country{$num}').value + '|' + this.value + '|s_method{$num}');
        {rdelim}).change();
        {/section}
        function showDomestic(num) {ldelim}
            $('#s_state' + num).attr('name', 's_state' + num).show();
            $('#province' + num + ', #ca_province' + num).attr('name', '').hide();
        {rdelim}

        function showCanadian(num) {ldelim}
            $('#ca_province' + num).attr('name', 's_state' + num).show();
            $('#province' + num + ', #s_state' + num).attr('name', '').hide();
        {rdelim}

        function showInternational(num) {ldelim}
            $('#province' + num).attr('name', 's_state' + num).show();
            $('#s_state' + num + ', #ca_province' + num).attr('name', '').hide();
        {rdelim}
    </script>
{/if}

{if $view == 'checkout_billing' || $view == 'member_info' || $view == 'member_register' || $view == 'wholesale_register' || $view == 'wholesale_info' || $view == 'wholesale_address'}
    <script type='text/javascript'>
        // Show State/Province when Country changed (Billing)
        $('select#billing_country').change(function(){ldelim}
            if ($(this).val() == 'United States')
                showBillingDomestic();
            else if ($(this).val() == 'Canada')
                showBillingCanadian();
            else
                showBillingInternational();
        {rdelim}).change();

        function showBillingDomestic() {ldelim}
            $('#billing_state').attr('name', 'billing_state').show();
            $('#billing_province, #ca_province').attr('name', '').hide();
        {rdelim}

        function showBillingCanadian() {ldelim}
            $('#ca_province').attr('name', 'billing_state').show();
            $('#billing_province, #billing_state').attr('name', '').hide();
        {rdelim}

        function showBillingInternational(num) {ldelim}
            $('#billing_province').attr('name', 'billing_state').show();
            $('#billing_state, #ca_province').attr('name', '').hide();
        {rdelim}
    </script>
{/if}

{if $view == 'checkout_shipping' || $view == 'checkout_corporate'}
    <script type='text/javascript'>
        // Show State/Province when Country changed
        $('select#s_country1').change(function(){ldelim}
            if ($(this).val() == 'United States')
                showDomestic();
            else if ($(this).val() == 'Canada')
                showCanadian();
            else
                showInternational();
            getInfo('limit_shipping_method', 'Shipping_Class', 'limitMethods', this.value + '|' + document.getElementById('s_state1').value + '|s_method1');
        {rdelim}).change();

        $('select#s_state1').change(function(){ldelim}
            getInfo('limit_shipping_method', 'Shipping_Class', 'limitMethods', document.getElementById('s_country1').value + '|' + this.value + '|s_method1');
        {rdelim}).change();

        function showDomestic() {ldelim}
            $('#s_state1').attr('name', 's_state1').show();
            $('#province1, #ca_province1').attr('name', '').hide();
        {rdelim}

        function showCanadian() {ldelim}
            $('#s_state1, #province1').attr('name', '').hide();
            $('#ca_province1').attr('name', 's_state1').show();
        {rdelim}

        function showInternational() {ldelim}
            $('#province1').attr('name', 's_state1').show();
            $('#s_state1, #ca_province1').attr('name', '').hide();
        {rdelim}

        // Show State/Province when Country changed (Billing)
        $('select#billing_country').change(function(){ldelim}
            if ($(this).val() == 'United States')
                showBillingDomestic();
            else if ($(this).val() == 'Canada')
                showBillingCanadian();
            else
                showBillingInternational();
        {rdelim}).change();

        function showBillingDomestic() {ldelim}
            $('#billing_state').attr('name', 'billing_state').show();
            $('#billing_province, #ca_billing_province').attr('name', '').hide();
        {rdelim}

        function showBillingCanadian() {ldelim}
            $('#ca_billing_province').attr('name', 'billing_state').show();
            $('#billing_province, #billing_state').attr('name', '').hide();
        {rdelim}

        function showBillingInternational(num) {ldelim}
            $('#billing_province').attr('name', 'billing_state').show();
            $('#billing_state, #ca_billing_province').attr('name', '').hide();
        {rdelim}
    </script>
{/if}

{*literal}
<!-- Start of Async HubSpot Analytics Code -->
<script type="text/javascript">
(function(d,s,i,r) {
if (d.getElementById(i)){return;}
var n=d.createElement(s),e=d.getElementsByTagName(s)[0];
n.id=i;n.src='//js.hubspot.com/analytics/'+(Math.ceil(new Date()/r)*r)+'/208995.js';
e.parentNode.insertBefore(n, e);
})(document,"script","hs-analytics",300000);
</script>
<!-- End of Async HubSpot Analytics Code -->
{/literal*}

{if $smarty.session.floating_cart == 'y' && ($view != 'product_builder' || ($view == 'product_builder' && $product.build_complete == 'y'))}
    <script>
        $(function(){ldelim}

            $('.addtocart_button').click(function(e) {ldelim}
                if (optionCheck2($(this).closest('form')[0])) {ldelim}

        {* THIS IS THE ADD MULTIPLE LOGIC ... Saving for a another day when this can be built in
        var products = [];
        var prod_id = $(this).closest('form').find('input[name=prod_id]').val();
        var sku = $(this).closest('form').find('input[name=sku]').val();
        var qty = $(this).closest('form').find('input[name=qty]').val();
        if (qty < 1 || typeof qty === "undefined") {ldelim}
        qty = $(this).find('input[name=qty]').val();
        {rdelim}
        if (qty > 0) {ldelim}
        var prod = {ldelim}id:prod_id,sku:sku,qty:qty{rdelim};
        products.push(prod);
        {rdelim}
        *}

                    var prod_id = $(this).closest('form').find('input[name=prod_id]').val();
                    $(this).closest('form').append('<input type="hidden" id="action_input_' + prod_id + '" name="action_forward" value="/floating_cart" />');
                    $.post('/', $(this).closest('form').serialize(),
                            function(data) {ldelim}
                                buildFloatingCart(data);

       {if $settings.rejoiner_enable == 'y'}
          setTimeout(function(){ldelim}
            rejoinerSendCartData(data);
          {rdelim}, 500);
          setTimeout(function(){ldelim}
            rejoinerSendCartItems(data);
          {rdelim}, 250);
        {/if}

                                $('#action_input_' + prod_id).remove();
                                location.href = "#minicart_a";
        {rdelim}, 'json');
        {rdelim}
                return false;
        {rdelim});

            $('.minicart_exit').click(function(e){ldelim}
                e.preventDefault();
                $('#minicart_overlay_box').fadeOut('fast');
                return false;
        {rdelim});

        {rdelim});

        function buildFloatingCart(data) {ldelim}
            var minicart_count = 0;
            var show_prods = '';
            $.each(data.cart, function(index, prod){ldelim}
                show_prods += "<div class='minicart_product'>";
                show_prods += "  <img src='" + prod.web_image + " ' width='65' border='0' align='left' />";
                show_prods += "  <div style='margin-left: 65px; margin-bottom: 5px; padding-left:10px' class='overlay_info'>";
                show_prods += "    <div><strong>" + prod.name + " " + prod.att_list + "</strong></div>";
                show_prods += "    <div>{$currency_type}" + prod.price + "</div>";
                show_prods += "    <div>Qty: " + prod.qty + "</div>";
                show_prods += "    <div>Item No. " + prod.sku + "</div>";
                show_prods += "  </div>";
                show_prods += "</div>";
        {rdelim});
            $('#minicart_products').html(show_prods);
            $('.minicart_total_price').html(data.totals.total_price);
            $('.minicart_total_qty').html(data.totals.total_qty);
            $('#minicart_overlay_box').slideDown();
        {rdelim}

        function optionCheck2(theForm) {ldelim}
            for (i = 0; i < theForm.elements.length; i++) {ldelim}
                 if( ( theForm.elements[i].type == "select-one" ) && ( theForm.elements[i].selectedIndex == 0 ) && (theForm.elements[i].name != 'custom_field1') && (theForm.elements[i].name != 'recipient_mapping') && (theForm.elements[i].name.substr(0,18) != 'recurring_interval') ) {ldelim}

                    var option_len = theForm.elements[i].options[0].text.length;
                    var option_name = theForm.elements[i].options[0].text.substring(9, option_len);
                    var message = "Please choose an option before adding to cart.";
                    alert(message);
                    return false;
        {rdelim}
        {rdelim}
            return true;
        {rdelim}

    </script>
{/if}

    <script>
        $('document').ready(function(){ldelim}
            $('.addtocart_button').click(function(e) {ldelim}
                if (optionCheck2($(this).closest('form')[0])) {ldelim}
                    return;
        {rdelim}
        {rdelim});
        {rdelim});
    </script>

<script>
    function alignCompareButton() {ldelim}
        if (($(window).width() > 456)) {ldelim}
        $('li#compare').addClass('pull-right');
        {rdelim} 
        else {ldelim}
        $('li#compare').removeClass('pull-right');
        {rdelim}
    {rdelim};
    $('document').ready(alignCompareButton());
</script>

{if $view == 'checkout_corporate'}
<script>
    $('document').ready(function(){ldelim}
        hideDivs();
     {rdelim});

     function hideDivs() {ldelim}
          if (!$("#stateField1").has("select").length) {ldelim}
            $("#cond_hide1").addClass("hidden");
            console.log("hide1");
          {rdelim}
          if (!$("#countryField1").has("input").length) {ldelim}
            $("#cond_hide2").addClass("hidden");
            console.log("hide2");
          {rdelim}
     {rdelim}
      
     function showFileName(fileName){ldelim}
        console.log(fileName);
        fName = fileName.replace(/\\/g, '/').replace(/.*\//, '');
        console.log(fName);
        $("#fileDisplay").val(fName);
     {rdelim};
</script>
<script>
    function showMoreCol() {ldelim}
    $('td.more_col').toggleClass('hide_col');
    $('th.more_col').toggleClass('hide_col');
    {rdelim};
 
    $('document').ready(function(){ldelim}
        condHideFormDiv();
        addFormControls();
        hideDivs();
     {rdelim});
     
     function addFormControls() {ldelim}
        $("#sStateField1").addClass("form-control");
        $("#sCountryField1").addClass("form-control");
        $("#sZipField1").addClass("form-control");
        $("#sStateField2").addClass("form-control");
        $("#sZipField2").addClass("form-control");
        $("#sCountryField2").addClass("form-control");
     {rdelim};

     function condHideFormDiv() {ldelim}
          if ($("#s_country1").attr('type') == 'hidden') {ldelim}
            $("#cond_hide1").addClass("hidden");
          {rdelim}
          else {ldelim}
              $("#cond_hide1").removeClass("hidden");
          {rdelim}
        
          if ($("#billing_country").attr('type') == 'hidden') {ldelim}
          $("#cond_hide2").addClass("hidden");
          {rdelim}
          else {ldelim}
              $("#cond_hide2").removeClass("hidden");
          {rdelim}
     {rdelim};
</script>
{/if}

{if $view == 'category'}
{literal}
<script type='text/javascript'>
// init your element
var $nav = $('#header-wrapper');
// use a boolean var to check if the element is already shrinked
var navShrinked = false;

$(window).on('scroll', function() {
  if ($(this).scrollTop() > 1){
    // add class only once
    if (!navShrinked) {
      $nav.addClass("minimal");
      $('#header figure').slideUp( 200 );
      $('#header .promo-msg').slideUp( 200 ).removeClass('visible-sm visible-md visible-lg');
      $('#category #main').css( "margin-top" , "145px" );
      navShrinked = true;
    }
  }
  else{
    // remove class only once
    if (navShrinked) {
      $nav.removeClass("minimal");
      $('#header figure').slideDown( 200 );
      $('#header .promo-msg').slideDown( 200 ).addClass('visible-sm visible-md visible-lg');
      $('#category #main').css( "margin-top" , "252px" );
      navShrinked = false;
    }
  }
});
</script>
{/literal}
{/if}