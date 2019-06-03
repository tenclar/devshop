
const category = require('../models/category')
const product = require('../models/product')

const getProduct = db => async(req, res) => {

    const prod = await product.getProductById(db)(req.params.id)
    const cat = await category.getCategoryById(db)(req.params.id)

    res.render('product-detail', {
        product: prod,      
        category:cat
    })
}


module.exports = {
    getProduct
}
