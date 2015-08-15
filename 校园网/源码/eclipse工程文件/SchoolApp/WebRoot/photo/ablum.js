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
				resizable : {
					handles : 'all',
					minWidth : 720,
					minHeight : 480,
					pinned : true,
					transparent:true
				},
				wrapWidth : 720,
				wrapHeight : 480,
				floating : true,
				constrain : true,
				hidden : true,
				maximized : false,
				cls : 'thumb-viewer',
				html : '<div class="thumb-viewer-title">' +
							'<div class="thumb-viewer-title-text"></div>' +
							'<div class="thumb-viewer-title-tools">' +
								'<div class="thumb-viewer-close-item"></div>' +
							'</div>' +
						'</div>' +
					   '<div class="thumb-viewer-wrap">' +
								'<img />' +
						'</div>' +
					    '<div class="thumb-viewer-info">' +
							'</div>' +
						'<div class="thumb-viewer-toolbar"></div>',
				listeners : {
					show : function() {
						photoViewer.navPrevBtn.setDisabled(photoViewer.viewIndex == 0);
						photoViewer.navNextBtn
								.setDisabled(photoViewer.viewIndex == store.getCount()
										- 1);
						Ext.getBody().mask();
						win.hide();
					},
					hide : function(){
						Ext.getBody().unmask();
						win.show();
					},
					resize : function(){
						photoViewer.wrapWidth = photoViewer.el.getWidth() - 200 - 2;
						photoViewer.wrapHeight = photoViewer.el.getHeight() - 88;
						photoViewer.el.down('div.thumb-viewer-wrap').setStyle({
							width : photoViewer.wrapWidth,
							height : photoViewer.wrapHeight
						});
						photoViewer.el.down('div.thumb-viewer-info').setStyle({
							height : photoViewer.wrapHeight
						});
						var img = photoViewer.el.down('img');
						positionImage(store.getAt(photoViewer.viewIndex),null,null,false,true);
						if(photoViewer.toolbar){
							photoViewer.toolbar.el.setWidth(photoViewer.el.getWidth());
							photoViewer.toolbar.doLayout();
						}
					},
					afterrender : function(c) {
						c.el.down('div.thumb-viewer-close-item').on('click',function(){
							photoViewer.hide();
						});
						c.el.on('click', function() {
									c.toFront();
								});
						c.el.down('div.thumb-viewer-title').on('dblclick',function(){
							if(photoViewer.maximized === true){
								 photoViewer.el.setStyle(photoViewer.state.position);
								 photoViewer.setSize(photoViewer.state.size);
								 photoViewer.maximized = false;
								 delete photoViewer.state;
							}else{
								var parent = c.el.parent();
								photoViewer.state = {
									position : {
										left : photoViewer.el.getLeft(),
										top : photoViewer.el.getTop()
									},
									size : {
										width : photoViewer.el.getWidth(),
										height : photoViewer.el.getHeight()
									}
								}
								photoViewer.setSize({
									width : parent.getWidth(),
									height : parent.getHeight()
								});
								photoViewer.el.setStyle({
									left : 0,
									top : 0
								});
								photoViewer.maximized = true;
							}
						});
						photoViewer.toolbar = Ext.create('Ext.container.Container',{
							renderTo : c.el.down('div.thumb-viewer-toolbar'),
							layout: {
                                        type: 'hbox',
                                        pack:'center',
                                        align:'middle'
                                    }
						});
						
						photoViewer.navPrevBtn = Ext.create('Ext.Component', {
									cls : 'toolbar-item toolbar-nav toolbar-nav-prev',
									overCls : 'toolbar-nav-over',
									title : '��һ��',
									html : '<img  />',
									listeners : {
										render : function(){
											this.el.addClsOnClick('toolbar-nav-prev-click');
											this.el.on('click',function(){
												viewPhoto(store.getAt(photoViewer.viewIndex - 1));
											});
										}
									}
								});
						photoViewer.toolbar.add(photoViewer.navPrevBtn);

						photoViewer.zoomInBtn = Ext.create('Ext.Component', {
									cls : 'toolbar-item toolbar-item-zoom-in',
									overCls : 'toolbar-item-over',
									title : '�Ŵ�',
									html : '<img  />',
									listeners : {
										render : function(){
											this.el.addClsOnClick('toolbar-item-zoom-in-click');
											this.el.on('click',zoomIn);
										}
									}
								});
						photoViewer.toolbar.add(photoViewer.zoomInBtn);

						photoViewer.zoomOutBtn = Ext.create('Ext.Component', {
									cls : 'toolbar-item toolbar-item-zoom-out',
									overCls : 'toolbar-item-over',
									title : '��С',
									html : '<img  />',
									listeners : {
										render : function(){
											this.el.addClsOnClick('toolbar-item-zoom-out-click');
											this.el.on('click',zoomOut);
										}
									}
								});
						photoViewer.toolbar.add(photoViewer.zoomOutBtn);
						photoViewer.rotateLeftBtn = Ext.create('Ext.Component', {
									cls : 'toolbar-item toolbar-item-rotate-left',
									overCls : 'toolbar-item-over',
									title : '��ת',
									html : '<img  />',
									listeners : {
										render : function(){
											this.el.addClsOnClick('toolbar-item-rotate-left-click');
											this.el.on('click',function(){
												photoViewer.rotated = true;
												if(photoViewer.rotate){
													photoViewer.rotate = photoViewer.rotate > 0 ? photoViewer.rotate - 90 : photoViewer.rotate + 90;
												}else{
													photoViewer.rotate = -270;
												}
												photoViewer.el.down('img').setStyle({
													'-webkit-transform': 'rotate('+photoViewer.rotate+'deg)',
													'ease-in-out' : '0.2s'
												});
												positionImage(store.getAt(photoViewer.viewIndex),null,null,false,true);
											});
										}
									}
								});
						photoViewer.toolbar.add(photoViewer.rotateLeftBtn);
						photoViewer.rotateRighttBtn = Ext.create('Ext.Component', {
									cls : 'toolbar-item toolbar-item-rotate-right',
									overCls : 'toolbar-item-over',
									title : '��ת',
									html : '<img  />',
									listeners : {
										render : function(){
											this.el.addClsOnClick('toolbar-item-rotate-right-click');
											this.el.on('click',function(){
												photoViewer.rotated = true;
												if(photoViewer.rotate){
													photoViewer.rotate = photoViewer.rotate > 0 ? photoViewer.rotate + 90 : photoViewer.rotate - 90;
												}else{
													photoViewer.rotate = 90;
												}
												photoViewer.el.down('img').setStyle({
													'-webkit-transform': 'rotate('+photoViewer.rotate+'deg)',
													'ease-in-out' : '0.2s'
												});
												positionImage(store.getAt(photoViewer.viewIndex),null,null,false,true);
											});
										}
									}
								});
						photoViewer.toolbar.add(photoViewer.rotateRighttBtn);
						photoViewer.navNextBtn = Ext.create('Ext.Component', {
									cls : 'toolbar-item toolbar-nav toolbar-nav-next',
									overCls : 'toolbar-nav-over',
									title : '��һ��',
									html : '<img  />',
									listeners : {
										render : function(){
											this.el.addClsOnClick('toolbar-nav-next-click');
											this.el.on('click',function(){
												viewPhoto(store.getAt(photoViewer.viewIndex + 1));
											});
										}
									}
								});
						photoViewer.toolbar.add(photoViewer.navNextBtn);
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
		text : '�����',
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
			text : '�ϴ�',
			iconCls : 'upload',
			handler : uploadSelected
		},{
			text : 'ɾ��',
			iconCls : 'delete',
			handler : deleteSelected
		}]
	});
	
	//����ͼƬ����ģ�� ������Դ��Ҫ
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
						{name : 'uploaded'},
						{name : 'absolute'},
						{name : 'top'},
						{name : 'left'}
						]
			});

	//��������Դ
	var store = Ext.create("Ext.data.Store", {
				model : PhotoModel
			});

	var ddtip;
	
	//ͼƬ��ʾģ��
	var tiptpl = '��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ƣ�{0}<br/>' +
			  '��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ͣ�{1}<br/>' +
			 '��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;С��{2}<br/>' + 
			 '��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�磺{3}<br/>' + 
			 '�޸�ʱ�䣺{4}<br/>'
	
	//����ͼƬ��ŵ�����
	var view = Ext.create('Ext.view.View', {
				store : store, //ָ������Դ
				tpl : [ //����չʾģ��
						'<tpl for=".">',
						'<div class="thumb-wrap" id="{name}">',
						'<div class="thumb-upload-progress">0%</div>' ,
						'<tpl if="loaded === false">' +
							'<div class="thumb-loading-tip" >���ڼ���</div>' +
						'</tpl>',
						'<div class="thumb">' +
							'<tpl if="absolute === true">' +
							'<img src="{src}" height="{height}" width="{width}" style="position:absolute;top:{top};left:{left}">' +
							'</tpl>' +
							'<tpl if="absolute === false">' +
								'<img src="{src}" height="{height}" width="{width}">' +
							'</tpl>' +
						'</div>',
						'<span>{name}</span></div>', '</tpl>',
						'<div class="x-clear"></div>'],
				style : {
					backgroundColor : '#FFFFFF',
					fontFamily : '΢���ź�'
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
						//�����û���ק��ʾ
						view.emptyText = '<div class="thumb-empty-text" style="line-height:'+win.body.getHeight()+'px;">' +
								'<img src="ext4/resources/themes/images/default/shared/icon-info.gif" />&nbsp;&nbsp;&nbsp;û����ʾ����Ƭ</div>',
						ddtip = view.el.createChild({
									tag : 'div',
									cls : 'dd-tip',
									html : '�뽫ͼƬ�϶�������'
								});
						//������Ƭ������ʾ
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
															.get('trueWidth') + "��" + record
															.get('trueHeight'),
													Ext.Date.format(
															record.get('lastmod'),
															'Y��m��d�� Hʱi��')));
										 
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
            text: '���',
            cls: Ext.baseCSSPrefix + 'form-file-wrap',
            preventDefault: false,
            style: 'margin-left:3px',
			iconCls : 'add'
	});
	var delBtn = Ext.create('Ext.button.Button', {
				text : 'ɾ��',
				handler : deleteSelected,
				iconCls : 'delete',
				disabled : true
			});
	
	// ������ᴰ��
	var win = Ext.create('Ext.window.Window', {
				title : 'Ext���',
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
							text : '�ϴ�', //�ϴ���ť
							iconCls : 'upload',
							menu : [{
								text : '�ϴ�������',
								handler : uploadAll
							},{
								text : '�ϴ�ѡ����',
								handler : uploadSelected
							}]
						}, {
							text : '���',
							handler : deleteAll,
							iconCls : 'clear'
						},addBtn,delBtn,{
							text : 'ˢ��',
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
				        //��body����¼����������ק�Ļ���ʾ�û���ק��ָ������
						Ext.getBody().on('dragover', function(e) {
									ddtip.show();
								});
						//���û���ק�뿪ʱ������ʾ��Ϣ
						Ext.getBody().on('dragleave', function(e) {
									ddtip.hide();
								});
						//���û���ק��ָ������ʱ��������ʾ��Ϣ
						view.el.on('dragenter', function(e) {
									e.stopPropagation();
									e.preventDefault();
									ddtip.hide();
									view.el.highlight();
								});
					
						//���û���ק�뿪ָ������ʱ��ʾ��ʾ��Ϣ
						view.el.on('dragleave', function(e) {
									e.stopPropagation();
									e.preventDefault();
									ddtip.show();
								});
					
						//�ܹؼ��������û���ק�ļ������µ�ʱ�򴥷�ʱ��
						/*view.el.dom.ondrop = function(e) {
							e.stopPropagation();
							e.preventDefault();
							ddtip.hide();//������ʾ��Ϣ
							//�����û���ק�������ļ�
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
						showBtn.setText('�����');
					},
					show : function(){
						showBtn.setText('�������');
					}
				}
			});

	function add(file){
		console.log(file);
			//����һ����Ƭ����ʵ�����������ƣ���С�����ͣ��޸����ڣ��ļ�����Ϣ
			var photo = Ext.ModelManager.create({
						name : file.name,
						size : (file.size / 1024).toFixed(1) + "KB",
						type : file.type,
						file : file,
						lastmod : file.lastModifiedDate || new Date(),
						loaded : false,
						absolute : false
					}, PhotoModel);
			//��ӵ�����Դ�У���ʱ�����׻ᷢ����Ӧ�ı仯
			store.add(photo);
			//ͨ��FileReader�����ȡԤ��
			var reader = new FileReader();
			//����ȡ���֮��ִ�еĻص�
			reader.onload = (function(p) {
				return function() {
					//����ȡ����Base64��ʽ��ͼƬ���ݣ��������
					p.data.src = this.result;
					var img = Ext.get(view.getNode(p)).down('img');
					img.dom.src = p.data.src;
					img.on('load', function(g,l) {
								return function() {
									var scale = 80 / this.getHeight();
									var width = this.getWidth();
									var height = this.getHeight();
									if(width > 120){
										var scale = 120 / width;
										width = 120;
										height = height * scale;
									}
									if(height > 80){
										var scale = 80 / height;
										height = 80;
										width = width * scale;
									}
									
									Ext.apply(g.data,{
										width : width,
										height : height,
										trueWidth : this.getWidth(),
										trueHeight : this.getHeight(),
										loaded : true
									});
									if(this.getWidth() < 80 && this.getHeight() < 120){
										this.setWidth(g.data.trueWidth);
										this.setHeight(g.data.trueHeight);
										var top = (80 - g.data.trueHeight) / 2;
										var left = (120 - g.data.trueWidth) / 2;
										Ext.apply(g.data,{
											absolute : true,
											top : top,
											left : left
										});
										this.setStyle({
											position : 'absolute',
											top : top,
											left : left
										});
									}else{
										this.setWidth(g.data.width);
										this.setHeight(g.data.height);
									}
									Ext.get(view.getNode(g)).down('div.thumb-loading-tip').hide();
								}
							}(p));
					img.on('error',function(g){
						return function(){
							Ext.get(this).hide();
							Ext.get(view.getNode(g)).down('div.thumb-loading-tip').update('����ͼƬʧ��');
						}
					}(p));
				}
			})(photo);//����ط�������JS�ıհ�ԭ��
			//��ȡͼƬ
			reader.readAsDataURL(file);
	}
	
	function process(files) {
		for (var i = 0; i < files.length; i++) {
			var file = files[i];//���һ��File����
			add(file);
		}
	}
	
	function deleteSelected(){
		store.remove(view.selModel.getSelection());
	}
	
	function deleteAll(){
		store.removeAll();
	}
	
	function uploadAll(){ //ִ���ϴ�
		store.each(function(photo){//��������Դ������
			uploadPhoto(photo);
		});
	}
	
	function uploadSelected(){ //ִ���ϴ�
		Ext.each(view.selModel.getSelection(),function(photo){//��������Դ������
			uploadPhoto(photo);
		});
	}
	
	function uploadPhoto(photo){
		if (!photo.data.uploaded) {
			var progress = Ext.get(view.getNode(photo))
					.down('div.thumb-upload-progress');// ��ʾ������Ϣ
			progress.show();
			var xhr = new XMLHttpRequest(); // ��ʼ��XMLHttpRequest
			xhr.open('post', 'upload', true);
			xhr.upload.onprogress = function(p) { // ��������ϴ����ȣ���ȡʵʱ���ϴ�����
				return function(e) {
					if (e.lengthComputable) {
						var percentage = Math.round((e.loaded * 100) / e.total);
						p.update(percentage + "%");
					}
				}
			}(progress);
			xhr.upload.onload = function(p) { // ���ϴ���֮��ִ�еĻص�����
				return function(e) {
					progress.update("�ϴ��ɹ�!");
					photo.data.uploaded = true;
				}
			}(progress);
			var fd = new FormData(); // ����ܹؼ�����ʼ��һ��FormData������File�ļ����͵���̨
			fd.append("file", photo.data.file);
			xhr.send(fd);
		}
	}
	
	function viewPhoto(photo) {
		if (photo) {
			clearRotate();
			photoViewer.viewIndex = store.indexOf(photo);
			if (photoViewer.navNextBtn) {
				photoViewer.navPrevBtn.setDisabled(photoViewer.viewIndex == 0);
				photoViewer.navNextBtn
						.setDisabled(photoViewer.viewIndex == store.getCount()
								- 1);
			}
			photoViewer.show();
			var img = photoViewer.el.down('img');
			img.dom.src = photo.data.src;
			positionImage(photo);
			var body = Ext.getBody();
			var title = photoViewer.el.down('div.thumb-viewer-title-text');
			title.update("�鿴��Ƭ��" + photo.data.name);
			var info = photoViewer.el.down('div.thumb-viewer-info');
			info.update('<h1>�ļ���Ϣ:</h1><p>' + Ext.String.format(tiptpl, photo.get('name'), photo
							.get('type'), photo.get('size'), photo.get('trueWidth')
							+ "��" + photo.get('trueHeight'), Ext.Date.format(
							photo.get('lastmod'), 'Y��m��d�� Hʱi��'))+'</p>');
		}
	}
	
	function zoomIn(){
		var img = photoViewer.el.down('img');
		var width = img.getWidth();
		var height = img.getHeight();
		width += width * 0.25;
		height += height * 0.25;
		positionImage(store.getAt(photoViewer.viewIndex),width,height,true)
	}
	
	function zoomOut(){
		var img = photoViewer.el.down('img');
		var width = img.getWidth();
		var height = img.getHeight();
		width -= width * 0.25;
		height -= height * 0.25;
		positionImage(store.getAt(photoViewer.viewIndex),width,height,true)
	}
	
	function clearRotate() {
		if (photoViewer.rotated === true) {
			photoViewer.el.down('img').setStyle({
						'-webkit-transform' : 'none'
					});
			delete photoViewer.rotate;
		}
	}
	
	function isRotate() {
		var rotate = photoViewer.rotate;
		return ((rotate == 90 || rotate == 270 || rotate == -90
				|| rotate == -270) && photoViewer.rotated === true);
	}
	
	function positionImage(photo,width,height,fit,notClearRotate){
		width = width || (!isRotate() ? photo.data.trueWidth : photo.data.trueHeight);
		height = height || (!isRotate() ? photo.data.trueHeight : photo.data.trueWidth);
		var wrapWidth = photoViewer.wrapWidth,wrapHeight = photoViewer.wrapHeight;
		if (!fit) {
			if (height > wrapHeight) {
				var scale = wrapHeight / height;
				height = wrapHeight;
				width = width * scale;
			}
			
			if (width > wrapWidth) {
				var scale = wrapWidth / width;
				width = wrapWidth;
				height = height * scale;
			}
		}
		var img = photoViewer.el.down('img');
		var wrap = photoViewer.el.down('div.thumb-viewer-wrap');
		img.setStyle({
					width : width,
					height : height
				});
		if (width <= wrapWidth) {
			img.setStyle({
						marginLeft : (wrapWidth - width) / 2
					});
		} else {
			img.setStyle({
						marginLeft : 0
					});
			wrap.dom.scrollLeft = wrap.dom.scrollWidth;
			wrap.dom.scrollLeft = (wrap.dom.scrollLeft / 2);
		}
		if (height <= wrapHeight) {
			img.setStyle({
						marginTop : (wrapHeight - height) / 2
					});
		} else {
			img.setStyle({
						marginTop : 0
					});
			wrap.dom.scrollTop = wrap.dom.scrollHeight;
			wrap.dom.scrollTop = (wrap.dom.scrollTop / 2);
		} 
	}
});

/*;*/