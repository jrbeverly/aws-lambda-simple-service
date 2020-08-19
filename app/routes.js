const {echoController} = require('./controllers/echo.js');
const {infoController} = require('./controllers/info.js');

exports.routes = (router) => {
    router.get('/api/info', infoController.info);
    router.post('/api/v1/getback', echoController.echo);
};