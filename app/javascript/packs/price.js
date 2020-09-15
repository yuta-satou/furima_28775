window.addEventListener('load', function(){
  const pushUpKey = document.getElementById("item-price");
  pushUpKey.addEventListener('keyup', function(){
    let fee = Math.floor(parseInt(pushUpKey.value, 10) / 10);
    let revenue = parseInt(pushUpKey.value, 10) - fee;
    if(isNaN(fee)) fee = 0;
    if(isNaN(revenue)) revenue = 0;
    document.getElementById( "add-tax-price" ).innerHTML = fee.toLocaleString();
    document.getElementById( "profit" ).innerHTML = revenue.toLocaleString();
  });
})