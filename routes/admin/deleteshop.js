var deleteShop = function(router,connection,config){
    router.get('/shop',function(req,res,next){
        connection.query(`delete from elm_shoplist where id='${req.query.id}'`,function(error,results,fields){
           
        
            res.redirect('/admin/shopManager');
        });
    });

 
}

module.exports = deleteShop;