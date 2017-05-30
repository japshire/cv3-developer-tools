{include file="_top.tpl"}

<h1>Corporate Order File Format</h1>

<p class="legend"><strong>Note:</strong> * Indicates a required field</p>

<p>Use this form to import a multiple ship-to order with a simple text file.  This file will describe the shipping information as well as up to three products to be shipped and should be formatted according to the specification below.  You will be able to review your order before it is confirmed.</p>

<table width="100%" border="0" cellpadding="0" cellspacing="3">
  <thead>
    <tr>
      <th align="left">Column</th>
      <th align="left">Description</th>
      <th align="left">Example</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1<span class="req">*</span></td>
      <td>First Name</td>
      <td>John</td>
    </tr>
    <tr>
      <td>2<span class="req">*</span></td>
      <td>Last Name</td>
      <td>Smith</td>
    </tr>
    <tr>
      <td>3</td>
      <td>Title</td>
      <td>Senior Editor</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Company</td>
      <td>ABC Publishing </td>
    </tr>
    <tr>
      <td>5<span class="req">*</span></td>
      <td>Address 1</td>
      <td>123 Main St </td>
    </tr>
    <tr>
      <td>6</td>
      <td>Address 2</td>
      <td>Suite 123</td>
    </tr>
    <tr>
      <td>7<span class="req">*</span></td>
      <td>City</td>
      <td>Anytown </td>
    </tr>
    <tr>
      <td>8<span class="req">*</span></td>
      <td>State</td>
      <td>AL </td>
    </tr>
    <tr>
      <td>9<span class="req">*</span></td>
      <td>Zip Code</td>
      <td>12345</td>
    </tr>
    <tr>
      <td>10<span class="req">*</span></td>
      <td>Country</td>
      <td>United States</td>
    </tr>
    <tr>
      <td>11<span class="req">*</span></td>
      <td>Phone Number</td>
      <td>123-123-1234 </td>
    </tr>
    <tr>
      <td>12</td>
      <td>Gift Message Override</td>
      <td>Happy Birthday!</td>
    </tr>
    <tr> 
      <td>13<span class="req">*</span></td>
      <td>SKU 1</td>
      <td>ABC123-1</td>
    </tr>
    <tr> 
      <td>14<span class="req">*</span></td>
      <td>SKU 1 Quantity</td>
      <td>1</td>
    </tr>
    <tr> 
      <td>15</td>
      <td>SKU 2</td>
      <td>ABC123-2</td>
    </tr>
    <tr> 
      <td>16</td>
      <td>SKU 2 Quantity</td>
      <td>2</td>
    </tr>
    <tr> 
      <td>17</td>
      <td>SKU 3</td>
      <td>ABC123-3</td>
    </tr>
    <tr> 
      <td>18</td>
      <td>SKU 3 Quantity</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
<br/>
<p><a href="/checkout_corporate_example" target="_blank">View Sample File</a></p>


{include file="_bottom.tpl"}