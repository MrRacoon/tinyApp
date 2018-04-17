const watch = require('node-watch');

module.exports = {
  config: (updFn, rmFn) => watch(__dirname + '/../config.json', { persistent: true }, (evt, name) => {
    try {
      const str = fs.readFileSync(CONFIG, 'utf8');
      const msg = JSON.stringify(JSON.parse(str));
      if (evt === 'update') { updFn(msg); }
    } catch (e) {
      console.error(e);
    }
  })
};
