<tr valign="middle">
  <td class="normaltext" align="left">
    {if $field.required == 'y'}
      <font color="#ff0000">*</font>
    {/if}
    {$field.label} 
  </td>
  <td align="left">
    <input type="text" name="{$field_name}" class="norm_formtext" value="{if $valid.return}{$valid.$field_name}{else}{$field.default_value}{/if}" size="{$field.text_field_size}" maxlength="{$field.text_field_max}">
    {if $valid.return and $field.required == 'y' and $valid.$field_name == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </td>
</tr>
