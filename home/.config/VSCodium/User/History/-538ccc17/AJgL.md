# How to create PDF from HTML

```shell
npm i puppeteer
```

```shell
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=$(which chromium)

node -e "
const puppeteer = require('puppeteer');
const path = require('path');
(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  const absolutePath = path.resolve('./index.html');
  await page.goto('file://' + absolutePath, {waitUntil: 'networkidle0'});
  await page.pdf({
    path: '1.pdf',
    format: 'A4',
    printBackground: true,
    margin: {top: '10mm', bottom: '10mm', left: '10mm', right: '10mm'}
  });
  await browser.close();
})();"
```
