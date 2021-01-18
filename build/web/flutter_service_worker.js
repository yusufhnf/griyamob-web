'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "7c1eec1cb3332a5ff2a20cdf4cd3ceee",
"assets/assets/griya-landing.png": "ad50967b438fdb79992e4d05a9acecd4",
"assets/assets/icons/internet-icon.svg": "be0a86380d2f26cfd2d194937509e60c",
"assets/assets/icons/invest-icon.svg": "3a05708694e36eb909a6b41621b63ab4",
"assets/assets/icons/listrik-icon.svg": "574993287b547947ab99a0171edab3a8",
"assets/assets/icons/pdam-icon.svg": "33d8057a1694bef8ea29b65807e93d77",
"assets/assets/icons/pendidikan-icon.svg": "a417cf7043db34669037b4a92e2b5585",
"assets/assets/icons/pulsa-icon.svg": "0451a5c0ae790aeb8c49b0fb90b3fb5e",
"assets/assets/icons/streaming-icon.svg": "2e59a6c5c0835c452948feb1ecfe4886",
"assets/assets/icons/tiket-icon.svg": "3f0743c6b3e5b57fa59523b2252191b4",
"assets/assets/images/empty.svg": "2fb3fc9f3925c425851e397dc8ef702c",
"assets/assets/images/failed.svg": "ed8878946c09e3672e3d8302d9fcb182",
"assets/assets/images/g-logo.png": "7f508e42294250fa95a8f5757ead7d44",
"assets/assets/images/griyabayar-logo.png": "dd83ac1ffd4153367454731da022fff6",
"assets/assets/images/landing.png": "af1cb86aff10cfb7071c175b1843f0ee",
"assets/assets/images/login.png": "727fa83ce0ba3be16c10cbcb463e4a6f",
"assets/assets/images/noitem.png": "25ae3fcc2e75e3996b91a799b81c0f2a",
"assets/assets/images/paymentsuccess.png": "2a67f49e2ffd54c2e153707f2acf8c59",
"assets/assets/images/sad.svg": "e2c839315cc94d414acc7996c79ebf7b",
"assets/assets/images/signup.png": "3a3dd0f97d1fb72f206c95033ce3126a",
"assets/assets/images/success.svg": "827b6f3b3b36e9ef2db55a76b9ea3612",
"assets/assets/images/undraw_fill_forms_yltj.svg": "0d830f8455624f9905c71731e7ddf06e",
"assets/assets/images/undraw_Newsletter_re_wrob.svg": "f7cb5a08695e3e2008f2dc586063dec6",
"assets/assets/images/undraw_news_go0e.svg": "dc7d29bfae5ef50902ebaf4606173ecf",
"assets/assets/images/undraw_signal_searching_bhpc.svg": "a410416d2be78b31f01e950ba887eca7",
"assets/assets/images/undraw_under_construction_46pa.svg": "8329224e92720f1b40cd3ab16d3407fb",
"assets/assets/images/undraw_wallet_aym5.svg": "94e49dc7a17d8c03563d9c050e6eb60e",
"assets/FontManifest.json": "62520cfe7eed27ef39e363312d9a430a",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/NOTICES": "f4ea9fab4536bd273df2b4111862ae5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b14fcf3ee94e3ace300b192e9e7c8c5d",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "8d0d74fa070d25f1d57e29df18800b8a",
"assets/packages/rflutter_alert/assets/images/2.0x/close.png": "abaa692ee4fa94f76ad099a7a437bd4f",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_error.png": "2da9704815c606109493d8af19999a65",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_info.png": "612ea65413e042e3df408a8548cefe71",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_success.png": "7d6abdd1b85e78df76b2837996749a43",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_warning.png": "e4606e6910d7c48132912eb818e3a55f",
"assets/packages/rflutter_alert/assets/images/3.0x/close.png": "98d2de9ca72dc92b1c9a2835a7464a8c",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_error.png": "15ca57e31f94cadd75d8e2b2098239bd",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_info.png": "e68e8527c1eb78949351a6582469fe55",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_success.png": "1c04416085cc343b99d1544a723c7e62",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_warning.png": "e5f369189faa13e7586459afbe4ffab9",
"assets/packages/rflutter_alert/assets/images/close.png": "13c168d8841fcaba94ee91e8adc3617f",
"assets/packages/rflutter_alert/assets/images/icon_error.png": "f2b71a724964b51ac26239413e73f787",
"assets/packages/rflutter_alert/assets/images/icon_info.png": "3f71f68cae4d420cecbf996f37b0763c",
"assets/packages/rflutter_alert/assets/images/icon_success.png": "8bb472ce3c765f567aa3f28915c1a8f4",
"assets/packages/rflutter_alert/assets/images/icon_warning.png": "ccfc1396d29de3ac730da38a8ab20098",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "abc5f251aee479a7287e1f91ee30509a",
"/": "abc5f251aee479a7287e1f91ee30509a",
"main.dart.js": "60763a1baf28ba0c780de046fade1009",
"manifest.json": "089a267b417c6e99df10a70e56034127",
"version.json": "549413b5baa2200b61c1566dec8a02a5"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
