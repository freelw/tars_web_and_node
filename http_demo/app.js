const express = require('express');
const app = express();

app.use('/', (req, res, next) => {
  res.json({
      msg: "hello tars."
  });
});

app.set('host', process.env.IP || 'localhost');
app.set('port', process.env.PORT || 8000);

const server = app.listen(app.get('port'), app.get('host'), () => {
    console.log('http server listening on port', server.address().port);
});
