describe('iTunesStore', function() {

    var testdata = {
        debug: true,
        apiKey: 'fme5U6F8DVblNs7HFYtR0ahOs8o1UjxKjqJUuAlBXJSJUu89oN',
        baseHostname: 'tetsuwo.tumblr.com'
    };

    it('default', function() {
        var store = iTunesStore;
        expect(store.config.debug).toBeTruthy();
        expect(store.config.country).toEqual("US");
        expect(store.config.lang).toEqual("en_us");
    });

});
