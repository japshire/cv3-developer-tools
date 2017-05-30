<div>
  <input type="radio" id="s_address_type{$num}r" name="s_address_type{$num}" value="r" {if $valid.s_address_type.$num != "c"}checked{/if} /> <span style="vertical-align: bottom">Residential</span>&nbsp;
  <input type="radio" id="s_address_type{$num}c" name="s_address_type{$num}" value="c" {if $valid.s_address_type.$num == "c"}checked{/if} /><span style="vertical-align: bottom">Commercial</span>
</div>
