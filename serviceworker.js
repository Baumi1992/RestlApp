//const CACHE_NAME = 'resteApp-cache';

const staticAssets = [
    '.',
    'assets/JS/app.js',
    'assets/JS/script.js',
    'assets/LESS/main.less',
    'assets/LESS/grid.less',
    'assets/LESS/style.less'

];

// CODELAB: Add list of files to cache here.
const FILES_TO_CACHE = [
];

self.addEventListener('install', async event => {
    console.log('[ServiceWorker] Install');
    
    const cache = await caches.open('resteApp-static');
    cache.addAll(staticAssets);
    
    // CODELAB: Precache static resources here.

    // event.waitUntil(
    //     caches.open(cache).then(function(cache) {
    //         //console.log('[ServiceWorker] Caching app shell');
    //         return cache.addAll(FILES_TO_CACHE).then(() => console.log('Assets added to cache'))
    //             .catch(err => console.log('Error while fetching assets', err));
    //     })
    // );
});

self.addEventListener('fetch', event => {
    console.log('[ServiceWorker] Fetch', event.request.url);
    const req = event.request;
    const url = new URL(req.url);
    
    if(url.origin === location.origin){
        event.respondWith(cacheFirst(req));
    }else{
        event.respondWith(networkFirst(req));
    }
    
    
    // CODELAB: Add fetch event handler here.
    
});

async function cacheFirst(req){
    const cachedResponse = await caches.match(req);
    return cachedResponse || fetch(req);
}

async function networkFirst(req){
    const cache = await caches.open('resteApp-dynamic');
    
    try {
        const res = await fetch(req);
        cache.put(req, res.clone());
        return res;
    } catch (error) {
        return await cache.match(req);
    }
    
    

}
// self.addEventListener('activate', event => {
//     console.log('[ServiceWorker] Activate');
//     // CODELAB: Remove previous cached data from disk.
  
//     self.clients.claim();
//   });
  

