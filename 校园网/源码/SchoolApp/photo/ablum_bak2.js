Ext.onReady(function() {
	//创建图片数据模型 ，数据源需要
	var PhotoModel = Ext.define('ImageModel', {
				extend : 'Ext.data.Model',
				fields : [{name : 'name'},
						{name : 'type'}, 
						{name : 'size'},
						{name : 'lastmod', type : 'date',dateFormat : 'timestamp'},
						{name : 'file'},
						{name : 'src'},
						{name : 'width'},
						{name : 'height'},
						{name : 'trueWidth'},
						{name : 'trueHeight'}]
			});

	//创建数据源
	var store = Ext.create("Ext.data.Store", {
				model : PhotoModel
			});

	var ddtip;
	
	//图片提示模板
	var tiptpl = '名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：{0}<br/>' +
			  '类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：{1}<br/>' +
			 '大&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小：{2}<br/>' + 
			 '尺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;寸：{3}<br/>' + 
			 '修改时间：{4}<br/>'
	
	//创建图片存放的容器
	var view = Ext.create('Ext.view.View', {
				store : store, //指定数据源
				tpl : [ //设置展示模板
						'<tpl for=".">',
						'<div class="thumb-wrap" id="{name}">',
						'<div class="thumb-upload-progress">0%</div><div class="thumb-loading-tip">正在加载...</div>',
						'<div class="thumb"><img src="{src}" height="{height}" width="{width}"></div>',
						'<span>{name}</span></div>', '</tpl>',
						'<div class="x-clear"></div>'],
				style : {
					backgroundColor : '#FFFFFF',
					fontFamily : '微软雅黑'
				},
				multiSelect : true,
				trackOver : true,
				overItemCls : 'x-item-over',
				itemSelector : 'div.thumb-wrap',
				emptyText : '没有显示的相片',
				autoScroll : true,
				listeners : {
					'afterrender' : function() {
						//创建用户拖拽提示
						ddtip = view.el.createChild({
									tag : 'div',
									cls : 'dd-tip',
									html : '请将图片拖动到这里'
								});
						//创建相片浮动提示
						Ext.create('Ext.tip.ToolTip', {
								target : view.el,
								delegate : view.itemSelector,
								trackMouse : true,
								renderTo : Ext.getBody(),
								anchor : 'right',
								listeners : {
									beforeshow : function(tip) {
										var record = view
													.getRecord(tip.triggerElement);
											tip.update(Ext.String.format(
													tiptpl, record
															.get('name'),
													record.get('type'), record
															.get('size'),record
															.get('trueWidth') + "×" + record
															.get('trueHeight'),
													Ext.Date.format(
															record.get('lastmod'),
															'Y年m月d日 H时i分')));
										 
									}
								}
							});
					}
				}
			});

	var addButton = Ext.create('Ext.button.Button',{
            text: '添加',
            cls: Ext.baseCSSPrefix + 'form-file-wrap',
            preventDefault: false,
            style: 'margin-left:3px',
			iconCls : 'add'
	});
	//创建相册窗口
	var win = Ext.create('Ext.window.Window', {
				title : 'Ext相册',
				width : 700,
				height : 400,
				iconCls : 'ablum',
				layout : 'fit',
				plain : false,
				items : [view],
				buttons : [{
							text : '上传', //上传按钮
							handler : upload,
							iconCls : 'upload'
						}, {
							text : '清空',
							handler : function() {
								store.removeAll();
							},
							iconCls : 'clear'
						},addButton],
				listeners : {
					afterrender : function(){
						addButton.el.createChild({
				            cls: Ext.baseCSSPrefix + 'form-file-input',
				            tag: 'input',
				            type: 'file',
				            style : 'width:100%',
				            size: 1
				        }).on('change', function(){
				        	add(this.dom.files[0]);
				        });
					}
				}
			});
	win.show();

	//给body添加事件，如果有拖拽的话提示用户拖拽到指定区域
	Ext.getBody().on('dragover', function(e) {
				ddtip.show();
			});
	//当用户拖拽离开时隐藏提示信息
	Ext.getBody().on('dragleave', function(e) {
				ddtip.hide();
			});
	//当用户拖拽到指定区域时，隐藏提示信息
	view.el.on('dragenter', function(e) {
				e.stopPropagation();
				e.preventDefault();
				ddtip.hide();
				view.el.highlight();
			});

	//当用户拖拽离开指定区域时显示提示信息
	view.el.on('dragleave', function(e) {
				e.stopPropagation();
				e.preventDefault();
				ddtip.show();
			});

	//很关键！！当用户拖拽文件并放下的时候触发时间
	view.el.dom.ondrop = function(e) {
		e.stopPropagation();
		e.preventDefault();
		ddtip.hide();//隐藏提示信息
		//处理用户拖拽过来的文件
		process(e.dataTransfer.files);
	};

	function add(file){
			//创建一个相片数据实例，保存名称，大小，类型，修改日期，文件等信息
			var photo = Ext.ModelManager.create({
						name : file.fileName,
						size : (file.fileSize / 1024).toFixed(1) + "KB",
						type : file.type,
						file : file,
						lastmod : file.lastModifiedDate
					}, PhotoModel);
			//添加到数据源中，这时候容易会发生相应的变化
			store.add(photo);
			Ext.get(view.getNode(photo)).down('div.thumb-loading-tip').show();
			Ext.get(view.getNode(photo)).down('img').hide();;
			//通过FileReader对象获取预览
			var reader = new FileReader();
			//当读取完成之后执行的回调
			reader.onload = (function(p) {
				return function() {
					//将获取到的Base64格式的图片数据，存放起来\
					p.data.src = this.result;
					view.refreshNode(store.indexOf(p));
					var img = Ext.get(view.getNode(p)).down('img');
					img.on('load', function(g) {
								return function() {
									Ext.get(view.getNode(g)).down('div.thumb-loading-tip').hide();
									var scale = 80 / this.getHeight();
									g.data.width = Math.round(this.getWidth()
											* scale);
									g.data.height = 80;
									g.data.trueWidth = this.getWidth();
									g.data.trueHeight = this.getHeight();
									this.setHeight(g.data.height);
									this.setWidth(g.data.width);
									this.setStyle({
												visibility : 'visible'
											});
								}
							}(p));
				}
			})(photo);//这个地方利用了JS的闭包原理
			//读取图片
			reader.readAsDataURL(file);
	}
	
	function process(files) {
		for (var i = 0; i < files.length; i++) {
			var file = files[i];//这个一个File对象
			add(file);
		}
	}
	
	function upload(){ //执行上传
		store.each(function(photo){//遍历数据源的数据
			var progress = Ext.get(view.getNode(photo)).down('div.upload-progress');//显示进度信息
			progress.show();
			var xhr = new XMLHttpRequest(); //初始化XMLHttpRequest
			xhr.open('post', 'upload', true);
			xhr.upload.onprogress = function(p) { //添加数据上传进度，获取实时的上传进度
				return function(e) {
					if (e.lengthComputable) {
						var percentage = Math.round((e.loaded * 100) / e.total);
						progress.update(percentage + "%");
					}
				}
			}(progress);
			xhr.upload.onload = function(p) { //当上传完之后执行的回调函数
				return function(e) {
					progress.update("上传成功!");
				}
			}(progress);
			var fd = new FormData(); //这里很关键，初始化一个FormData，并将File文件发送到后台
			fd.append("file", photo.data.file);
			xhr.send(fd);
		});
	}
});

/*;*/