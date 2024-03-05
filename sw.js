"use strict";

// let's set up Service Worker name
const sw = "Idea Village";

// let's set up our cache name (cn)
const cname = "rev-9";

// let's set up our query string
const qs = "search" in location ? location.search : "";

// on install, let's cache some resources
addEventListener("install", function (event) {
    console.log(sw + ": Installing");

    /**
     * First, open the cache and use `addAll()` with an array of assets to add all of them to the cache.
     * Ask the service worker to keep installing until the returning promise resolves.
     */
    event.waitUntil(
        caches.open(cname).then(function (cache) {
            addToCache("/ViewOffline" + qs, cache);

            // then, let's cache the critical resources
            return cache.addAll([
                // museo-sans: 300
                "/fonts/museo-sans-300.woff2",
                // museo-sans: 500
                "/fonts/museo-sans-500.woff2",
                // museo-sans: 900
                "/fonts/museo-sans-900.woff2",
                // museo-sans: 100
                "/fonts/museo-sans-100.woff2",
                "/css/2.0000/dist/shell.rev-1.css?v=9",
                "/images/2.0000/logo.jpg"
            ]);
        })
    );
});

function addToCache(request, cache) {
    fetch(request).then(function (response) {
        var responseClone = response.clone();
        cache.put(request, responseClone);
    });
}

// then, let's activate our service worker
addEventListener("activate", function (event) {
    console.log(sw + ": Activating");

    // let's remove unwanted caches
    event.waitUntil(
        caches.keys().then(function (cnames) {
            return Promise.all(
                cnames.map(function (cache) {
                    if (cache !== cname) {
                        console.log(sw + ": Clearing Old Cache");
                        return caches.delete(cache);
                    }
                })
            );
        })
    );
});

const isPage = function (url) {
    return (
        (location.origin === url.origin && url.pathname === "/") ||
        /\.dtm$/.test(url.pathname) ||
        /\.cgi$/.test(url.pathname)
    );
};

addEventListener("message", function (event) {
    if (event.data.action === "skipWaiting") {
        skipWaiting();
    }
});

// on fetch, let's use the cache but update the entry with the latest contents from the network.
addEventListener("fetch", function (event) {
    console.log(sw + ": Fetching");
    const url = new URL(event.request.url);

    event.respondWith(
        caches
            .match(event.request, {
                ignoreSearch: true
            })
            .then(function (r) {
                return (
                    r ||
                    fetch(event.request).catch(function () {
                        if (isPage(url)) {
                            return caches.match("/ViewOffline", {
                                ignoreSearch: true
                            });
                        }
                    })
                );
            })
    );
});
