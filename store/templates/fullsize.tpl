{config_load file="store.conf" scope="global"}
<html>
{include file="_meta.tpl"}

{if isset($smarty.get.att_id)}
 {assign var="att_id" value=$smarty.get.att_id}
 {foreach from=$product.images item="image" key="key"}
  {if $image.attribute_id == $att_id}
   {assign var="full_image" value=$image.popup|img_prefix}
  {/if}
 {/foreach}
{/if}

{if $full_image == ''}
 {assign var="full_image" value=$product.full_image|img_prefix}
{/if}

<body id="{$view}" class="popup">

<div>
 <a href="javascript:window.close();"><img src="{$full_image}" border="0"></a><br>
</div>

<div class="popupbuttons">
 <button onClick="window.close();" class="button medium style1">Close Window</button>
</div>

</body>
</html>