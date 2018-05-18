
// /manager.html 表示在admin 文件夹下的manager.html 文件。

var managerManager = function(router,connection,config){

//管理员列表页面
router.get('/managerManager', function(req, res, next) {

	connection.query('select * from elm_manager',function(error,results,fields){
		
		var obj = {
			hostname:config.hostname,
			page: parseInt(results.length/7),//这个是总共的页面数-1
			allNum:results.length
		}
		
		if(req.query.pageNum){
			//从第5x条开始的后面5条信息
			connection.query(`select * from elm_manager limit ${req.query.pageNum*7},7`,function(error,results,fields){
				obj.listArr = results;
				obj.pageNum = req.query.pageNum;
				res.render('manager/managerManager',obj)
			})
			
		}else{
			//从第0条开始的后面5条
			connection.query(`select * from elm_manager limit 0,7`,function(error,results,fields){
				obj.listArr = results;
				obj.pageNum = 0;
				res.render('manager/managerManager',obj)
			})
			
		}
	})
});

//管理员添加页面
router.get('/addManager',function(req,res,next){
	res.render('manager/addManager.html',config);
})

router.post('/addManager',function(req,res,next){
	connection.query(`select * from elm_manager where username='${req.body.username}'`,function(error,results,fields){
		console.log(results+'managerResults');
		if(!results.length){
			connection.query(`insert into elm_manager (username,password,userGroupid,time) values ('${req.body.username}','${req.body.password}','${req.body.userGroupid}','${req.body.time}');`,function(error,results,fields){
				res.redirect('/admin/managerManager');
			})	
		}else{
			res.send('警告：有重复的用户名');
		}
	})
})

// 搜索用户列表
router.post('/searchManager',function(req,res,next){

	connection.query(`select * from elm_manager where username='${req.body.username}'`,function(error,results,fields){
		if(results.length){
				var obj={
					hostname:config.hostname,
					results:results
				}
				res.render('manager/editManager',obj)
			}
	})
	
})

}
module.exports = managerManager; 
