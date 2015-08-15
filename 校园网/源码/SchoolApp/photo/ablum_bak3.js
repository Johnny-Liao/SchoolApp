Ext.Loader.setConfig({enabled: true});

Ext.Loader.setPath('Ext.ux.DataView', 'ext4/ux/DataView/');

Ext.require([
    'Ext.ux.DataView.DragSelector'
]);

Ext.onReady(function() {
	
	var photoViewer = Ext.create('Ext.Component', {
				draggable : {
					delegate : 'div.thumb-viewer-title'
				},
				floating : true,
				constrain : true,
				hidden : true,
				cls : 'thumb-viewer',
				html : '<div class="thumb-viewer-title"></div>' +
						'<img />' +
						'<div align="center"  class="thumb-viewer-toolbar">' +
						'<table width="100%">' +
							'<tr>' +
								'<td width="100%" height="100%" valign="middle" align="center">' +
									'<table><tr>' +
										'<td>' +
											'<div id="prve" class="toolbar-nav toolbar-nav-prev">' +
												'<img  />' +
											'</div>' +
										'</td>' + 
										'<td>' +
											'<div id="next" class="toolbar-item toolbar-item-zoom-in">' +
												'<img  />' +
											'</div>' +
										'</td>' +
										'<td>' +
											'<div id="next" class="toolbar-item toolbar-item-zoom-out">' +
												'<img  />' +
											'</div>' +
										'</td>' +
										'<td>' +
											'<div id="next" class="toolbar-item toolbar-item-rotate-left">' +
												'<img  />' +
											'</div>' +
										'</td>' +
										'<td>' +
											'<div id="next" class="toolbar-item toolbar-item-rotate-right">' +
												'<img  />' +
											'</div>' +
										'</td>' +
										'<td>' +
											'<div id="next" class="toolbar-nav toolbar-nav-next">' +
												'<img  />' +
											'</div>' +
										'</td>' +
									'</tr></table>' +
								'</td>' +
							'</tr>' +
						'</table></div>',
				listeners : {
					afterrender : function(c) {
						c.el.on('click', function() {
									c.toFront();
								});
						c.el.select('div.toolbar-nav').addClsOnOver('toolbar-nav-over');
						
						c.navPrevBtn = c.el.down('div.toolbar-nav-prev');
						c.navPrevBtn.addClsOnClick('toolbar-nav-prev-click');
						c.navPrevBtn.diableCls= 'toolbar-nav-prev-disable';
						bindClickEvent(c.navPrevBtn,function(){
							console.log(111);
						});
						c.navPrevBtn.disable();
						
						c.navNextBtn = c.el.down('div.toolbar-nav-next');
						c.navNextBtn.addClsOnClick('toolbar-nav-next-click');
						
						c.el.select('div.toolbar-item').addClsOnOver('toolbar-item-over');
						
						c.zoomInBtn = c.el.down('div.toolbar-item-zoom-in');
						c.zoomInBtn.addClsOnClick('toolbar-item-zoom-in-click');
						
						c.zoomOutBtn = c.el.down('div.toolbar-item-zoom-out')
						c.zoomOutBtn.addClsOnClick('toolbar-item-zoom-out-click');
						
						c.rotateLeftBtn = c.el.down('div.toolbar-item-rotate-left');
						c.rotateLeftBtn.addClsOnClick('toolbar-item-rotate-left-click');
						
						c.rotateRightBtn = c.el.down('div.toolbar-item-rotate-right');
						c.rotateRightBtn.addClsOnClick('toolbar-item-rotate-right-click');
					}
				}
			});
	
	function bindClickEvent(b,fn){
		b.on('click',fn);
		b.handler = fn;
		console.log(b);
		b.disable = function(){
			this.addCls(this.diableCls);
			this.mask();
		}
		b.enable = function(){
			this.removeCls(this.diableCls);
			this.unmask();
		}
	}
	
	var showBtn = Ext.create('Ext.button.Button',{
		renderTo : 'ablum_button',
		text : '显示相册',
		iconCls : 'photos',
		scale: 'large',
		handler : function(){
			if(win.isVisible()){
				win.hide();
			}else{
				win.show();
			}
		}
	});
	
	var menu = Ext.create('Ext.menu.Menu',{
		items : [{
			text : '上传',
			iconCls : 'upload',
			handler : uploadSelected
		},{
			text : '删除',
			iconCls : 'delete',
			handler : deleteSelected
		}]
	});
	
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
						{name : 'trueHeight'},
						{name : 'display'},
						{name : 'uploaded'}]
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
						'<div class="thumb-upload-progress">0%</div>' ,
						'<tpl if="loaded === false"><div class="thumb-loading-tip" >正在加载</div></tpl>',
						'<div class="thumb"><img src="{src}" height="{height}" width="{width}"></div>',
						'<span>{name}</span></div>', '</tpl>',
						'<div class="x-clear"></div>'],
				style : {
					backgroundColor : '#FFFFFF',
					fontFamily : '微软雅黑'
				},
				multiSelect : true,
				simpleSelect : true,
				trackOver : true,
				overItemCls : 'x-item-over',
				itemSelector : 'div.thumb-wrap',
				autoScroll : true,
				plugins : [Ext.create('Ext.ux.DataView.DragSelector', {})],
				listeners : {
					'afterrender' : function() {
						//创建用户拖拽提示
						view.emptyText = '<div class="thumb-empty-text" style="line-height:'+win.body.getHeight()+'px;">' +
								'<img src="ext4/resources/themes/images/default/shared/icon-info.gif" />&nbsp;&nbsp;&nbsp;没有显示的相片</div>',
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
					},
					selectionchange: function(dv, nodes ){
		                    var l = nodes.length;
		                    delBtn.setDisabled(l <= 0);
		            },
		            itemcontextmenu : function(dataView, record, item, index, e){
		            		view.getSelectionModel().select(record);
	            			e.stopEvent();
							menu.showAt(e.getXY());
							menu.doConstrain();
		            },
		            itemdblclick : function(dataView, record, item, index, e){
		            	viewPhoto(record);
		            }
				}
			});

	var addBtn = Ext.create('Ext.button.Button',{
            text: '添加',
            cls: Ext.baseCSSPrefix + 'form-file-wrap',
            preventDefault: false,
            style: 'margin-left:3px',
			iconCls : 'add'
	});
	var delBtn = Ext.create('Ext.button.Button', {
				text : '删除',
				handler : deleteSelected,
				iconCls : 'delete',
				disabled : true
			});
	
	// 创建相册窗口
	var win = Ext.create('Ext.window.Window', {
				title : 'Ext相册',
				width : 700,
				height : 400,
				iconCls : 'ablum',
				layout : 'fit',
				closable: true,
				animateTarget : showBtn.el,
                closeAction: 'hide',
				plain : false,
				maximizable : true,
				minimizable  : true,
				items : [view],
				buttons : [{
							text : '上传', //上传按钮
							iconCls : 'upload',
							menu : [{
								text : '上传所有项',
								handler : uploadAll
							},{
								text : '上传选中项',
								handler : uploadSelected
							}]
						}, {
							text : '清空',
							handler : deleteAll,
							iconCls : 'clear'
						},addBtn,delBtn,{
							text : '刷新',
							handler : function(){
								view.refresh();
							},
							iconCls : 'refresh'
						}],
				listeners : {
					afterrender : function(){
						addBtn.el.createChild({
				            cls: Ext.baseCSSPrefix + 'form-file-input',
				            tag: 'input',
				            type: 'file',
				            style : 'width:100%',
				            size: 1
				        }).on('change', function(){
				        	add(this.dom.files[0]);
				        });
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
						/*view.el.dom.ondrop = function(e) {
							e.stopPropagation();
							e.preventDefault();
							ddtip.hide();//隐藏提示信息
							//处理用户拖拽过来的文件
							process(e.dataTransfer.files);
						};*/
						view.el.dom.addEventListener("drop", function(e) {
								e.stopPropagation();
								e.preventDefault();
								ddtip.hide();
								process(e.dataTransfer.files);
							}, false);
					},
					minimize : function(){
						win.minimized = true;
						win.hide();
					},
					hide : function(){
						showBtn.setText('显示相册');
					},
					show : function(){
						showBtn.setText('隐藏相册');
					}
				}
			});

	function add(file){
			//创建一个相片数据实例，保存名称，大小，类型，修改日期，文件等信息
			var photo = Ext.ModelManager.create({
						name : file.fileName,
						size : (file.fileSize / 1024).toFixed(1) + "KB",
						type : file.type,
						file : file,
						lastmod : file.lastModifiedDate || new Date(),
						loaded : false
					}, PhotoModel);
			//添加到数据源中，这时候容易会发生相应的变化
			store.add(photo);
			//通过FileReader对象获取预览
			var reader = new FileReader();
			//当读取完成之后执行的回调
			reader.onload = (function(p) {
				return function() {
					//将获取到的Base64格式的图片数据，存放起来
					p.data.src = this.result;
					var img = Ext.get(view.getNode(p)).down('img');
					img.dom.src = p.data.src;
					img.on('load', function(g,l) {
								return function() {
									var scale = 80 / this.getHeight();
									Ext.apply(g.data,{
										width : this.getHeight() > 80 ? Math.round(this.getWidth()
											* scale) : this.getWidth(),
										height : this.getHeight() > 80 ? 80 : this.getHeight(),
										trueWidth : this.getWidth(),
										trueHeight : this.getHeight(),
										loaded : true
									});
									this.setWidth(g.data.width);
									this.setHeight(g.data.height);
									Ext.get(view.getNode(g)).down('div.thumb-loading-tip').hide();
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
	
	function deleteSelected(){
		store.remove(view.selModel.getSelection());
	}
	
	function deleteAll(){
		store.removeAll();
	}
	
	function uploadAll(){ //执行上传
		store.each(function(photo){//遍历数据源的数据
			uploadPhoto(photo);
		});
	}
	
	function uploadSelected(){ //执行上传
		Ext.each(view.selModel.getSelection(),function(photo){//遍历数据源的数据
			uploadPhoto(photo);
		});
	}
	
	function uploadPhoto(photo){
		if (!photo.data.uploaded) {
			var progress = Ext.get(view.getNode(photo))
					.down('div.thumb-upload-progress');// 显示进度信息
			progress.show();
			var xhr = new XMLHttpRequest(); // 初始化XMLHttpRequest
			xhr.open('post', 'upload', true);
			xhr.upload.onprogress = function(p) { // 添加数据上传进度，获取实时的上传进度
				return function(e) {
					if (e.lengthComputable) {
						var percentage = Math.round((e.loaded * 100) / e.total);
						p.update(percentage + "%");
					}
				}
			}(progress);
			xhr.upload.onload = function(p) { // 当上传完之后执行的回调函数
				return function(e) {
					progress.update("上传成功!");
					photo.data.uploaded = true;
				}
			}(progress);
			var fd = new FormData(); // 这里很关键，初始化一个FormData，并将File文件发送到后台
			fd.append("file", photo.data.file);
			xhr.send(fd);
		}
	}
	
	function viewPhoto(photo) {
		var body = Ext.getBody(), width = photo.data.trueWidth, height = photo.data.trueHeight;
		if(height > 480){
			var scale = 480 / height;
			height = 480;
			width = width * scale;
		}
		
		if(width > 720){
			var scale = 720 / width;
			width = 720;
			height = height * scale;
		}
		
		var top = (body.getHeight() - height) / 2;
		var left = (body.getWidth() - width) / 2;
		body.mask();
		photoViewer.show();
		var img = photoViewer.el.down('img').dom;
		img.src = photo.data.src;
		img.width = width;
		img.height = height;
		var title = photoViewer.el.down('div.thumb-viewer-title');
		title.update("查看相片：" +photo.data.name);
		photoViewer.el.setStyle({
			top : top ,
			left : left
		});
	}
});

/*;*/