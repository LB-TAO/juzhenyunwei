var baoxiaoMoney = function(router,connection,config){
	
	
//说明页面
router.get('/baoxiaoMoney', function(req, res, next) {
	res.render('HR/cmop-HTML/WebContent/BSPList.html',config)
});

}

module.exports = baoxiaoMoney; 
