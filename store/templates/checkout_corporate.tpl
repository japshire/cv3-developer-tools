{include file="_top.tpl"}

<h1>Corporate Order Form</h1>

<div class="mar_btm">
  <span class="req">*</span> Indicates a required field
</div>

{if $valid.return == "1"}
<div class="mar_btm">
  <b>There has been an error. Please double check any fields that show an <span class="glyphicon glyphicon-remove req"></span></b>
</div>
{/if}
{if $gateway_response != ""}
<div class="alert alert-danger">There was an error processing your card: {$gateway_response}</div>
{elseif $error != ""}
<div class="alert alert-danger">Your file contained errors: {$error}</div>
{/if}

<form method="post" action="index.php" name="ship_form" enctype="multipart/form-data" role="form"> 
  <input type="hidden" name="action" value="CheckoutCorporate">

  <div>
    <h2>Create Order File</h2>
    <div class="mar_btm">
      Use this form to import a multiple ship-to order with a simple text file.  This file will describe the shipping information as well as the products to be shipped and should be formatted according to the specification linked below.  You will be able to review your order before it is confirmed.
    </div>
    <div class="row">
      <div class="col-sm-6">
        <div class="form-group {if $valid.return} has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> Order File:</label>
          <div class="input-group">
            <span class="input-group-btn">
              <label class="btn btn-primary btn-file"><input type="file" name="order_file" onchange="showFileName(this.value)"*}/>Choose File</label>

            </span>
            <input class="form-control" id="fileDisplay" type="text" readonly/>{if $valid.return} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
      </div>
    </div>
    <div class="mar_btm">
       <a href="/checkout_corporate_format" target="_blank">View File Format</a><br />
  <a href="/checkout_corporate_example" target="_blank">View Sample File</a>

    </div>
  </div>
  <div id="billing_info" style="display: {if $valid.payment_method == 'paypal'}none{else}block{/if};">
    <div id="checkoutPanel">
      <h3>Enter Billing Information</h3>
      {if $is_member != 'y'}
      <div class="mar_btm"> Have a member account?  Please <a href="/member_login">login</a>.
      </div>
      {/if}
      <div class="row">
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.first_name == ''} has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> First Name:</label>
            <input class="form-control" type="text" name="first_name" value="{$valid.first_name}" maxlength="50"/>{if $valid.return and  $valid.first_name == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.last_name == ''} has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> Last Name:</label>
            <input class="form-control" type="text" name="last_name" value="{$valid.last_name}" maxlength="50" />{if $valid.return and  $valid.last_name == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label>Title:</label>
            <input class="form-control" type="text" name="title" value="{$valid.title}" maxlength="50" />
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label>Company:</label>
            <input  class="form-control" type="text" name="company" value="{$valid.company}" maxlength="50"/>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.billing_address1 == ''} has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> Billing Address:</label>
            <input class="form-control" type="text" name="billing_address1" value="{$valid.billing_address1}" maxlength="50"/>{if $valid.return and  $valid.billing_address1 == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.is_valid.billing_address2 == 'n'} has-error has-feedback bg-danger {/if}">
            <label>Billing Address Line 2:</label>
            <input class="form-control" type="text" name="billing_address2" value="{$valid.billing_address2}" maxlength="50" />{if $valid.return and $valid.is_valid.billing_address2 == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.billing_city == ''} has-error has-feedback bg-danger {/if}">
            <label><span class="req">*</span> City:</label>
            <input class="form-control"type="text" name="billing_city" value="{$valid.billing_city}" maxlength="50" />{if $valid.return and  $valid.billing_city == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        {if $uk != 'y'}
        <div class="col-sm-6">
          <div class="form-group">
            <label><span class="req">*</span> State/Province:</label>
            <select class="form-control" name="billing_state">
              {html_options options=$options.state selected=$valid.billing_state}
            </select>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.billing_zip == ''} has-error has-feedback bg-danger {/if}">
            <label><span class="req">*</span> Postal Code:</label>
            <input class="form-control" type="text" name="billing_zip" value="{$valid.billing_zip}" maxlength="30"/>{if $valid.return and $valid.billing_zip == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label><span class="req">*</span> Country:</label>
            <select class="form-control" name="billing_country">
              {html_options options=$options.country selected=$valid.billing_country}
            </select>
          </div>
        </div>
        {else}
        {* for uk *}
        <div class="col-sm-6">
          <div class="form-group">
            <label><span class="req">*</span> Address Type:</label>
            <div class="radio"><label><input type="radio" name="shipping_type1" id="shipType1d" value="dom" onMouseUp="javascript: setShipType(this,'billing','1'), addFormControls(), condHideFormDiv();" /> Domestic (U.S.A.)</label></div>
            <div class="radio"><label><input type="radio" name="shipping_type1" id="shipType1i" value="int" onMouseUp="javascript: setShipType(this,'billing','1'), addFormControls(), condHideFormDiv();" /> International</label></div>
          </div>
        </div>
        <div id="cond_hide1">
        <div class="col-sm-6" >
          <div class="form-group">
            <label id="stateCaption1"></label>
            <div id="stateField1"></div>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label id="zipCaption1"></label>
            <div id="zipField1"></div>
          </div>
        </div>
      </div>
        <div class="col-sm-6" id="cond_hide2">  
          <div class="form-group">
            <label id="countryCaption1"></label>
            <div id="countryField1"></div>
          </div>
        </div>
        {if $valid.billing_country == 'United States'}
        <script type="text/javascript">
        var item = document.getElementById('shipType1d');
        setShipType(item,'billing','1','{$valid.billing_country}','{$valid.billing_state}','{$valid.billing_zip}');
        </script>
        {elseif $valid.return || $valid.billing_country != ''}
        <script type="text/javascript">
        var item = document.getElementById('shipType1i');
        setShipType(item,'billing','1','{$valid.billing_country}','{$valid.billing_state}','{$valid.billing_zip}');
        </script>
        {/if}
        {/if}
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.phone == ''} has-error has-feedback bg-danger {/if}">
            <label><span class="req">*</span> Phone Number:</label>
            <input class="form-control" type="text" name="phone" value="{$valid.phone}" maxlength="50"/>{if $valid.return and  $valid.phone == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.email == ''} has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> Email Address:</label>
            <input class="form-control" type="text" name="email" value="{$valid.email}" maxlength="50"/>{if $valid.return and $valid.email == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
          <div class="checkbox">
            <label><input type="checkbox" name="optin" value="y"{if $valid.optin == "y"} checked{/if}/>Please do not send me more information.</label>
          </div>
        </div>
        <div class="clearfix"></div>
        <div class="col-sm-6">
          <div class="form-group">
            <label>Comments or Special Instructions:</label>
            <textarea class="form-control" name="s_comments" cols="25" rows="5" wrap="virtual">{$valid.s_comments}</textarea>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="ship_info">
<fieldset><legend>Enter Shipping Information</legend>
  <div class="clearfix">
   <span class="label">Shipping Method:</span>
   <select name="s_method" id="s_method">
    {html_options options=$options.shipping.method selected=$valid.s_method}
   </select>
  </div>

<div>
  <label for='datepicker'>Requested Ship Date: <small>(e.g. {$smarty.now|date_format:"%Y-%m-%d"})</small></label>
  <input type="text" name="s_shipon1" value="{$valid.s_shipon.1}" id='datepicker' class='datepicker' size="15" maxlength="15" />

<script>
 $(".datepicker").datepicker({ldelim}
  dateFormat: 'yy-mm-dd',
  minDate: new Date('{$smarty.now|date_format:"%B %e, %Y %H:%M:%S"}'),
  beforeShowDay: disableDates{$num}
 {rdelim});

function disableDates{$num}(date) {ldelim}

{* Blackout dates can be set under Settings -> Options -> Shipping Options -> Shipping Blackout Dates *}

// This code can be used to disable certain dates that a product would be on backorder
//  var d = new Date("{$backorder_dates.$name}");
//  {if $backorder_dates.$name}if (d > date) return [false, ''];{/if}

// This will set a cutoff for the current date after a certain time (24hr format, Eastern timezone)
//  var today = new Date('{$smarty.now|date_format:"%B %e, %Y %H:%M:%S"}');
//  if (date.getUTCMonth() == today.getMonth() && date.getUTCDate() == today.getDate() && today.getHours() >= 11) return [false, ''];

  {foreach from=$options.blackout_dates item=bd key=bdk}
    if((date.getUTCMonth()+1) == {$bdk|substr:5:2} && date.getUTCDate() == {$bdk|substr:8:2}) return[false, ''];
  {/foreach}

  return $.datepicker.noWeekends(date);
{rdelim}
</script>

{if $settings.gift_msg_separate == 'y'}
 {section name=gm_line start=1 loop=$settings.gift_msg_num_lines+1 step=1}
  {if $smarty.section.gm_line.index == 1}
   <div{if $valid.return and $valid.gift_message.$num[$smarty.section.gm_line.index] == 'n'} class="error"{/if}>
    <label for='gift_message1_line{$smarty.section.gm_line.index}'>Gift Message:<br><small>{$settings.gift_msg_num_chars} characters per line</small></label>
    <input type="text" id="gift_message1_line{$smarty.section.gm_line.index}" name="gift_message1_line{$smarty.section.gm_line.index}" value="{$valid.gift_message.1[$smarty.section.gm_line.index]}" maxlength="{$settings.gift_msg_num_chars}" />
   </div>
  {else}
   <div{if $valid.return and $valid.gift_message.1.$smarty.section.gm_line.index == 'n'} class="error"{/if}>
    <span class="label">&nbsp;</span>
    <input type="text" name="gift_message1_line{$smarty.section.gm_line.index}" value="{$valid.gift_message.1[$smarty.section.gm_line.index]}" maxlength="{$settings.gift_msg_num_chars}" />
   </div>
  {/if}
 {/section}
{else}
 <div>
  <label for='gift_message1'>Default Gift Message:<br /><small>(100 char. max)</small></label>
  <input type="text" id="gift_message1" name="gift_message1" value="{$valid.gift_message.1}" />
 </div>
{/if}

</fieldset>
</div>


  {include file="payment_block.tpl"}
  <div>
    <div class="mar_btm">
      *Note: This form may take a few moments to process depending on the size of your file.  Please do not click the continue button more than once.
    </div>
    <div class="mar_btm">
      <input type="submit" name="submit" value="Continue >"  class="btn btn-primary">
    </div>
  </div>
</form>

{include file="_bottom.tpl"}
