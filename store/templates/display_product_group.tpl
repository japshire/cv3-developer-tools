{if $products|@count > 0}
    {if !$max}
        {assign var=max value=999}
    {/if}
    {* this $group reassignment puts the array into an ordered list,
    rather than having the prod_id as the key.
    This is needed for the section loop to function properly.
    *}
    {assign var=products value=$products|@array_values}

    <section{if $label} id="{$label|replace:' ':'_'|lower}"{/if} class="clearfix">
        {if $label}
            <header>
            {if $label != 'Recently Viewed'}<div id="cap">{/if}
                <h2>{$label}</h2>
            {if $label != 'Recently Viewed'}</div>{/if}
            {if $view == 'index' && $seemore == '1'} 
            <div id="seemore"> <a href="{$link}" > See More </a> </div>
        {/if}
    </header>
{/if}

<ul{if $label != 'Recently Viewed'} class="pad_tp20 pdd_rt0 pdd_lt0 col-lg-12 col-sm-12 col-md-12 col-xs-12"{/if}>
    {section name=tmp_id loop=$products max=$max}
        <li {if $label != 'Recently Viewed'}class="col-lg-3 col-md-4 col-sm-6 col-xs-6 mar_btm"{/if}>{include file="display_miniproduct.tpl" p=$products[$smarty.section.tmp_id.index]}</li>
        {/section}
</ul>
</section>
{/if}