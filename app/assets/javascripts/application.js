// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

function validates(theCPF) 
{ 
  
  if (theCPF.value == "") 
  { 
    alert("Campo inválido. É necessário informar o CPF ou CNPJ"); 
    theCPF.focus(); 
    return (false); 
  } 
  if (((theCPF.value.length == 11) && (theCPF.value == 11111111111) || (theCPF.value == 22222222222) || (theCPF.value == 33333333333) || (theCPF.value == 44444444444) || (theCPF.value == 55555555555) || (theCPF.value == 66666666666) || (theCPF.value == 77777777777) || (theCPF.value == 88888888888) || (theCPF.value == 99999999999) || (theCPF.value == 00000000000))) 
  { 
    alert("CPF/CNPJ inválido."); 
    theCPF.focus(); 
    return (false); 
  } 


  if (!((theCPF.value.length == 11) || (theCPF.value.length == 14))) 
  { 
    alert("CPF/CNPJ inválido."); 
    theCPF.focus(); 
    return (false); 
  } 

  var checkOK = "0123456789"; 
  var checkStr = theCPF.value; 
  var allValid = true; 
  var allNum = ""; 
  for (i = 0;  i < checkStr.length;  i++) 
  { 
    ch = checkStr.charAt(i); 
    for (j = 0;  j < checkOK.length;  j++) 
      if (ch == checkOK.charAt(j)) 
        break; 
    if (j == checkOK.length) 
    { 
      allValid = false; 
      break; 
    } 
    allNum += ch; 
  } 
  if (!allValid) 
  { 
    alert("Favor preencher somente com dígitos o campo CPF/CNPJ."); 
    theCPF.focus(); 
    return (false); 
  } 

  var chkVal = allNum; 
  var prsVal = parseFloat(allNum); 
  if (chkVal != "" && !(prsVal > "0")) 
  { 
    alert("CPF zerado !"); 
    theCPF.focus(); 
    return (false); 
  } 

if (theCPF.value.length == 11) 
{ 
  var tot = 0; 

  for (i = 2;  i <= 10;  i++) 
    tot += i * parseInt(checkStr.charAt(10 - i)); 

  if ((tot * 10 % 11 % 10) != parseInt(checkStr.charAt(9))) 
  { 
    alert("CPF/CNPJ inválido."); 
    theCPF.focus(); 
    return (false); 
  } 
  
  tot = 0; 
  
  for (i = 2;  i <= 11;  i++) 
    tot += i * parseInt(checkStr.charAt(11 - i)); 

  if ((tot * 10 % 11 % 10) != parseInt(checkStr.charAt(10))) 
  { 
    alert("CPF/CNPJ inválido."); 
    theCPF.focus(); 
    return (false); 
  } 
} 
else 
{ 
  var tot  = 0; 
  var peso = 2; 
  
  for (i = 0;  i <= 11;  i++) 
  { 
    tot += peso * parseInt(checkStr.charAt(11 - i)); 
    peso++; 
    if (peso == 10) 
    { 
        peso = 2; 
    } 
  } 

  if ((tot * 10 % 11 % 10) != parseInt(checkStr.charAt(12))) 
  { 
    alert("CPF/CNPJ inválido."); 
    theCPF.focus(); 
    return (false); 
  } 
  
  tot  = 0; 
  peso = 2; 
  
  for (i = 0;  i <= 12;  i++) 
  { 
    tot += peso * parseInt(checkStr.charAt(12 - i)); 
    peso++; 
    if (peso == 10) 
    { 
        peso = 2; 
    } 
  } 

  if ((tot * 10 % 11 % 10) != parseInt(checkStr.charAt(13))) 
  { 
    alert("CPF/CNPJ inválido."); 
    theCPF.focus(); 
    return (false); 
  } 
} 
  return(true); 
} 
