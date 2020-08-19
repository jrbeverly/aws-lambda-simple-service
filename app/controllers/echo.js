exports.echoController = {
    echo: (req, res) => {
        res.send({ ...req.body });
    }
};