{include file="email_header.tpl"}
{if $approved == 'y'}  {*if you do not require member approval*}

    <br>
      <div align="center">Welcome to our site, {$first_name} {$last_name}!
      <br /><br />
      If you like, we can add all orders previously placed under this email account to your order history. <br /><br />
Please go to the URL below to confirm: <br /><br />
      <a href="{$link}">{$link}</a>
      <br /><br />
      Thanks for joining our site!</div>
      <br>
    </body>
  </html>
{else}
  <html>
    <body>
    <br>
      <div align="center">Congratulations, {$first_name} {$last_name} and welcome to the member program.
      <br /><br />
      If you like, we can add all orders previously placed under this email account to your order history.<br /><br />Please go to the URL below to confirm:
      <br /><br />
      <a href="{$link}">{$link}</a>
      <br /><br />
      Thanks for joining our site!</div>
      <br>
{/if}

{include file="email_footer.tpl"}
