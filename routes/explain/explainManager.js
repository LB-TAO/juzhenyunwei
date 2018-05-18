var explainManager = function(router,connection,config){
	
	
//说明页面
router.get('/explainManager', function(req, res, next) {
	// res.render('explain/explain.html',config)
	res.render('HR/cmop-HTML/WebContent/Login.html',config)
});


}

module.exports = explainManager; 