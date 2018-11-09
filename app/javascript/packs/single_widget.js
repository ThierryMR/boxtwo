const widgetCards = document.getElementById("widget-cards")
const currency = JSON.parse(widgetCards.dataset.currency);
var period = document.getElementById("period");
console.log(`period fora do event listener loop: ${period.value}`);
// period.addEventListener('change', action(currencies));

baseUrl = "https://widgets.cryptocompare.com/";
var scripts = document.getElementsByTagName("script");
var period = document.getElementById("period");
console.log(`period dentro do event listener do loop: ${period.value}`);
var embedder = scripts[currency];
(function (){
  var appName = encodeURIComponent(window.location.hostname);
  if(appName==""){appName="local";}
  var s = document.createElement("script");
  s.type = "text/javascript";
  s.async = true;
  var theUrl = baseUrl+`serve/v2/coin/chart?fsym=${currency}&tsym=BRL&period=${period.value}`;
  s.src = theUrl + ( theUrl.indexOf("?") >= 0 ? "&" : "?") + "app=" + appName;
  embedder.parentNode.appendChild(s);
})();

period.addEventListener('change', function() {
  document.querySelectorAll('.ccc-widget').forEach((widget) => {
    widget.parentNode.removeChild(widget);
  });
  console.log(`period dentro do event listener do loop: ${period.value}`);

  var embedder = scripts[currency];
  (function (){
    var appName = encodeURIComponent(window.location.hostname);
    if(appName==""){appName="local";}
    var s = document.createElement("script");
    s.type = "text/javascript";
    s.async = true;
    var theUrl = baseUrl+`serve/v2/coin/chart?fsym=${currency}&tsym=BRL&period=${period.value}`;
    s.src = theUrl + ( theUrl.indexOf("?") >= 0 ? "&" : "?") + "app=" + appName;
    embedder.parentNode.appendChild(s);
  })();
});
