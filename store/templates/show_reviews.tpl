<div id="reviews">
{if $product.reviews.num == 0}
  This product has not yet been reviewed.<br />
  <a href="/create_review/{$prod_id}/{if $var2 != ''}{$var2}{else}{$var1}{/if}">Click here</a> to write your own review.
{else}
  {$product.reviews.num} Reviews Total - Overall User Rating {include file="product_review.tpl" rating=$product.reviews.rating}<br />
  <a href="/create_review/{$prod_id}/{if $var2 != ''}{$var2}{else}{$var1}{/if}">Click here</a> to write your own review.
  <hr noshade="" size="1">
{/if}
<div class="spacer"></div>
{foreach from=$product.review_data item=rev}
      <div class="reviewTitle">{include file="product_review.tpl" rating=$rev.rating}{$rev.title}</div>
      By {$rev.creator_name} on {$rev.date_created|date_format:"%B %e, %Y"}<br />
      {if $rev.city != ''}{$rev.city},{/if} {$rev.state} {$rev.country}
      <div class="spacer"></div>
      {$rev.comments|nl2br}
      {if $rev.owner_comments != ''}
        <div class='content_box'><em>Owner Response</em>: {$rev.owner_comments}</div>
      {/if}
      <div class="spacer"></div>
  {if $settings.customer_review_rating == 'y'}
  <tr>
    <td class="normaltext">
      <br /><b>Was this review helpful?</b> &nbsp;
      <form method="post" action="index.php" name="review_vote{$rev.id}" class="inline">
      <input type="hidden" name="action" value="ReviewVote" />
      <input type="hidden" name="review_id" value="{$rev.id}" />
      <input type="hidden" name="vote_type" value="" />
      <a href="javascript:void(0);" onclick="javascript: document.review_vote{$rev.id}.vote_type.value='yes'; document.review_vote{$rev.id}.submit();"><img src="{$img_prefix}/images/thumb-up.gif" class="inline" alt="Yes" title="Yes" />{$rev.yes_vote}</a> &nbsp;
      <a href="javascript:void(0);" onclick="javascript: document.review_vote{$rev.id}.vote_type.value='no'; document.review_vote{$rev.id}.submit();"><img src="{$img_prefix}/images/thumb-down.gif" class="inline" alt="No" title="No" />{$rev.no_vote}</a>
      </form>
    </td>
  </tr>
  {/if}
  <tr>
    <td><hr noShade size="1"></td>
  </tr>
{/foreach}
</div>
