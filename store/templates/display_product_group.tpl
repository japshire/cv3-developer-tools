{if $products|@count > 0}
    {if !$max}
        {assign var=max value=999}
    {/if}
    {* this $group reassignment puts the array into an ordered list,
    rather than having the prod_id as the key.
    This is needed for the section loop to function properly.
    *}
    {assign var=products value=$products|@array_values}

    <section{if $label} id="{$label|replace:' ':'_'|lower}"{/if} class="clearfix{if $label == 'Related Items'} col-xs-12{/if}">
        {if $label}
            <header>
                {if $view == 'product'}
                  <h3>{$label}</h3>
                {else}
                  <h2>{$label}</h2>
                {/if}
            </header>
        {/if}

<ul class="grid{if $label != 'Recently Viewed'} pad_tp20 row{/if}">
    {section name=tmp_id loop=$products max=$max}
        <li {if $label != 'Recently Viewed'}class="col-md-3 col-xs-6 mar_btm"{/if}>{include file="display_miniproduct.tpl" p=$products[$smarty.section.tmp_id.index]}</li>
    {/section}
</ul>
</section>
{/if}