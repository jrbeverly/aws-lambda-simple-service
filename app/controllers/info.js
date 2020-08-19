exports.infoController = {
    info: (req, res) => {
        res.send({ application: 'LambdaExpressSample', version: '1.0' });
    }
};