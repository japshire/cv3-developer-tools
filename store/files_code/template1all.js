function com_stewartspeak_replacement() {
  /*
    Dynamic Heading Generator
    By Stewart Rosenberger
    http://www.stewartspeak.com/headings/

    This script searches through a web page for specific or general elements
    and replaces them with dynamically generated images, in conjunction with
    a server-side script.
  */

  // replaceSelector(selector, phpfile, wordwrap, fontfile, size, background, foreground, store)
  // replaceSelector("h4","/services/heading.php",false,"font.ttf","12","FFFFFF","999999","build200501");

  var testURL = "/images/test.png" ;
  var doNotPrintImages = false;
  var printerCSS = "/replacement-print.css";
  var hideFlicker = false;
  var hideFlickerCSS = "/replacement-screen.css";
  var hideFlickerTimeout = 1000;

  /* ---------------------------------------------------------------------------
      For basic usage, you should not need to edit anything below this comment.
      If you need to further customize this script's abilities, make sure
      you're familiar with Javascript. And grab a soda or something.
  */

  var items;
  var imageLoaded = false;
  var documentLoaded = false;

  function replaceSelector(selector,url,wordwrap,font,size,foreground,background,store) {
    if(typeof items == "undefined") {
      items = new Array();
    }
    items[items.length] = {selector: selector, url: url, wordwrap: wordwrap, font: font, size: size, foreground: foreground, background: background, store: store};
  }

  if(hideFlicker) {    
    document.write('<link id="hide-flicker" rel="stylesheet" media="screen" href="' + hideFlickerCSS + '" />');    
    window.flickerCheck = function() {
      if(!imageLoaded) {
        setStyleSheetState('hide-flicker',false);
      }
    };
    setTimeout('window.flickerCheck();',hideFlickerTimeout)
  }

  if(doNotPrintImages) {
    document.write('<link id="print-text" rel="stylesheet" media="print" href="' + printerCSS + '" />');
  }

  var test = new Image();
  test.onload = function() { imageLoaded = true; if(documentLoaded) replacement(); };
  test.src = testURL + "?date=" + (new Date()).getTime();

  addLoadHandler(function(){ documentLoaded = true; if(imageLoaded) replacement(); });


  function documentLoad() {
    documentLoaded = true;
    if(imageLoaded) {
      replacement();
    }
  }

  function replacement() {
    if(items) {
      for(var i=0;i<items.length;i++) {
        var elements = getElementsBySelector(items[i].selector);
        if(elements.length > 0) for(var j=0;j<elements.length;j++) {
          if(!elements[j]) {
            continue;
          }

          var text = extractText(elements[j]);
          while(elements[j].hasChildNodes()) {
            elements[j].removeChild(elements[j].firstChild);
          }

          var tokens = items[i].wordwrap ? text.split(' ') : [text] ;
          for(var k=0;k<tokens.length;k++) {
            var url = items[i].url + "?text="+ escape(tokens[k]+' ')+ "&selector="+ escape(items[i].selector)+ "&font="+ escape(items[i].font)+ "&size="+ escape(items[i].size)+ "&foreground="+ escape(items[i].foreground)+"&background="+ escape(items[i].background)+ "&store="+escape(items[i].store);
            var image = document.createElement("img");
            image.className = "replacement";
            image.alt = tokens[k] ;
            image.src = url;
            elements[j].appendChild(image);
          }

          if(doNotPrintImages) {
            var span = document.createElement("span");
            span.style.display = 'none';
            span.className = "print-text";
            span.appendChild(document.createTextNode(text));
            elements[j].appendChild(span);
          }
        }
      }

      if(hideFlicker) {
        setStyleSheetState('hide-flicker',false);
      }
    }
  }

  function addLoadHandler(handler) {
    if(window.addEventListener) {
      window.addEventListener("load",handler,false);
    } else if(window.attachEvent) {
      window.attachEvent("onload",handler);
    } else if(window.onload) {
      var oldHandler = window.onload;
      window.onload = function piggyback() {
        oldHandler();
        handler();
      };
    } else {
      window.onload = handler;
    }
  }

  function setStyleSheetState(id,enabled) {
    var sheet = document.getElementById(id);
    if(sheet) {
      sheet.disabled = (!enabled);
    }
  }

  function extractText(element) {
    if(typeof element == "string") {
      return element;
    } else if(typeof element == "undefined") {
      return element;
    } else if(element.innerText) {
      return element.innerText;
    }

    var text = "";
    var kids = element.childNodes;
    for(var i=0;i<kids.length;i++) {
      if(kids[i].nodeType == 1) {
        text += extractText(kids[i]);
      } else if(kids[i].nodeType == 3) {
        text += kids[i].nodeValue;
      }
    }

    return text;
  }

  /*
    Finds elements on page that match a given CSS selector rule. Some
    complicated rules are not compatible.
    Based on Simon Willison's excellent "getElementsBySelector" function.
    Original code (with comments and description):
    http://simon.incutio.com/archive/2003/03/25/getElementsBySelector
  */
  function getElementsBySelector(selector) {
    var tokens = selector.split(' ');
    var currentContext = new Array(document);
    for(var i=0;i<tokens.length;i++) {
      token = tokens[i].replace(/^\s+/,'').replace(/\s+$/,'');
      if(token.indexOf('#') > -1) {
        var bits = token.split('#');
        var tagName = bits[0];
        var id = bits[1];
        var element = document.getElementById(id);
        if(tagName && element.nodeName.toLowerCase() != tagName)
          return new Array();
        currentContext = new Array(element);
        continue;
      }
      if(token.indexOf('.') > -1) {
        var bits = token.split('.');
        var tagName = bits[0];
        var className = bits[1];
        if(!tagName) {
          tagName = '*';
        }

        var found = new Array;
        var foundCount = 0;
        for(var h=0;h<currentContext.length;h++) {
          var elements;
          if(tagName == '*') {
            elements = currentContext[h].all ? currentContext[h].all : currentContext[h].getElementsByTagName('*');
          } else {
            elements = currentContext[h].getElementsByTagName(tagName);
          }
          for(var j=0;j<elements.length;j++) {
            found[foundCount++] = elements[j];
          }
        }

        currentContext = new Array;
        var currentContextIndex = 0;
        for(var k=0;k<found.length;k++) {
          if(found[k].className && found[k].className.match(new RegExp('\\b'+className+'\\b'))) {
            currentContext[currentContextIndex++] = found[k];
          }
        }
        continue;
      }

      if(token.match(/^(\w*)\[(\w+)([=~\|\^\$\*]?)=?"?([^\]"]*)"?\]$/)) {
        var tagName = RegExp.$1;
        var attrName = RegExp.$2;
        var attrOperator = RegExp.$3;
        var attrValue = RegExp.$4;
        if(!tagName) {
          tagName = '*';
        }

        var found = new Array;
        var foundCount = 0;
        for(var h=0;h<currentContext.length;h++) {
          var elements;
          if(tagName == '*') {
            elements = currentContext[h].all ? currentContext[h].all : currentContext[h].getElementsByTagName('*');
          } else {
            elements = currentContext[h].getElementsByTagName(tagName);
          }

          for(var j=0;j<elements.length;j++) {
            found[foundCount++] = elements[j];
          }
        }

        currentContext = new Array;
        var currentContextIndex = 0;
        var checkFunction;
        switch(attrOperator) {
          case '=':
            checkFunction = function(e) { return (e.getAttribute(attrName) == attrValue); };
          break;
          case '~':
            checkFunction = function(e) { return (e.getAttribute(attrName).match(new RegExp('\\b'+attrValue+'\\b'))); };
          break;
          case '|':
            checkFunction = function(e) { return (e.getAttribute(attrName).match(new RegExp('^'+attrValue+'-?'))); };
          break;
          case '^':
            checkFunction = function(e) { return (e.getAttribute(attrName).indexOf(attrValue) == 0); };
          break;
          case '$':
            checkFunction = function(e) { return (e.getAttribute(attrName).lastIndexOf(attrValue) == e.getAttribute(attrName).length - attrValue.length); };
          break;
          case '*':
            checkFunction = function(e) { return (e.getAttribute(attrName).indexOf(attrValue) > -1); };
          break;
          default :
            checkFunction = function(e) { return e.getAttribute(attrName); };
          break;
        }

        currentContext = new Array;
        var currentContextIndex = 0;
        for(var k=0;k<found.length;k++) {
          if(checkFunction(found[k])) {
            currentContext[currentContextIndex++] = found[k];
          }
        }
        continue;
      }

      tagName = token;
      var found = new Array;
      var foundCount = 0;
      for(var h=0;h<currentContext.length;h++) {
        var elements = currentContext[h].getElementsByTagName(tagName);
        for(var j=0;j<elements.length; j++) {
          found[foundCount++] = elements[j];
        }
      }

      currentContext = found;
    }

    return currentContext;
  }
}

// end of scope, execute code
if(document.createElement && document.getElementsByTagName && !navigator.userAgent.match(/opera\/?6/i)) {
  com_stewartspeak_replacement();
}

// Used for search by rating and search by price menus.
function go(form) {
   window.location = form.range.options[form.range.selectedIndex].value;
}

// Standard preload function
function preload_images () {
  var d = document;
  if (!d.imgs) { d.imgs = new Array(); }
  var j = d.imgs.length, args = preload_images.arguments, i;
  for (i = 0; i < args.length; i++) {
    d.imgs[j] = new Image;
    d.imgs[j].src = args[i];
    j++;
  }
}

// Standard bookmark function
function bookmark(title) {
  var urlAddress = location.href;
  var pageName = title;
  var browser = navigator.appName;
  if (browser == 'Microsoft Internet Explorer') {
    window.external.AddFavorite(urlAddress,pageName)
  } else if (browser == 'Netscape') { 
    alert("Your browser does not support this feature.  Use CTRL-D to bookmark this page");
  } else { 
   alert("Your browser does not support this feature.");
  }
}

/* The functions below are cookie functions which can be used for anything site-wide but
   are intended (at the moment) to be used for the dynamic cart quantities */

function getCookie(Name) {
  var search = Name + "=";
  var returnvalue = "";
  if(document.cookie.length > 0) {
    offset = document.cookie.indexOf(search)
    // if cookie exists
    if(offset != -1) { 
      offset += search.length
    }
    // set index of beginning of value
    end = document.cookie.indexOf(";", offset);
    // set index of end of cookie value
    if(end == -1) {
      end = document.cookie.length;
    }
    returnvalue=unescape(document.cookie.substring(offset, end))
  }
  return returnvalue;
}

function setCookie(name,num) {
 //set document cookie
 document.cookie=name+"="+num;
}

function isCookied(name,num) {
 if (getCookie(name)!=num) {
  return true;
 } else {
  return false;
 }
}

/* End Cookie Functions */

/* Dynamic Quantities JavaScript Below */

function priceChange(id,oper,num) {
 // Price Change v1.2:
 // id = the id of the product (so we know what qty box and price to update).
 // oper = what operation to use: dynamic:add:sub:dropdown
 // num = the original price of the product
 //
 // --[ Revisions ]--
 // 20050603 - v1 - Original Script Creation ~Michael@ColorMaria
 // 20050620 - v1.1 - Modified Script to Support Drop-Down Quantity Boxes ~Michael@ColorMaria
 // 20051215 - v1.2 - Added a fix for commas.
 /////////////////////////////////////////////////////////////////////////////////////////////

  if(oper == 'dynamic') {
    // Get the qty value:
    var num2 = 0;
    var qty = document.getElementById('qty_' + id).value;
    // Make sure they didn't go below 1:
    if(qty < 1 || qty == '') {
      document.getElementById('price_' + id).value = '$' + num;
    } else {
      // If they're above one or at 1, do the math for the price:
      num2 = num.replace(',','') * document.getElementById('qty_' + id).value;
      document.getElementById('price_' + id).value = '$' + num2.toFixed(2);
    }
  }
  if(oper == 'add') {
    // Increment the qty box:
    ++document.getElementById('qty_' + id).value;
    // Set qty equal to the new value:
    var qty = document.getElementById('qty_' + id).value;
    if(qty < 1) {
      // Probably not gonna happen, but just in case:
      document.getElementById('qty_' + id).value = '1';
      document.getElementById('price_' + id).value = '$' + num;
    } else {
      // Do the math for the new price:
      num2 = num.replace(',','') * document.getElementById('qty_' + id).value;
      document.getElementById('price_' + id).value = '$' + num2.toFixed(2);
    }
  }
  if(oper == 'sub') {
    // Decrement the value of the qty box:
    --document.getElementById('qty_' + id).value;
    // Set qty = to the new value:
    var qty = document.getElementById('qty_' + id).value;
    if(qty < 1) {
      // Set qty back to 1 if they try to go below 1:
      document.getElementById('qty_' + id).value = '1';
      document.getElementById('price_' + id).value = '$' + num;
    } else {
      // If they're above one or at 1 then do the math for the price:
      num2 = num.replace(',','') * document.getElementById('qty_' + id).value;
    }
  }
  if(oper == 'dropdown') {
    // Set qty = to the new value:
    var qty = document.getElementById('qty_' + id).value;
    if(qty < 1) {
      // Not sure how this will happen, but you never know:
      document.getElementById('qty_' + id).value = '1';
      document.getElementById('price_' + id).value = '$' + num;
    } else {
      // If they're above one or at 1 then do the math for the price:
      num2 = num.replace(',','') * document.getElementById('qty_' + id).value;
    }
  }
  // Some people like to do weird things, like enter letters for a quantity amount, let's not let them:
  if(num2 != '') {
    if(!isNaN(num2)) {
      // if num wasn't NaN then a letter wasn't entered
      document.getElementById('price_' + id).value = '$' + num2.toFixed(2);
    } else {
      // if num was NaN, fix it.
      document.getElementById('price_' + id).value = '$' + num;
      document.getElementById('qty_' + id).value = '';
    }
  }
}

function cartChange(id,num,qty,total) {
 // Cart Change v1.4:
 // id = an id to represent the price and qty (so we know what qty box and price to update).
 // num = the original cost of the item(s) (if there were 3x a 10-dollar item, num would = 30.00).
 // qty = the original quantity that existed in the cart before modification
 // total = the original total of the cart items before modification.
 // 
 // --[ Revisions ]--
 // 20050620 - Original Script Creation ~Michael@ColorMaria
 // 20050629 - Added a line to change the color of the update cart message ~Michael@ColorMaria
 // 20050705 - Added code (accompanied by cookies) to check the quantities of items in the cart
 //          - to see whether they match what the user entered for better checking to see if 
 //          - the update cart button needs to be pressed.
 //          - 
 //          - Please note: This update requires the cookie functions above the priceChange
 //          - function. ~Michael@ColorMaria
 // 20050722 - Added error handling for NaN errors.
 // 20051215 - Fixed a bug with commas
 ///////////////////////////////////////////////////////////////////////////////////////////////
 // Setup our Variables:
  var num2 = 0;
  var qty2 = document.getElementById('qty_' + id).value;
  if(isNaN(qty2)) { // If qty2 isNaN that means someone's made a typo and hit a letter or other non-number key
    document.getElementById('qty_' + id).value = '';
    qty2 = '';
  }
  var num3 = document.getElementById('price_' + id).value.split("$");
  var num3 = num3[1].replace(',','');
  // Check to see if we're dividing by 0:
  if(qty != '0' || !qty) {
    // If not, get the real price (rPrice):
    var rPrice = num.replace(',','') / qty;
  } else {
    // If we are, set the total price for that item to 0:
    document.getElementById('price_' + id).value = '$0.00';
  }
  // Setup our new prices:
  num2 = (rPrice * qty2);
  document.getElementById('price_' + id).value = '$' + num2.toFixed(2);
  // We gotta do this differently depending on if the total we're modifying 
  // is the REAL total or if it's one that was previously modified.
  if(total == document.getElementById('total').value) {
    // If we are modifying the current REAL total, do it this way:
    // Figure out what total would be if the item we're modifying didn't exist.
    total = total - num3;
    // Add the new value to the total:
    total = total + num2;
    document.getElementById('total').value = '$' + total.toFixed(2);
  } else {
    // Setup our fake_total variable so we can essentially do the same 
    // thing we did with the real total
    var fake_total = document.getElementById('total').value.split("$");
    fake_total = fake_total[1].replace(',','');
    // Figure out what the total would be without this product.
    total = fake_total - num3;
    // Readd the new value to the total.
    total = total + num2;
    document.getElementById('total').value = '$' + total.toFixed(2);
  }
  // Just in case they think this will automagically update the real prices for them,
  // setup a fail safe the function below will read and evaluate:
  var nQty = getCookie('quantities');
  arQty = nQty.split('|');
  // Note: the last element of the array will be empty, so ignore it.
  cntQty = arQty.length - 1;
  for(i=0;i<cntQty;i++) {
    arID = arQty[i].split(','); // Hoo Hoo (owl)
    if(document.getElementById('qty_'+arID[0]).value == arID[1]) {
      // It equals the default quantity, yay! No need to update cart.
      document.getElementById('hasUpdated').value = '1';
      // Change the color of the update cart message.
      document.getElementById('update_msg').style.color = '#000';
      continue;
    } else {
      // It doesn't, they need to update.  No need to check further since if one hasn't been updated
      // the whole cart needs to be updated.
      document.getElementById('hasUpdated').value = '0';
      // Change the color of the update cart message so it stands out after a change to the qty is made.
      document.getElementById('update_msg').style.color = '#F00';
      // Break the loop.
      break;
    }
  }
}

function hasUpdated() {
 // Small function to verify that the cart has been updated
 // before checking out or using the continue shopping button.
 //
 // 20060403 - Added fix for when 'hasUpdated' doesn't exist. ~Michael
 ///////////////////////////////////////////////////////////////
  if(typeof document.getElementById('hasUpdated') != 'undefined') {
    var hUpdated = document.getElementById('hasUpdated').value;
    if(hUpdated != '1') {
      alert('You have not updated your cart since last changing your quantities.\nPlease press the \'Update Cart\' button before continuing.');
      return false;
    }
  }
}

/* ** END Dynamic Quantities JS ** */


/* ***************************************
   * verifyRecipients() function.        *
   * Checks the checkout_shippingdetail  *
   * page to ensure that a shipping      *
   * recipient was chosen for each       *
   * product and that there weren't any  *
   * missed recipients.  If gives the    *
   * customer the option of ignoring     *
   * missed ship-tos since that doesn't  *
   * break the checkout it just causes   *
   * blank spaces in some spots.         *
   *                                     *
   * ~Michael - 20060111                 *
   *************************************** */

function verifyRecipients(theForm) {
  var intLength = theForm.length;            // Grab the total length of the form.
  var firstStep = 1, shipTos = new Array();  // Initialize a couple vars to be used later.
  for(var i=0;i<intLength;i++) {             // Loop through the form elements.
    if(firstStep && theForm.elements[i].name.substr(0,4) == 'recp') {
      // If it's the first dropdown setup the number of ship-tos it contains to compare later
      var numShipTos = +theForm.elements[i].options.length - 1;
      // Turn this off so it doesn't repeat this step (it won't hurt anything but would waste processing power).
      firstStep = 0;
    }
    if(theForm.elements[i].name.substr(0,4) == 'recp' && theForm.elements[i].value == '') {
      // If we encounter a dropdown that hasn't had a ship-to selected..
      alert('You must choose a recipient for each of the products you are purchasing.');
      return false;
    } else if (theForm.elements[i].name.substr(0,4) == 'recp') {
      // Otherwise add the item to an array to compare later.
      var shipTo = theForm.elements[i].selectedIndex;
      if(!in_array(shipTo, shipTos)) {
        // If the ship-to isn't in the array already, add it.
        var stLen = shipTos.length;
        shipTos.push(shipTo);
      }
    }
  }
  if(shipTos.length != numShipTos) {
    // If the # of ship-tos in the array don't match the number of ship-tos that exist, prompt the user
    var verifyShipTos = confirm("Some of your shipping address do not have products assigned to them.\n\nDo you wish to continue anyway?");
    if(verifyShipTos) {
      // User says it's OK
      return true;
    } else {
      // User says it's not OK
      return false;
    }
  }
  // If we've gotten this far, everything on the form has checked out OK.
  return true;
}

/* ***************************************
   * in_array() function for JS.         *
   * Works the same as the PHP function. *
   *                                     *
   * ~Michael - 20060111                 *
   * ~Michael - Fixed undefined vars     *
   *            20060111                 *
   *************************************** */

function in_array(needle, haystack) {
  if(typeof needle == undefined) {
    // If needle is undefined:
    alert("Needle is undefined.\nError: in_array");
    return false;
  } else if(typeof haystack == undefined) {
    alert("Needle is undefined.\nError: in_array");
    return false;
  }
  for(i=0,n=haystack.length;i<n;i++) {
    // Loop through the array.
    if(haystack[i] == needle) {
      // If the needle was found:
      return true;
    }
  }
  // If the code reaches this point, needle wasn't found:
  return false;
}

/* ************************
   * noHammer() function  *
   * Prevents form submit *
   * button hammering.    *
   *                      *
   * ~Michael - 20060403  *
   ************************ */

function noHammer(theForm) {
  if(typeof theForm.submit != 'undefined') {
    theForm.submit.disabled = true;
    theForm.submit.value = 'Wait...';
    return true;
  }
}

//////////////////////////////////////////////////////////////////////////////////////////
// DreamWeaver's functions.

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

// End DreamWeaver's functions.
//////////////////////////////////////////////////////////////////////////////////////////