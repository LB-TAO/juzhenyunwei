var invoiceMoney = function(router,connection,config){
	

router.get('/invoiceMoney', function(req, res, next) {
	connection.query('select * from elm_invoice',function(error,results,fields){
		var obj = {
			// 要传给html模板中。
			hostname:config.hostname,
			// 总共的页面数取整
			page: parseInt(results.length/7),//这个是总共的页面数-1
			// 所有的栏数据
			allNum:results.length
		}
		
		if(req.query.pageNum){
			//显示从第5x条开始的后面5条信息
			connection.query(`select * from elm_invoice limit ${req.query.pageNum*7},7`,function(error,results,fields){
				obj.listArr = results;
				obj.pageNum = req.query.pageNum;
				res.render('money/invoiceMoney',obj)
			})
			
		}else{
			
			connection.query(`select * from elm_invoice limit 0,7`,function(error,results,fields){
				console.log(results);
				obj.listArr = results;
				obj.pageNum = 0;
				res.render('money/invoiceMoney',obj)
			})
			
		}
		
		
		
	})
	
});




router.get('/addShop',function(req,res,next){
	res.render('shop/addShop',config);
})

router.post('/addShop',function(req,res,next){
	
	connection.query(`insert into elm_shoplist (shopname,shopstar,shopvolumn,jiage,wangka) values ('${req.body.shopname}','${req.body.shopstar}','${req.body.shopvolumn}','${req.body.jiage}','${req.body.wangka}');`,function(error,results,fields){
				res.redirect('/admin/shopManager');
	})
	
})
	

router.get('/editShopinfo',function(req,res,next){
		connection.query(`select * from elm_shoplist where id='${req.query.id}'`,function(error,results,fields){
			if(results.length){
				var obj={
					hostname:config.hostname,
					results:results,
					id:req.query.id
				}
				res.render('shop/editShop',obj)
			}
			
			
		})
	})
	

	
router.post('/editShopinfo',function(req,res,next){
		connection.query(`update elm_shoplist set shopname='${req.body.shopname}',shopstar='${req.body.shopstar}',shopvolumn='${req.body.shopvolumn}',jiage='${req.body.jiage}',wangka='${req.body.wangka}' where id='${req.query.id}'`,function(error,results,fields){
			res.redirect('/admin/shopManager');
		});
})

router.get('/editMenuList', function(req, res, next) {
	
	connection.query(`select * from elm_shoplist where id='${req.query.shopId}'`,function(error,results,fields){
		var shopname = results[0].shopname;
	
	
	connection.query(`select * from elm_menulist where shopId='${req.query.shopId}'`,function(error,results,fields){
		console.log(error);
		var obj = {
			hostname:config.hostname,
			page: parseInt(results.length/5),//这个是总共的页面数-1
			allNum:results.length,
			shopname:shopname,
			shopId:req.query.shopId
			
		}
		
		if(req.query.pageNum){
			//从第5x条开始的后面5条信息
			connection.query(`select * from elm_menulist where shopId='${req.query.shopId}' limit ${req.query.pageNum*5},5`,function(error,results,fields){
				obj.listArr = results;
				obj.pageNum = req.query.pageNum;
				res.render('shop/menuList',obj)
			})
			
		}else{
			//从第0条开始的后面5条
			connection.query(`select * from elm_menulist where shopId='${req.query.shopId}' limit 0,5`,function(error,results,fields){
				//console.log(results);
				obj.listArr = results;
				obj.pageNum = 0;
				res.render('shop/menuList',obj)
			})
			
		}
		
		
		
	})
	
	
	})
	
});


var multer = require('multer')
// 在public的路径下，upload上传图片
var storage = multer.diskStorage({
	destination: function (req, file, cb) {
	    cb(null, 'public/upload')
	},
	filename: function (req, file, cb) {
	  
	    cb(null, new Date().getTime()+file.originalname)
	}
})
var upload = multer({storage:storage});



router.get('/addMenu',function(req,res,next){
	//console.log(123)
	var obj = {
		hostname:config.hostname,
		shopId:req.query.shopId
	}
	res.render('shop/addMenu',obj);
})

router.post('/addMenu',upload.single('menuimg'),function(req,res,next){
	connection.query(`insert into elm_menulist (menuname,menubrief,menuprice,menuimg,shopId) values ('${req.body.menuname}','${req.body.menubrief}','${req.body.menuprice}','${req.file.filename}','${req.body.shopId}');`,function(error,results,fields){
				res.redirect(`/admin/editMenuList?shopId=${req.body.shopId}`);
	})
	
})


router.get('/editMenu',function(req,res,next){
		connection.query(`select * from elm_menuList where id='${req.query.id}'`,function(error,results,fields){
			if(results.length){
				var obj={
					hostname:config.hostname,
					results:results
				}
				//console.log(obj);
				res.render('shop/editMenu',obj)
			}
			
			
		})
	})
	
	
router.post('/editMenu',upload.single('menuimg'),function(req,res,next){
		connection.query(`update elm_menuList set menuname='${req.body.menuname}',menubrief='${req.body.menubrief}',menuprice='${req.body.menuprice}',menuimg='${req.file.filename}' where id='${req.body.id}'`,function(error,results,fields){
			res.redirect(`/admin/editMenuList?shopId=${req.body.shopId}`);
		});
})

	
	
	

}
module.exports = invoiceMoney;