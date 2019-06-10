const init = db => {


    const express = require('express')
    const app = express()

    const category = require('./models/category')
    const routes = require('./routes')

    const bodyParser = require('body-parser')
    const session = require('express-session')

    app.use(bodyParser.json({extended:true}))
    app.use(bodyParser.urlencoded({ extended: false}))
    app.use(session({
        secret:'myDevShopRulez!',
        name:'sessonId'
    }))

    app.set('view engine','ejs')
    app.use(express.static('public'))


    app.use( async(req, res, next) => {
        const categories = await category.getCategories(db)()
        const { user } = req.session

        res.locals = {
            categories,
            user
        } 
        next()
    })

    app.use(routes(db))

    return app
}
module.exports = init