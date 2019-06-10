const init = db => {
    const router = require('express').Router()

    const admin = require('./admin')

    const home = require('../controllers/home')
    const auth = require('../controllers/auth')

    const catRouter = require('./categories')
    const prodRouter = require('./products')

    //routes
    router.get('/', home.getIndex)
    router.use('/admin', admin(db))

    router.use('/categoria', catRouter(db))
    router.use('/produto', prodRouter(db))
    
     //auth
     router.get('/logout', auth.logout)
     router.post('/login', auth.login(db))  
   
    return router
}

module.exports = init