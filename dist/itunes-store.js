/*!
 * iTunes Store - 0.0.1
 *
 * Copyright 2012, Tetsuwo OISHI.
 * Dual license under the MIT license.
 * http://tetsuwo.tumblr.com
 *
 * Date: 2012-05-29
 */
var iTunesStore = iTunesStore || {};

(function(iTS, doc, win, undef) {


iTS.config = {
    endpoint: "http://itunes.apple.com",
    callbackName: "_itunes_store_",
    country: "US",
    lang: "en_us",
    version: 2,
    debug: true
//    debug: false
};


iTS.logger = {};


})(iTunesStore);
(function(iTS, doc, win, undef) {


iTS.common = function(options) {
    this.times = 0;
    this.requests = [];
    this.data = [];
    this.win = document.defaultView || document.parentWindow;
}


iTS.common.prototype.setCountry = function(val) {
    this.parent.config.country = val;
    return this;
};


iTS.common.prototype.setLang = function(val) {
    this.parent.config.lang = val;
    return this;
};


iTS.common.prototype.debug = function(val) {
    if (this.debug) {
        console.log(val);
    }
};


iTS.common.prototype.serialize = function(param, prefix) {
    var query = [];

    for(var p in param) {
        var k = prefix ? prefix + '[' + p + ']' : p, v = param[p];
        query.push(
            typeof v == 'object' ?
                this.serialize(v, k) :
                encodeURIComponent(k) + '=' + encodeURIComponent(v)
        );
    }

    return query.join('&');
};


iTS.common.prototype.api = function(method, param, callback) {
    var callbackName = this.parent.config.callbackName + '_cb_' + this.times;
    this.win[callbackName] = callback;

    param = param || {};
    param.jsonp = callbackName;

    this.requests[this.times] = {
        method: method,
        param: param,
        callback: callback,
        callbackName: callbackName
    };

    this.times++;

    (function(that, d, t) {
        var e = d.createElement(t);
        e.type = 'text/javascript';
        e.async = true;
        e.src = that.parent.config.endpoint;
        e.src += '?' + that.serialize(param);
        that.output(e.src);
        var s = d.getElementsByTagName(t)[0];
        s.parentNode.insertBefore(e, s);
    })(this, document, 'script');

    return this;
};


})(iTunesStore, document, window);
(function(iTS, doc, win, undef) {


iTS.search = function(options) {
}


iTS.search.prototype = function() {
};


})(iTunesStore, document, window);
(function(iTS, doc, win, undef) {


iTS.lookup = function(options) {
}


iTS.lookup.prototype = function() {
};


})(iTunesStore, document, window);
(function(iTS, doc, win, undef) {


iTS.ranking = function(options) {
}


iTS.ranking.prototype = function() {
};


})(iTunesStore, document, window);
/* ENDED */
