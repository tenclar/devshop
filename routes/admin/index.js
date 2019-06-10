const init = db => {
    
    const router = require('express').Router()
  
    const catRouter = require('./categories')
    //const prodRouter = require('./products')


    router.use((req,res,next)=> {
        if(req.session.user){
            if(req.session.user.roles.indexOf('admin') <0 ) {
                res.redirect('/')
            }else{
                next()
            }
        }else{
            res.redirect('/')
        }
    })
    router.get('/', (req, res) => res.render('admin/index'))
    router.use('/categorias', catRouter(db))
    //router.use('/produto', prodRouter(db))
    return router
}

module.exports = init



