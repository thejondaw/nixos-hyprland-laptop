# How to create PDF from HTML

```shell
npm i puppeteer
```

```shell
node -e "
const puppeteer = require('puppeteer');
const path = require('path');
(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  const absolutePath = path.resolve('./index.html');
  await page.goto('file://' + absolutePath, {waitUntil: 'networkidle0'});
  await page.pdf({
    path: 'first-page.pdf',
    format: 'A4',
    printBackground: true,
    margin: {top: '10mm', bottom: '10mm', left: '10mm', right: '10mm'}
  });
  await browser.close();
})();"
```


node -e "
const puppeteer = require('puppeteer');
const path = require('path');
(async () => {
  const browser = await puppeteer.launch({
    product: 'chrome',
    executablePath: '/run/current-system/sw/bin/chromium'
  });
  const page = await browser.newPage();
  const absolutePath = path.resolve('./index.html');
  await page.goto('file:' + absolutePath, {waitUntil: 'networkidle0'});
  await page.pdf({
    path: 'first-page.pdf',
    format: 'A4',
    printBackground: true,
    margin: {top: '10mm', bottom: '10mm', left: '10mm', right: '10mm'}
  });
  await browser.close();
})();"
