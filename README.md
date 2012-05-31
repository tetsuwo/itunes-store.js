 itune-store.js - JavaScript SDK for [iTunes Store Web Service](http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html)
=====================================================================================================


How to use
----------

### Initialize

#### Method type

    var store = new iTunesStore.common();
    store.setCountry("JP");
    store.setLang("ja_jp");


#### The below same means

    var store = new iTunesStore.common({ 
        country: "JP", 
        lang: "ja_jp" 
    });


