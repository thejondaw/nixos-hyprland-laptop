const puppeteer = require('puppeteer');
const path = require('path');

(async () => {
  console.log('Current directory:', process.cwd());
  const browser = await puppeteer.launch({
    product: 'chrome',
    executablePath: '/run/current-system/sw/bin/chromium',
    args: ['--disable-web-security', '--allow-file-access-from-files']
  });
  const page = await browser.newPage();
  const absolutePath = '/home/jondaw/Documents/Projects/resume-html-project/index.html';  // используем полный путь
  console.log('Trying to access:', absolutePath);

  await page.goto('file://' + absolutePath, {
    waitUntil: 'networkidle0',
    timeout: 30000
  });

  await page.pdf({
    path: 'first-page.pdf',
    format: 'A4',
    printBackground: true,
    margin: {top: '10mm', bottom: '10mm', left: '10mm', right: '10mm'}
  });

  await browser.close();
})().catch(err => {
  console.error('Error occurred:', err);
  process.exit(1);
});
