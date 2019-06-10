const init = db  =>{

    const router = require('express').Router()
    const categories = require('../../controllers/categories')
    
        router.get('/',categories.getCategoriesAdmin(db))
        router.post('/nova',categories.adminCreateCategory(db))
        router.get('/nova',categories.adminCreateCategory(db))
        return router
    }
    
module.exports = init