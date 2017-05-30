{include file="_top.tpl"}

<script type="text/javascript">
 var pwin;
 function printImg() {ldelim}
  pwin = window.open(document.getElementById("printThis").src,"_blank");
  setTimeout("pwin.print()",2000);
 {rdelim}
</script>

<p><img src="{$img_prefix}/images/qualitypromise.jpg" width="980" height="245" alt="Quality Promise" /></p>

<p><a href="/customer_service"><strong>Rishi Tea's Quality Promise</strong></a><br />
If for any reason you are not fully satisfied with your purchase, let us know and we'll issue a refund or replace it.  That's our promise.</p>

<p>If you're looking for help, please contact our Customer Service team directly or enter your information into the fields below and we'll get back to you within one business day. <br /><br />
<strong>Rishi Tea Customer Service</strong><br />
185 S. 33rd Court<br />
Milwaukee, WI 53208<br />
Phone (877) 552-7977 (M-F, 9am – 6pm CT)<br />
Fax (414) 255-1104<br />
<a href="mailto:customerservice@rishi-tea.com?Subject=Returns%20Request">customerservice@rishi-tea.com</a></p>

{include file="generic_form.tpl"}

{include file="_bottom.tpl"}