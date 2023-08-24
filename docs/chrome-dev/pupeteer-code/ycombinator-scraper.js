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
