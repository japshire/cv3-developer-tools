function XMLHttpObj() {
  var xmlHttp = false;
  var theType = false;
  var theParams = false;

  try {
    // Firefox, Opera 8.0+, Safari
    xmlHttp=new XMLHttpRequest();
  } catch (e) {
    // Internet Explorer
    try {
      xmlHttp=new ActiveXObject("Msxml2.XMLHttp");
    } catch (e) {
      try {
        xmlHttp=new ActiveXObject("Microsoft.XMLHttp");
      } catch (e) {
        // no workie
      }
    }
  }
  return xmlHttp;
}

/******************************************
 * AJAX FUNCTIONS
 ******************************************/

function getInfo(typ,theclass,func,params) {
  theType = typ;  // type of request so this can be used for more than one thing
  theParams = params;  // parameters for function call,other info
  var method = "GET";
  // request dynamic information
  switch (typ) {
  case 'refined':
    var url = "/services/ajax/get_info.php?keywords="+params.value+"&class="+theclass+"&function="+func; 
    break;
  case 'limit_shipping_method':
    var url = "/services/ajax/get_info.php?keywords="+params+"&class="+theclass+"&function="+func; 
    break;
  case 'suggested_search':
    var url = "/services/ajax/get_info.php?keywords="+params.value+"&class="+theclass+"&function="+func; 
    break;
  case 'amazon':
    var url = "/services/ajax/get_info.php?keywords="+params+"&class="+theclass+"&function="+func;
    break;
  case "avs":
    var url="/services/ajax/get_info.php?keywords=null&class="+theclass+"&function="+func;
    var post_xml = params;
    var method = "POST";
    break;
  }

  // call server
  XMLCall = new XMLHttpObj;
  if (method == 'POST') {
    XMLCall.open('POST',url,false); // need it to halt
    XMLCall.setRequestHeader("Content-Type", "text/xml");
    XMLCall.send(post_xml);
    switch (theType) {
      case 'avs':
        return verifyShippingResponse(XMLCall.responseText);
        break;
    }
  } else {
    XMLCall.open('GET',url,true);
    XMLCall.onreadystatechange = checkReadyState;
    XMLCall.send(null);
  }
}

function checkReadyState() {
  // wait for server response
  if (this.readyState==4) {
    // ready to do stuff
    response = this.responseText;
    switch (theType) {
    case 'refined':
      refinedSearch(response);
      break;
    case 'limit_shipping_method':
      limitShippingMethods(response);
      break;
    case 'suggested_search':
      suggestedSearch(response);
      break;
    case 'amazon':
      amazonResponse(response);
      break;
    }
    delete self;
  }
}

/******************************************
 * SITE FUNCTIONS
 ******************************************/

function refinedSearch(response) {
  // get the next field name
  var get_id = theParams.name.split('_');

  if (response != '') {
    var id = get_id[0]+'_'+get_id[1]+'_'+get_id[2]+'_'+(parseInt(get_id[3])+1);
    var select_box = document.getElementById(id);
    var new_options = response.split('\|');

    // clear the current options except for the title
    if (select_box.options.length > 0) { 
      for(var i=1;i<select_box.options.length;i=1) { 
        select_box.options[i] = null; 
      }
    }

    // add the new options 
    var len = new_options.length;
    for (var i=0;i<len;i++) {
      var opts = new_options[i].split('::');
      if (typeof opts[0] != 'undefined' && typeof opts[1] != 'undefined') {
        select_box.options[select_box.options.length] = new Option(opts[1],opts[0],false,false);
      }
    }
    // enable the select box
    select_box.disabled = false;
  } else {
    // forward to category or prod detail list
    window.location = '/search_redirect/'+theParams.value+'/f';
  }
}

function limitShippingMethods(response) {
  // Divvy up the params to extract the ship-to id
  var lsmParams = theParams.split("|");
  var method_id = lsmParams[2];

  // get the method selection information and current value
  if (typeof document.getElementById(method_id) == 'undefined' || document.getElementById(method_id) == null) {
    return false;
  }
  var select_box = document.getElementById(method_id);
  var selected = select_box.value;

  // clear the current options except for the title
  if (select_box.options.length > 0) { 
    for(var i=0;i<select_box.options.length;i=0) { 
      select_box.options[i] = null; 
    }
  }

  // add the new options 
  var new_options = response.split('\|');
  var len = new_options.length;
  for (var i=0;i<len;i++) {
    var opt = new_options[i];
    if (typeof opt != 'undefined') {
      var sel = false;
      if (selected == opt) {
        sel = true;
      }
      select_box.options[select_box.options.length] = new Option(opt,opt,false,sel);
    }
  }
}

function suggestedSearch(response) {
  // clear the current values of suggestion box
  var suggest_box = document.getElementById('suggestions');
  document.getElementById('suggestions').className = '';
  suggest_box.innerHTML = '';

  // get the suggested search vars
  if (response != '') {
    document.getElementById('suggestions').className = 'suggestions';
    var suggestions = response.split('\|');

    // add new options to suggestion box
    for(var i=0;i<suggestions.length;i++) {
      var suggestion = '<div class="suggestion" id="suggestion_' + i + '" onMouseOver="javascript:suggestedSearchField(this,\'over\');" onMouseOut="javascript:suggestedSearchField(this,\'out\');" onClick="javascript:suggestedSearchField(this,\'click\');">' + suggestions[i] + '</div>';
      suggest_box.innerHTML += suggestion;
    }
  }
}

function amazonResponse(res) {
  var out = new Array();

  if (res != '') {
    res = res.split(';');
    for (var i=0,n=res.length;i<n;i++) {
      if (i == 0) continue; // no need, it's blank for integrity purposes
      if (res[i] != '') {
        shipTo = res[i].split(':');
        out[i] = new Array();
        out[i]['city'] = shipTo[0];
        out[i]['state'] = shipTo[1];
        out[i]['zip'] = shipTo[2];
        out[i]['country'] = shipTo[3];

        // comment this out if you don't need it:
        var args = out[i]['country']+'|'+out[i]['state']+'|s_method'+i;
        getInfo('limit_shipping_method','Shipping_Class','limitMethods',args);
      }
    }
  }

  // uncomment this if you need it:
  // return out;
}
  
