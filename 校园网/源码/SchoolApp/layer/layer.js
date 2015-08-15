/**************************************************************

 @Name : layer v1.4.1 弹层组件开发版
 @author: 贤心
 @date: 2012-9-15
 @blog: http://xu.sentsin.com
 @微博：http://t.qq.com/xian_xin
 @QQ群：176047036(前端超级群,js面向对象) 176047238(layer弹层组件群1)
 @Copyright: Sentsin Xu(贤心)
 @官网说明：http://xu.sentsin.com/jquery/layer
 @赞助layer: https://me.alipay.com/sentsin
		
 *************************************************************/ 

void function(window, undefined){		
	var pathType = true, //是否采用自动获取绝对路径。 false：将采用相对路径，需配置layerPath
	pathUrl = '', //相对路径url
	ready = {
		getPath : function(){
			var js = document.scripts, jsPath = js[js.length - 1].src;
			return jsPath.substring(0,jsPath.lastIndexOf("/")+1);
		},
		append : function(){
			pathType && (pathUrl = this.getPath());
			var ie6PNG = '<!--[if IE 6]><script type="text/javascript" src="'+ pathUrl +'skin/png.js"></script><![endif]-->';
			$('head').prepend('\n' + '<link rel="stylesheet" type="text/css" href="'+ pathUrl +'skin/layer.css"  />');
			document.write(ie6PNG);
		},
		global : {
			iE6 : !-[1,] && !window.XMLHttpRequest,
			times : 0, //追寻索引
			config : {}
		}
	};
	ready.append();
	var FUNC = Function();
	FUNC.prototype = { //layer默认内置方法，其它形式都可通过$.layer()任意拓展。
		v : '1.4.1',	//版本号
		alert : function(alertMsg , alertType, alertTit , alertYes){	//普通对话框，类似系统默认的alert()
			return $.layer({
				dialog : {msg : alertMsg, type : alertType, yes : alertYes},
				title : alertTit
			});
		},
		confirm : function(conMsg  , conYes , conTit , conNo){ //询问框，类似系统默认的confirm()
			return $.layer({
				dialog : {msg : conMsg, type : 4, btns : 2, yes : conYes, no : conNo},
				title : conTit
			}); 
		},
		msg : function(msgText , msgTime , msgType , maxWidth){ //普通消息框，一般用于行为成功后的提醒,默认两秒自动关闭
			(msgText == '' || msgText == undefined) && (msgText = '&nbsp;');
			(msgTime == undefined || msgTime == '') && (msgTime = 2);
			return $.layer({
				dialog : {msg : msgText, type : msgType, maxWidth : maxWidth},
				time : msgTime,
				title : ['',false],
				closeBtn : ['',false]
			});	
		},
		tips : function(html , follow , time , maxWidth){
			return $.layer({
				type : 4,
				shade : false,
				time : time,
				maxWidth : maxWidth,
				tips : {msg : html , follow : follow}	
			})
		},
		load : function(loadTime , loadgif , loadShade){
			var border = true;
			loadgif == 3 && (border = false);
			return $.layer({
				time : loadTime,
				shade : loadShade,
				loading : {type : loadgif},
				border :[10,0.3,'#000',border],
				type : 3,
				title : ['',false],
				closeBtn : [0 , false]
			}); 
		}
	};
	layer = new FUNC();
	var CLASS = function(options){
		this.init(options);
	};
	CLASS.prototype = {
		type : function(){
			return ['dialog' , 'page' , 'iframe' , 'loading' , 'tips'];	
		},
		config : { //默认配置
			skin : 0,
			shade : [0.5 , '#000' , true],
			fix : true,
			move : ['.xubox_title' , true],
			type : 0,
			title : ['信息' , true],
			offset : ['220px' , '50%'],
			area : ['310px' , 'auto'],
			closeBtn : [0 , true],
			time : 0,
			border : [10 , 0.3 , '#000', true],
			zIndex : 19891014, 
			maxWidth : 400,
			fadeIn : [300 , false],
			dialog : {btns : 1, btn : ['确定','取消'], type : 3, msg : '', yes : function(index){ LAYER.close(index);}, no : function(index){ LAYER.close(index);}
			},
			page : {dom : '#xulayer'},
			iframe : {src : 'http://xu.sentsin.com'},
			loading : {type : 0},
			tips : {msg : '', follow : ''},
			success : function(layer){}, //layer创建成功后的回调
			close : function(index){ LAYER.close(index);}, //右上角关闭回调
			end : function(){} 
		},
		init : function(setings){
			ready.global.times++;
			var config = this.config;
			this.config = $.extend({} , config , setings);
			this.dialog = $.extend({}, config.dialog , setings.dialog);
			this.page = $.extend({}, config.page , setings.page);
			this.iframe = $.extend({}, config.iframe , setings.iframe);	
			this.loading = $.extend({}, config.loading , setings.loading);
			this.tips = $.extend({}, config.tips , setings.tips);
			this.adjust();
		},
		space : function(){ //层容器
			ready.global.config[ready.global.times] = this.config;
			var config = this.config, dialog = this.dialog,
			frame = [
				'<div class="xubox_dialog"><span class="xubox_msg xulayer_png32 xubox_msgico xubox_msgtype' + dialog.type + '"></span><span class="xubox_msg xubox_text">' + dialog.msg + '</span></div>',	
				'<div class="xubox_page xubox_page_' + config.skin + '"></div>',
				'<iframe id="xubox_iframe" name="xubox_iframe" class="xubox_iframe" frameborder="0" src="' + this.iframe.src + '"></iframe>',				
				'<span class="xubox_loading xubox_loading_'+ this.loading.type +'"></span>',
				'<div class="xubox_tips xubox_tips_' + config.skin +'"><div class="xubox_tipsMsg">'+ this.tips.msg +'</div><i class="xulayer_png32"></i></div>'
			];			
			var shade = '' , border = '' , times = ready.global.times;
			this.zIndex = config.zIndex + times;
			var zIndex = this.zIndex,
			shadeStyle = "z-index:"+ zIndex +"; background:"+ config.shade[1] +"; opacity:"+ config.shade[0] +"; filter:'alpha(opacity="+ config.shade[0]*100 +")'; filter:alpha(opacity="+ config.shade[0]*100 +");";
			config.shade[2] && (shade = '<div id="xubox_shade' + times + '" class="xubox_shade xubox_shade_' + config.skin + '" style="'+ shadeStyle +'"></div>');	
			var borderStyle = "z-index:"+ (zIndex-1) +";  background: "+ config.border[2] +"; opacity:"+ config.border[1] +"; filter:'alpha(opacity="+ config.border[1]*100 +")'; filter:alpha(opacity="+ config.border[1]*100 +"); top:-"+ config.border[0] +"px; left:-"+  config.border[0] +"px;";
			config.border[3] && (border = '<div id="xubox_border'+ times +'" class="xubox_border" style="'+ borderStyle +'"></div>');
			var boxhtml = '<div times="'+ times +'" showtime="'+ config.time +'" style="z-index:'+ zIndex +'" id="xubox_layer'+ times +'" class="xubox_layer xubox_layer_' + config.skin + '">'	
				+ '<div style="z-index:'+ zIndex +'" class="xubox_main xubox_main_' + config.skin + '">'
				+ frame[config.type]
				+ '<h2 class="xubox_title xubox_title_' + config.skin + '"><i class="xulayer_png32"></i><em>' + config.title[0] + '</em></h2>'
				+ '<a class="xubox_close xulayer_png32 xubox_close' + config.closeBtn[0] + '_' + config.skin + '" href="javascript:;"></a>'
				+ '<span class="xubox_botton"></span>'
				+ '</div>'+ border + '</div>';
			return [shade , boxhtml];
		},
		adjust : function(){ //插入layer
			var othis = this , space = '', config = this.config, dialog = this.dialog, page = this.page,
			setSpace = function(){
				space = othis.space();
				$("body").append(space[0]);
			};
			switch(config.type){
				case 1:
					if($(page.dom).parents('.xubox_page').length == 0){
						setSpace();
						$(page.dom).show().wrap(space[1]);
					}else{
						return false;	
					}
				break;
				case 2:
					$('.xubox_layer').find('.xubox_iframe').length > 0 && LAYER.close($('.xubox_iframe').parents('.xubox_layer').attr('times'));
					setSpace();
					$("body").append(space[1]);
				break;
				case 3:
					 config.title = ['',false];
					 config.area = ['auto','auto']; 
					 config.closeBtn = ['',false];
					 $('.xubox_layer').find('.xubox_loading').length > 0 && LAYER.close($('.xubox_loading').parents('.xubox_layer').attr('times'));
					 setSpace();
					 $("body").append(space[1]);
				break;
				case 4:
					config.title = ['',false];
					config.area = ['auto','auto'];
					config.fix = false;
					config.border = [0,0,0,false];
					$('.xubox_layer').find('.xubox_tips').length > 0 && LAYER.close($('.xubox_tips').parents('.xubox_layer').attr('times'));
					setSpace();
					$("body").append(space[1]);
					$('.xubox_tips').fadeIn(200).parents('.xubox_layer').find('.xubox_close').css({top : 5 , right : 5})
				break;
				default : 
					config.title[1] || (config.area = ['auto','auto']);
					$('.xubox_layer').find('.xubox_dialog').length > 0 && LAYER.close($('.xubox_dialog').parents('.xubox_layer').attr('times'));
					setSpace();
					$("body").append(space[1]);
				break;
			};
			times = ready.global.times;
			this.layerS = $('#xubox_shade' + times);
			this.layerB = $('#xubox_border' + times);
			this.layerE = $('#xubox_layer' + times);
			var layerE = this.layerE;		
			//设置layer面积坐标等数据 
			var _mleft = layerE.outerWidth()/2;
			if(config.offset[1].indexOf("px") != -1){
				var _left = _mleft + parseInt(config.offset[1]);
			}else{
				if(config.offset[1] == '50%'){
					var _left =  config.offset[1];
				}else{
					var _left =  _mleft + parseInt(config.offset[1])/200*$(window).width();
				}

			};
			layerE.css({'left' : _left + config.border[0] , 'width' : config.area[0] , 'height' : config.area[1]});
			config.fix ? layerE.css({'top' : config.offset[0]}) : layerE.css({'top' : parseInt(config.offset[0]) + $(window).scrollTop() , 'position' : 'absolute'});	
			this.layerMian = layerE.find('.xubox_main');
			this.layerTitle = layerE.find('.xubox_title');
			this.layerText = layerE.find('.xubox_text');
			this.layerPage = layerE.find('.xubox_page');
			this.layerBtn = layerE.find('.xubox_botton');			
			//配置按钮 对话层形式专有
			if(config.type == 0 && config.title[1]){
				switch(dialog.btns){
					case 0:
						this.layerBtn.html('').hide();
					break;
					case 2:
						this.layerBtn.html('<a href="javascript:;" class="xubox_yes xubox_botton2_' + config.skin + '">' + dialog.btn[0] + '</a>' + '<a href="javascript:;" class="xubox_no xubox_botton3_' + config.skin + '">' + dialog.btn[1] + '</a>');
					break;
					default:
						this.layerBtn.html('<a href="javascript:;" class="xubox_yes xubox_botton1_' + config.skin + '">' + dialog.btn[0] + '</a><a class="xubox_no" style="displa:none;"></a>');
				}
			};
			this.pagetype();
			this.callback(config);
		},
		pagetype : function(){ //调整layer			
			var othis = this, layerE = this.layerE, config = this.config, page = this.page;
			othis.autoArea();
			config.time == 0 || this.autoclose();
			config.move[1] ? layerE.find('.xubox_title').css({'cursor':'move'}) : layerE.find('.xubox_title').css({'cursor':'auto'});		
			config.closeBtn[1] || layerE.find('.xubox_close').remove().hide();
			if(!config.title[1]){
				layerE.find('.xubox_title').remove().hide();
				config.type != 4 && layerE.find('.xubox_close').removeClass('xubox_close0_' + config.skin).addClass('xubox_close1_' + config.skin);
			}else{
				this.layerTitle.css({width : layerE.outerWidth()});	
			};		
			config.border || layerE.removeClass('xubox_layerBoder');
			var maRight = parseInt(this.layerMian.css('margin-right')),
			paBottom = parseInt(layerE.css('padding-bottom'));
			layerE.attr({'type' :  othis.type()[config.type]});
			switch(config.type){
				case 1: 	
					layerE.find(page.dom).addClass('layer_pageContent');
					this.layerPage.css({'width' : layerE.width() - 2*maRight});
					config.shade && layerE.css({'z-index' : othis.zIndex + 1});
					config.title[1] ? this.layerPage.css({'top' : maRight + this.layerTitle.outerHeight()}) : this.layerPage.css({'top' : maRight});
				break;
				case 2:
					layerE.find('.xubox_iframe').addClass('xubox_load').css({'width' : layerE.width() - 2*maRight});
					config.title[1] ? layerE.find('.xubox_iframe').css({'top' : this.layerTitle.height() + paBottom ,'height' : layerE.height() - this.layerTitle.height()}): layerE.find('.xubox_iframe').css({top : paBottom , height : layerE.height()});
					 ready.global.iE6 && layerE.find('#xubox_iframe').attr("src" , othis.iframe.src);
				break;
				case 4 :
					var top = $(othis.tips.follow).offset().top - $(othis.tips.follow).outerHeight() - layerE.outerHeight() + 15;
					var left = $(othis.tips.follow).offset().left + layerE.outerWidth()/2;
					layerE.css({top : top , left : left});
				break;	
				default :
					if(config.title[1]){
						this.layerText.css({paddingTop : 18 + this.layerTitle.outerHeight()});
					}else{
						layerE.find('.xubox_msgico').css({top : '10px'});
						this.layerText.css({marginTop : 12})	
					}
				break;
			};
			var fadeTime = 0; config.fadeIn[1] && (fadeTime = config.fadeIn[0]);
			layerE.animate({opacity : 1 , filter : 'alpha(opacity='+ 100 +')'},fadeTime);
			this.move();
		},
		autoArea : function(){ //自适应宽高
			var othis = this, layerE = this.layerE, config = this.config, page = this.page;
			if(config.area[0] == 'auto' && this.layerMian.outerWidth() >= config.maxWidth){	
				layerE.css({width : config.maxWidth});
			}
			config.title[1] ? titHeight =  layerE.find('.xubox_title').innerHeight() : titHeight = 0;
			switch(config.type){
				case 0:
					var aBtn = this.layerBtn.find('a'),
					outHeight =  this.layerText.outerHeight() + 20;
					if(aBtn.length > 0){
						var btnHeight = this.layerBtn.find('a').outerHeight() +  parseInt(this.layerBtn.find('a').css('bottom')) + 10;
					}else{
						var btnHeight = 0;
					}
				break;
				case 1:
					var btnHeight = 0,outHeight = $(page.dom).outerHeight();
					layerE.css({width : this.layerPage.outerWidth()});
				break;
				case 3:
					var btnHeight = 0; var outHeight = $(".xubox_loading").outerHeight(); 
					this.layerMian.css({width : $(".xubox_loading").width()});
				break;
			};
			layerE.css({marginLeft : -layerE.outerWidth()/2});
			config.area[1] == 'auto' && this.layerMian.css({height : titHeight + outHeight + btnHeight});
			othis.layerB.css({'width' : layerE.outerWidth() + 2*config.border[0] , 'height' : layerE.outerHeight() + 2*config.border[0]});
			(ready.global.iE6 && config.area[0] != 'auto') && this.layerMian.css({width : layerE.outerWidth()});
		},	
		move : function(){ //拖拽层		
			var config = this.config, layerMove = this.layerE.find(config.move[0]);
			config.move[1] && layerMove.attr('move','ok');
			$(config.move[0]).mousedown(function(M){	
				M.preventDefault();
				var layerE = $(this).parents('.xubox_layer');
				if($(this).attr('move') === 'ok'){
					var ismove = true, 
					moveX = M.pageX - parseInt(layerE.position().left),
					moveY = M.pageY - parseInt(layerE.position().top);						
					$(document).mousemove(function(M){
						if(ismove){
							var x = M.pageX - moveX;
							if(layerE.css('position') == 'fixed'){
								var y = M.pageY - moveY - $(window).scrollTop();	
							}else{
								var y = M.pageY - moveY;	
							}
							layerE.css({"left" : x , "top" : y});										
						}					  						   
					}).mouseup(function(){
						ismove = false;
					});
				}
			});
		},
		getIndex : function(selector){ //获取layer当前索引
			return $(selector).parents('.xubox_layer').attr('times');
		},
		getChildFrame : function(selector){ //获取子iframe的DOM
			return $("#xubox_iframe").contents().find(selector);
		},
		getFrameIndex : function(){ //得到iframe层的索引，子iframe时使用
			return $('#xubox_iframe').parents('.xubox_layer').attr('times');
		},
		close : function(index){ //关闭layer
			var layerNow = $('#xubox_layer' + index), shadeNow = $('#xubox_shade' + index);
			if(layerNow.attr('type') == this.type()[1]){
				layerNow.find('.xubox_close,.xubox_botton,.xubox_title,.xubox_border').remove();
				for(var i = 0 ; i < 3 ; i++){
					layerNow.find('.layer_pageContent').unwrap().hide();
				}
			}else{
				$.browser.msie && layerNow.find('#xubox_iframe').remove();
				layerNow.remove();
			}
			shadeNow.remove();
			try{
				ready.global.iE6 && this.reselect();
				ready.global.config[index].end();
				ready.global.times--;
				delete ready.global.config[index];
			}catch(e){}
		},
		loadClose : function(){ //关闭加载层，仅loading私有
			var parent = $('.xubox_loading').parents('.xubox_layer'),
			index = parent.attr('times');
			$('#xubox_shade' + index).remove();
			parent.remove();
		},
		autoclose : function(){ //自动关闭layer
			$.each(ready.global.config , function(index , value){
				var time = value.time;
				var maxLoad = function(){
					time--;
					time === 0 && LAYER.close(index);
					$('.xubox_layer').length < 1 && clearInterval(autotime);
				};
				var autotime = setInterval(maxLoad , 1000);
			});
		},
		shift : function(type , rate){ //layer内置动画
			var othis = this, config = this.config, iE6 = ready.global.iE6, layerE = this.layerE;
			switch(type){
				case 'left-top':
					layerE.css({left : layerE.outerWidth()/2 + config.border[0] , top : -layerE.outerHeight()}).animate({top : config.border[0]},rate,function(){
						iE6 && othis.IE6();	
					});
				break; 
				case 'right-top':
					layerE.css({left : $(window).width() - layerE.outerWidth()/2 - config.border[0] , top : -layerE.outerHeight()}).animate({top : config.border[0]},rate,function(){
						iE6 && othis.IE6();	
					});
				break; 
				case 'left-bottom':
					layerE.css({left : layerE.outerWidth()/2 + config.border[0] , top : $(window).height()}).animate({top : $(window).height() - layerE.outerHeight() - config.border[0]},rate,function(){
						iE6 && othis.IE6();	
					});
				break; 
				case 'right-bottom':
					layerE.css({left :  $(window).width() - layerE.outerWidth()/2 - config.border[0] , top : $(window).height()}).animate({top : $(window).height() - layerE.outerHeight() - config.border[0]},rate,function(){
						iE6 && othis.IE6();	
					});
				break;
			};
		},
		callback : function(deliver){
			LAYER = this;
			var layerE = this.layerE, config = this.config, dialog = this.dialog;
			this.config.success(layerE);
			ready.global.iE6 && this.IE6();
			$('.xubox_close').off('click').on('click',function(){
				var index = $(this).parents('.xubox_layer').attr('times');
				try{
					ready.global.config[index].close(index);
				}catch(e){
					LAYER.close(index);
				}
			});
			layerE.find('.xubox_yes').off('click').on('click',function(){
				var index = $(this).parents('.xubox_layer').attr('times');
				dialog.yes(index);
			});
			layerE.find('.xubox_no').off('click').on('click',function(){
				var index = $(this).parents('.xubox_layer').attr('times');
				dialog.no(index);
			});
		},
		IE6 : function(){
			var othis = this, layerE = this.layerE,
			ie6Shade =  function(){ //ie6的遮罩
				var winDOM = [$(document).width(),$(document).height(),$(window).width()];
				winDOM[0] > winDOM[1] && (winDOM[0] = winDOM - 17); //17为ie6滚动条宽度。
				othis.layerS.css({width : winDOM[0] , height : winDOM[1]});		
			};
			ie6Shade();
			$(window).resize(ie6Shade).scroll(ie6Shade);	
			var _ieTop =  layerE.offset().top;	
			if(this.config.fix){ //ie6的固定与相对定位
				var ie6Fix = function(){
					layerE.css({top : $(document).scrollTop() + _ieTop});
				};	
			}else{
				var ie6Fix = function(){
					layerE.css({top : _ieTop});	
				};
			}
			ie6Fix();
			$(window).scroll(ie6Fix);
			$.each($('select'),function(index , value){ //隐藏select
				$(this).css('display') == 'none' || $(this).attr({'layer' : '1'}).hide(); 
			});
			this.reselect = function(){ //恢复select
				$.each($('select'),function(index , value){
					($(this).attr('layer') == 1 && $('.xubox_layer').length < 1) && $(this).removeAttr('layer').show(); 
				});
			};
			DD_belatedPNG.fix(".xulayer_png32"); //ie6的png32透明		
		}
	};
	$.layer = function(deliver){
		return new CLASS(deliver);
	};
}(window);