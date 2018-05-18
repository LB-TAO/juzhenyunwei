var deleteManager = function(router,connection,config){
	// 管理员的删除
    router.get('/manager',function(req,res,next){
        connection.query(`delete from elm_manager where id='${req.query.id}'`,function(error,results,fields){
           
            // 重定向刷新
            res.redirect('/admin/managerManager');
        });
    });

 
}

module.exports = deleteManager;