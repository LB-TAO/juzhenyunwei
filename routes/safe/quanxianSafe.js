var quanxianSafe = function(router,connection,config){
	router.get('/quanxianSafe',function(req,res,next){
		// 用户组权限
		connection.query('select * from elm_user_group',function(error,results,fields){
			console.log("用户权限管理");
			var obj = {
				hostname:config.hostname,
				page:parseInt(results.length/7),//这个是总共页面数-1？？
				// 总共的条数
				allNum:results.length
			}
			// 判断是否有pageNum存在。存在就执行第一个计算，不存在就执行else条件。pageNum参数是从list.html传过来的
			if(req.query.pageNum){
				// 从第5x条开始的后面5条信息
				connection.query(`select * from elm_user_group limit ${req.query.pageNum*7},7`,function(error,results,fields){
					obj.listArr = results;
					obj.page.Num = req.query.pageNum;
					res.render('safe/quanxianSafe.html',obj);
				})
			}else{
				// 一开始没有pageNum的存在执行的逻辑
				connection.query(`select * from elm_user_group limit 0,7`,function(error,results,fields){
					console.log(results);
					obj.listArr = results;
					// 将pageNum参数传给list.html的页面
					obj.pageNum = 0;
					res.render('safe/quanxianSafe.html',obj);
				})
			}
		});
	});

	



	// 添加用户组列表
	router.get('/addUserGroup',function(req,res,next){
		connection.query('select * from elm_authlist',function(error,results,fields){
			var obj = {
				hostname:config.hostname,
				results:results
			}
			res.render('user_group/addUserGroup',obj);
		});
	});

	router.post('/addUserGroup',function(req,res,next){
		connection.query(`insert into elm_user_grounp (group_name,auth_value) values ('${req.body.group_name}','${req.body.auth_value}');`,function(error,results,fields){
			res.redirect('/admin/userGroup');
		});
	});
}

module.exports = quanxianSafe;