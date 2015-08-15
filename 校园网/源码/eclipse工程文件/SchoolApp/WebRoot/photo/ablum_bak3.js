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
		text : '��ʾ���',
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
						{name : 'uploaded'}]
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
						'<tpl if="loaded === false"><div class="thumb-loading-tip" >���ڼ���</div></tpl>',
						'<div class="thumb"><img src="{src}" height="{height}" width="{width}"></div>',
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
						showBtn.setText('��ʾ���');
					},
					show : function(){
						showBtn.setText('�������');
					}
				}
			});

	function add(file){
			//����һ����Ƭ����ʵ�����������ƣ���С�����ͣ��޸����ڣ��ļ�����Ϣ
			var photo = Ext.ModelManager.create({
						name : file.fileName,
						size : (file.fileSize / 1024).toFixed(1) + "KB",
						type : file.type,
						file : file,
						lastmod : file.lastModifiedDate || new Date(),
						loaded : false
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
		title.update("�鿴��Ƭ��" +photo.data.name);
		photoViewer.el.setStyle({
			top : top ,
			left : left
		});
	}
});

/*;*/