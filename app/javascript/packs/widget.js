function action(currencies) {
  var scripts = document.getElementsByTagName("script");

  console.log(period.value);
  currencies.forEach((currency) => {
    var embedder = scripts[currency.symbol];
    (function (){
      var appName = encodeURIComponent(window.location.hostname);
      if(appName==""){appName="local";}
      var s = document.createElement("script");
      s.type = "text/javascript";
      s.async = true;
      var theUrl = baseUrl+`serve/v2/coin/chart?fsym=${currency.symbol}&tsym=BRL&period=${period.value}`;
      s.src = theUrl + ( theUrl.indexOf("?") >= 0 ? "&" : "?") + "app=" + appName;
      embedder.parentNode.appendChild(s);
    })();
  });
};

baseUrl = "https://widgets.cryptocompare.com/";

// var scripts = document.getElementsByTagName("script");
const widgetCards = document.getElementById("widget-cards")
const currencies = JSON.parse(widgetCards.dataset.currencies);
// var embedder = scripts[ scripts.length - 1 ];
var period = document.getElementById("period");
// newElement = document.createElement("div");
// newElement.id = currency.symbol;
// newElement.class = "col-xs-6 col-sm-4 col-md-3";
console.log(period);

// action(currencies);
period.addEventListener("change", action(currencies));




// widgetCards.appendChild(newElement);
