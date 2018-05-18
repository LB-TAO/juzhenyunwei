var express = require('express'); 
// 如何解析express.Router()方法？？express路由？？
// express.Router类创建模块化、可挂载的路由句柄。
// Router实列是一个完整的中间件和路由系统，因此常称其为一个"mini-app"
var router = express.Router();
var config = require('../config/config.js');


var editManager = require('./admin/editManager.js');
var deleteManager = require('./admin/deleteManager.js');
var deleteShop = require('./admin/deleteShop.js')

var shopManager = require('./shop/shopManager.js');

var blogManager = require('./blog/blogManager.js');
// 容器列表
var rongqiManager = require('./rongqi/rongqiManager.js');
// 说明
var explainManager = require('./explain/explainManager.js');

// 管理员列表
var managerManager = require('./manager/managerManager.js');

// 权限设置
var userGroup = require('./userGroup/userGroup.js');
var authManager = require('../config/authManager.js');
// 链接mysql
var connection = require('../config/connectMysql.js');

// 在线报销
var baoxiaoMoney = require('./money/baoxiao.js');
var invoiceMoney = require('./money/invoice.js');

// 在线打卡
var dakaState = require('./renli/dakaState.js');
var chuqinState = require('./renli/chuqinState.js');
var xinziState = require('./renli/xinziState.js');
var renyuanState = require('./renli/renyuanState.js');

// 资产管理
var zichanManager = require('./zichan/zichanManager.js')

// 安全管理
var renlianSafe = require('./safe/renlianSafe.js');
var shipinSafe = require('./safe/shipinSafe.js');
var menjinSafe = require('./safe/menjinSafe.js');
var zhiwenSafe = require('./safe/zhiwenSafe.js');
var quanxianSafe = require('./safe/quanxianSafe.js');
var mokuaiSafe = require('./safe/mokuaiSafe.js');
var fingerEnter = require('./safe/fingerEnter.js');

// 后勤管理
var fingerTx = require('./logiManager/fingerTaxi.js');
var useCar = require('./logiManager/useCar.js');
var locationCar = require('./logiManager/locationCar.js');
var locationManager = require('./logiManager/locationManager.js');
var recordCar =  require('./logiManager/recordCar.js');

// 修改用户
editManager(router,connection,config);
// 用户删除
deleteManager(router,connection,config);
deleteShop(router,connection,config);
shopManager(router,connection,config);
blogManager(router,connection,config);
// 权限
userGroup(router,connection,config);
// 容器
rongqiManager(router,connection,config);
// 说明
explainManager(router,connection,config);
// 管理员列表
managerManager(router,connection,config);
// 在线报销
baoxiaoMoney(router,connection,config);
invoiceMoney(router,connection,config);
// 在线打卡
dakaState(router,connection,config);
chuqinState(router,connection,config);
xinziState(router,connection,config);
renyuanState(router,connection,config);
// 资产管理
zichanManager(router,connection,config);
// 安全管理
renlianSafe(router,connection,config);
shipinSafe(router,connection,config);
menjinSafe(router,connection,config);
zhiwenSafe(router,connection,config);
quanxianSafe(router,connection,config);
mokuaiSafe(router,connection,config);
fingerEnter(router,connection,config);
// 后勤管理
fingerTx(router,connection,config);
useCar(router,connection,config);
locationCar(router,connection,config);
locationManager(router,connection,config);
recordCar(router,connection,config);
router.get('/',authManager([1,2,3,4,5,6,7,8,9,10]),function(req,res,next){
	// 检查用户是否已经登录,如果登录，就将值作为参数传到index.html页面上。如果没有该用户就重定向到路径为login的get请求渲染login页面。
	if(req.session.sign){
		var obj = {
			hostname:config.hostname,
			title:config.title,
			// 可以从上一个中间件函数中传过来的req参数中获取到authValue的值。
			authValue:req.session.authValue
		}
		res.render('admin/index',obj);
	}else{
		res.redirect('/admin/login');
	}
});






router.get('/index_v1.html', function(req, res, next) {
	res.render('admin/index_v1.html',config)
});


router.get('/login', function(req, res, next) {
	res.render('login/login',config);
});

router.post('/login',function(req,res,next){
	connection.query(`select * from elm_manager where username='${req.body.username}'`,function(error,results,fields){
		console.log(results + 'results');
		if(results.length){
			if(results[0].password==req.body.password){
				
				req.session.sign = true;
				req.session.username = req.body.username;
				// 登录后重定向路径admin，或许就是地址栏中的hash值一直都是admin的原因吧。？？
				res.redirect('/admin');
			}
		}else{

			res.render('login/login',config);
		}
	})
	
})


// 通过路由传给app.js

module.exports = router;
