var rongqiManager = function(router,connection,config){
	
	
//容器列表页面
router.get('/rongqiManager', function(req, res, next) {
	
	connection.query('select * from elm_rongqi',function(error,results,fields){
		var obj = {
			hostname:config.hostname,
			page: parseInt(results.length/5),//这个是总共的页面数-1
			allNum:results.length
		}
		
		if(req.query.pageNum){
			//从第5x条开始的后面5条信息
			connection.query(`select * from elm_rongqi limit ${req.query.pageNum*5},5`,function(error,results,fields){
				obj.listArr = results;
				obj.pageNum = req.query.pageNum;
				res.render('rongqi/rongqiManager',obj)
			})
			
		}else{
			//从第0条开始的后面5条
			connection.query(`select * from elm_rongqi limit 0,5`,function(error,results,fields){
				
				obj.listArr = results;
				obj.pageNum = 0;

				res.render('rongqi/rongqiManager',obj)
			})
			
		}
		
		
		
	})

});


//编辑容器
router.get('/editRongqi',function(req,res,next){
		connection.query(`select * from elm_rongqi where id='${req.query.id}'`,function(error,results,fields){
			if(results.length){
				var obj={
					hostname:config.hostname,
					results:results,
					id:req.query.id
				}
				res.render('rongqi/editRongqi',obj)
			}
			
			
		})
	})
	
	
router.post('/editRongqi',function(req,res,next){
		connection.query(`update elm_rongqi set name='${req.body.name}',zhuji='${req.body.zhuji}',status='${req.body.status}',mingling='${req.body.mingling}',time='${req.body.time}' where id='${req.query.id}'`,function(error,results,fields){
			res.redirect('/admin/rongqiManager');
		});
})


// 添加容器
router.get('/addRongqi',function(req,res,next){
	res.render('rongqi/addRongqi',config);
})

router.post('/addRongqi',function(req,res,next){
	
	connection.query(`insert into elm_rongqi (name,zhuji,status,mingling,time) values ('${req.body.name}','${req.body.zhuji}','${req.body.status}','${req.body.mingling}','${new Date().getTime()}');`,function(error,results,fields){
				res.redirect('/admin/rongqiManager');
	})
	
})

}

module.exports = rongqiManager; 