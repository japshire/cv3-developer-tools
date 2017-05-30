{config_load file="store.conf" scope="global"}
{include file="email_header.tpl"}

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF" style="border-left:1px solid #093c6a;border-right:1px solid #093c6a;">
<td style="padding:15px;font-family:Times, serif; font-size:12px; color:#333333; line-height:17px;">
    
Your member password has been reset.
<br /><br />
Your new password is: {$password}
<br /><br />
Sincerely,<br />
{$co_name}

</td>
</tr>
</table>

{include file="email_footer.tpl"}
