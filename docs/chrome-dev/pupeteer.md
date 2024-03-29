# Puppeteer - high-level headless chrome API control.

- Overview + quick tutorial
  - [https://developer.chrome.com/docs/puppeteer/overview/](https://developer.chrome.com/docs/puppeteer/overview/)

### Installation pupeteer

1. Install nvm + node.

2. `npm -i pupeterer --save`

### Some code screenshot generation + webscraping

[screenshot.js](pupeteer-code/screenshot.js)
```js
const puppeteer = require('puppeteer');
const url = process.argv[2];

if (!url) {
    throw "Please provide URL as a first argument";
}
async function run () {
    const browser = await puppeteer.launch({
        headless : false
    });
    const page = await browser.newPage();
    await page.goto(url);
    await page.screenshot({path: 'screenshot.png'});
    browser.close();
}
run();
```



[ycombinator-scraper](pupeteer-code/ycombinator-scraper.js)
```js
const puppeteer = require('puppeteer');
function run () {
    return new Promise(async (resolve, reject) => {
        try {
            const browser = await puppeteer.launch({
                headless: false,
                dumpio: true
            });
            const page = await browser.newPage();
            await page.goto("https://learn.microsoft.com/en-us/certifications/exams/az-305/");
            // here: wait for some time!.
            
            console.log("running...");
;
            let urls = await page.evaluate(() => {
                console.log("bbbb");
                let results = [];
                //let items = document.querySelectorAll('a');
                let items = document.querySelectorAll('a');

                console.log("items: ");
                console.log(items);

                items.forEach((item) => {
                    if (item.hasAttribute('href')) {
                            results.push({
                            url:  item.getAttribute('href'),
                            text: item.innerText,
                        });
                    };
                });
                return results;
            })
            browser.close();
            //return resolve(urls);
            return resolve(`urls: ${urls}`);
        } catch (e) {
            return reject(e);
        }
    })
}
run().then(console.log).catch(console.error);

```

