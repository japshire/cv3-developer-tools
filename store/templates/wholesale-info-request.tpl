{include file="_top.tpl"}


<div class="largertext">
<strong>Wholesale Request</strong><br /><br />

 Please complete the following form to request wholesale information. A Rishi Tea representative will contact you shortly. For up to date information about our Wholesale program please sing up for our <a href="/wholesale-info" target="blank">Wholesale Newsletter</a>.<br /><br />

 * Indicates a required field.<br /><br />

<div id='wholesale_info_request'>
 {include file="generic_form.tpl"}
</div>

</div>

{literal}
<script type='text/javascript'>

$(function(){
  $('#wholesale_info_request form input[name=submit]').click(function(event){
    event.preventDefault();

    var firstname = $('input[name=field_30]').val();
    var lastname = $('input[name=field_31]').val();
    var company = $('input[name=field_32]').val();
    var email = $('input[name=field_33]').val();
    var address1 = $('input[name=field_34]').val();
    var city = $('input[name=field_35]').val();
    var state = $('select[name=field_36]').val();
    var zip = $('input[name=field_37]').val();
    var country = $('select[name=field_38]').val();
    var phone = $('input[name=field_39]').val();
    var fax = $('input[name=field_40]').val();
    var business = $('select[name=field_43]').val();
    var comments = $('textarea[name=field_41]').val();

    var url    = '/services/rishitea/wholesale_post.php';
    var params = 'FirstName='+firstname+'&LastName='+lastname+'&Company='+company+'&Address1='+address1+'&Address2=&City='+city+'&State='+state+'&Zipcode='+zip+'&Email='+email+'&Phone1='+phone+'&Phone2='+fax+'&ResId=TSW&PromoID=105&Market='+business+'&Comments='+comments+'&Website=&Territory='+country;

    $.post(url, params, function(data){
      $('#wholesale_info_request form input[name=submit]').unbind('click').click();
    });
  });
});


</script>
{/literal}

{include file="_bottom.tpl"}