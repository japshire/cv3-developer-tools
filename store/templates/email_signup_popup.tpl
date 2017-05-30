{if !$smarty.session.mobile && !$smarty.cookies.supress_ad && $cgroup_code != 'NL'}


<div id='ad_overlay_wrapper' style='display: none;'>
<div id='ad_fade' style='display: none;'></div>
<div id='ad_overlay3' style='display: none;'>

  <input type='button' name='no_thanks' value='X' style="font-family:Arial, Helvetica, sans-serif;color:#4e3001;text-decoration:none;font-size:12px;float:right;border:none !important;background:none !important;margin-right:20px" />

<header>
 
</header>

<div id="SignUp">

{*
</br></br><b><font size= 4>Welcome to our
Tea Room</b></font>
<br><br>
sign up for Rishi emails to receive
<ul>
<li>special offers and sales</li>
<li>tasting notes</li>
<li>new teas & micro-lots</li>
<li>Rishi expert advice</li>
</ul>
*}

<div class="form-container" style="margin-top:290px;text-align:center">

  <form action="//rishi-tea.us1.list-manage.com/subscribe/post?u=9a32222644515903596be83ac&amp;id=5395f5294e" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" onsubmit="if (mc-embedded-subscribe-form.email.value=='Enter Your Email') mc-embedded-subscribe-form.email.value='';">
   <!-- <span style="font-family:Arial, Helvetica, sans-serif;color:#4e3001;text-decoration:none;font-size:11px">EMAIL </span>--><input type="email" maxlength="45" style="width:190px;margin-top:-3px;font-family:Arial, Helvetica, sans-serif;color:#000;font-size:11px;text-align:center;" value="Enter Your Email" name="EMAIL" id="mce-EMAIL" onfocus="if (this.value=='Enter Your Email') this.value='';" onblur="if (this.value=='') this.value='Enter Your Email';" />

<br>

    <input type="image" value="Subscribe" src="{$img_prefix}/images/newslettersignupsubmit-green.png"name="subscribe" id="mc-embedded-subscribe" style="margin:10px 0 5px 0" />

<br>

  <input type='button' name='no_thanks' value='NO THANKS' style="font-family:Arial, Helvetica, sans-serif;color:#06563d;text-decoration:none;font-size:10px;border:none !important;background:none !important;" />

  </form>



</div>

</div>
</div>
</div>

{literal}
<script type='text/javascript'>
$(function(){
 $('#ad_overlay_wrapper').fadeIn(1000);
 $('#ad_fade').click(closeOverlay).show();
 $('input[name=no_thanks]').click(closeOverlay);
 $('#ad_overlay3').fadeIn(1000);

 set_cookie('supress_ad', 1, 183);
});

function closeOverlay() {
 $('#ad_overlay3').fadeOut(1000, function(){
    $('#ad_fade').hide();
    $('#ad_overlay_wrapper').hide();
 });
}

function set_cookie(c_name,value,exdays) {
 var exdate=new Date();
 exdate.setDate(exdate.getDate() + exdays);
 var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
 document.cookie=c_name + "=" + c_value;
}

</script>
{/literal}

{/if}

{* Code for submitting the form via ajax *}
{literal}
<script type="text/javascript">
$('form[name="newsletter_popup"]').submit(function() {
  // Get email text field and make sure it doesn't contain "Enter Your Email" before submitting
  var email = $('form[name="mc-embedded-subscribe-form"] input[name="EMAIL"]').val();
  if (email == 'Enter Your Email') {
    $('form[name="mc-embedded-subscribe-form"] input[name="EMAIL"]').val('');
  }

  // Once it is submitted, update the display on the submit button so customer will know it is processing
  $('form[name="mc-embedded-subscribe-form"] input[name="submit"]').val('Processing...');

  // Post the form information and load the email_signup_popup_thanks to the modal window
  $.post('/', $(this).serialize(),
    function(data) {
      $('#SignUp').load('/email_signup_popup_thanks');
    }
  );

  // Always return false so regular post submission doesn't take place
  return false;
});
</script>
{/literal}