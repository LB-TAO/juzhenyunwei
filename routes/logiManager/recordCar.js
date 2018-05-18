var recordCar= function(router,connection,config){
	
	
router.get('/recordCar', function(req, res, next) {
	connection.query('select * from elm_recordCar',function(error,results,fields){
		var obj = {
			// 要传给html模板中。
			hostname:config.hostname,
			// 总共的页面数取整
			page: parseInt(results.length/7),//这个是总共的页面数-1
			// 所有的栏数据
			allNum:results.length
		}
		// req.query是从html模板中传过来的参数拿到pageNum，当前页。
		if(req.query.pageNum){
			//显示从第5x条开始的后面5条信息
			connection.query(`select * from elm_recordCar limit ${req.query.pageNum*7},7`,function(error,results,fields){
				obj.listArr = results;
				obj.pageNum = req.query.pageNum;
				res.render('logiManager/recordCar',obj)
			})
			
		}else{
			//从第0条开始的后面5条，一开始就渲染的。
			connection.query(`select * from elm_recordCar limit 0,7`,function(error,results,fields){
				console.log(results);
				obj.listArr = results;
				obj.pageNum = 0;
				res.render('logiManager/recordCar',obj)
				
			})
			
		}
		
		
		
	})
	
});




}
module.exports = recordCar;