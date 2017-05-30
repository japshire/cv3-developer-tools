{*<div><a href="/shipping">{#header_promo#}</a>
</div>*}

{if $view != 'checkout' && $view != 'checkout_shippingaddress' && $view != 'checkout_shipping' && $view != 'checkout_billing' && $view != 'checkout_confirmation'}
<div>

{**** MailChimp signup form ****}
  <form action="//rishi-tea.us1.list-manage.com/subscribe/post?u=9a32222644515903596be83ac&amp;id=5395f5294e" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" onsubmit="if (mc-embedded-subscribe-form.email.value=='Sign up for our e-newsletter') mc-embedded-subscribe-form.email.value='';">
    <input type="email" maxlength="50" class="newstext" value="Sign up for our e-newsletter" name="EMAIL" id="mce-EMAIL" onfocus="if (this.value=='Sign up for our e-newsletter') this.value='';" onblur="if (this.value=='') this.value='Sign up for our e-newsletter';"{* placeholder="email address"*}/>
    <input type="submit" value="SUBMIT" name="subscribe" id="mc-embedded-subscribe" class="button medium style5" />
  </form>

{*if $newsletter_captcha}
  <div>
    {if $captcha_method == '1'}
      <span class="smalltext"><font color="#ff0000">*</font> Type image characters:</span>
      <input type="text" name="captcha_test" class="formtext" />{if $valid.return} <font color="#ff0000"><b>X</b></font> {/if}
      <img src="{$img_prefix}/get_captcha_image" />
    {else}
      <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
      <noscript>
        <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
        <br />
        <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
        <input type="hidden" name="recaptcha_response_field" value="manual_challenge" />
      </noscript>
      {if $valid.return} <font color="#ff0000"><b>X</b></font> {/if}
    {/if}
  </div>
{/if*}

</div>
{/if}
