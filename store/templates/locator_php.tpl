{* This is the code for the store locator.
   PLEASE do not modify this code for any reason unless you're absolutely sure
   you know what you're doing. *}


{php}
if(isset($_GET['st'])) {
 print('<div style="padding-left: 8px;padding-right:8px;" class="normaltext">');
 //print('<h4>Search Results</h4>');

 $file = 'https://s3.amazonaws.com/cdn.rishi-tea.com/downloads/storelist.csv';

 $lines = file($file);
 $arStores = Array();
 $i = 0;
 foreach($lines as $line_num => $line) {
  $line = explode(",",str_replace("\"","",$line));
  if ($_GET['city'] != '' && $_GET['st'] != '' && $_GET['zip'] != '') {
    if ($line[6] == $_GET['st'] && preg_match('/'.$_GET['city'].'/i',$line[5]) && preg_match('/'.$_GET['zip'].'/',$line[7])) {
      $arStores[$line[0]] .= $line[7].implode("|",$line);
      $i++;
    }
  } else if ($_GET['city'] != '' && $_GET['st'] != '') {
    if ($line[6] == $_GET['st'] && preg_match('/'.$_GET['city'].'/i',$line[5])) {
      $arStores[$line[0]] .= $line[7].implode("|",$line);
      $i++;
    }
  } else if ($_GET['st'] != '' && $_GET['zip'] != '') {
    if ($line[6] == $_GET['st'] && preg_match('/'.$_GET['zip'].'/',$line[7])) {
      $arStores[$line[0]] .= $line[7].implode("|",$line);
      $i++;
    }
  } else if ($_GET['city'] != '' && $_GET['zip'] != '') {
    if (preg_match('/'.$_GET['city'].'/i',$line[5]) && preg_match('/'.$_GET['zip'].'/',$line[7])) {
      $arStores[$line[0]] .= $line[7].implode("|",$line);
      $i++;
    }
  } else if ($_GET['st'] != '') {
    if ($line[6] == $_GET['st']) {
      $arStores[$line[0]] .= $line[7].implode("|",$line);
      $i++;
    }
  } else if ($_GET['city'] != '') {
    if (preg_match('/'.$_GET['city'].'/i',$line[5])) {
      $arStores[$line[0]] .= $line[7].implode("|",$line);
      $i++;
    }
  } else if ($_GET['zip'] != '') {
    if (preg_match('/'.$_GET['zip'].'/',$line[7])) {
      $arStores[$line[0]] .= $line[7].implode("|",$line);
      $i++;
    }
  }
 }
 function cmp($a, $b) {
  if ($a == $b) {
   return 0;
  }
  return ($a < $b) ? -1 : 1;
 }
 usort($arStores, "cmp");

 if(count($arStores) < 1) {
  print("<br />There are currently no sites in the selected state. You may order online, using our secure site, or by phone at 877-552-7977");
 } else {
  print("<p>Here are the stores offering Rishi Tea products in the selected state (listed in Zip code order):</p>");
  print('<div>');
  foreach($arStores as $key => $val) {
   $val = explode("|",$val);
   if($val[2] == '') {
    $store = $val[1];
   } else {
    $store = $val[2];
   }
   $phone = trim($val[8]);
   $phone = ereg_replace("([0-9]{3})([0-9]{3})([0-9]{4})", "(\\1) \\2-\\3", $phone);
   if($val[4] != '') {
     $add2 = $val[4]."<br />";
   } else {
     $add2 = '';
   }
   print("<b>".ucfirst($store)."</b><br />".ucfirst($val[3])."<br />".$add2.ucfirst($val[5]).", ".strtoupper($val[6])." ".$val[7]."<br />");
   if($phone != '') {
     print("Phone: ".$phone."<br />");
   }
   $website = trim($val[9]);
   if ($website != '') {
     print('<a target="_blank" href="' . $website . '">' . $website . '</a><br />');
   }
   print("<br />");
  }
  print('</div>');
 }
print('</div>');
}
{/php}