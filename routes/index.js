const init = db => {
    const router = require('express').Router()
    const home = require('../controllers/home')

    const catRouter = require('./categories')
    const prodRouter = require('./products')

    router.get('/', home.getIndex)
    router.use('/categoria', catRouter(db))
    router.use('/produto', prodRouter(db))
    return router
}

module.exports = init