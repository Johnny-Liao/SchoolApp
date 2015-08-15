Ext.onReady(function() {
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
						{name : 'height'}]
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
			 '�޸�ʱ�䣺{3}<br/>'
	
	//����ͼƬ��ŵ�����
	var view = Ext.create('Ext.view.View', {
				store : store, //ָ������Դ
				tpl : [ //����չʾģ��
						'<tpl for=".">',
						'<div class="thumb-wrap" id="{name}">',
						'<div class="upload-progress">0%</div>',
						'<div class="thumb"><img src="{src}" height="{height}" width="{width}"></div>',
						'<span>{name}</span></div>', '</tpl>',
						'<div class="x-clear"></div>'],
				style : {
					backgroundColor : '#FFFFFF',
					fontFamily : '΢���ź�'
				},
				multiSelect : true,
				trackOver : true,
				overItemCls : 'x-item-over',
				itemSelector : 'div.thumb-wrap',
				emptyText : 'û����ʾ����Ƭ',
				autoScroll : true,
				listeners : {
					'afterrender' : function() {
						//�����û���ק��ʾ
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
															.get('size'),
													Ext.Date.format(
															record.get('lastmod'),
															'Y��m��d�� Hʱi��')));
										 
									}
								}
							});
					}
				}
			});

	//������ᴰ��
	var win = Ext.create('Ext.window.Window', {
				title : 'Ext���',
				width : 700,
				height : 400,
				iconCls : 'ablum',
				layout : 'fit',
				plain : false,
				items : [view],
				buttons : [{
							text : '�ϴ�', //�ϴ���ť
							handler : upload,
							iconCls : 'upload'
						}, {
							text : '���',
							handler : function() {
								store.removeAll();
							},
							iconCls : 'clear'
						}]
			});
	win.show();

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
	view.el.dom.ondrop = function(e) {
		e.stopPropagation();
		e.preventDefault();
		ddtip.hide();//������ʾ��Ϣ
		//�����û���ק�������ļ�
		process(e.dataTransfer.files);
	};

	function process(files) {
		var count = 0;
		for (var i = 0; i < files.length; i++) {
			var file = files[i];//���һ��File����
			//����һ����Ƭ����ʵ�����������ƣ���С�����ͣ��޸����ڣ��ļ�����Ϣ
			var photo = Ext.ModelManager.create({
						name : file.fileName,
						size : (file.fileSize / 1024).toFixed(1) + "KB",
						type : file.type,
						file : file,
						lastmod : file.lastModifiedDate
					}, PhotoModel);
			//ͨ��FileReader�����ȡԤ��
			var reader = new FileReader();
			//����ȡ���֮��ִ�еĻص�
			reader.onload = (function(p) {
				return function() {
					//����ȡ����Base64��ʽ��ͼƬ���ݣ��������\
					p.data.src = this.result;
					var tmpImage = Ext.getBody().createChild({
						tag : 'img',
						style : 'position:absolute;	visibility: hidden;'
					});
					tmpImage.dom.src = this.result;
					tmpImage.on('load', (function(g) {
								return function() {
									count++;
									var scale = 80 / this.getHeight() ;
									g.data.width = Math.round(this.getWidth() * scale);
									g.data.height = 80;
									this.remove();
									//��ӵ�����Դ�У���ʱ�����׻ᷢ����Ӧ�ı仯
									store.add(g);
									if (count == files.length) {
										//������ͼƬ����������֮����ȾͼƬ
										view.refresh();
									}
								}
							})(p));
				}
			})(photo);//����ط�������JS�ıհ�ԭ��
			//��ȡͼƬ
			reader.readAsDataURL(file);
		}
	}
	
	function upload(){ //ִ���ϴ�
		store.each(function(photo){//��������Դ������
			var progress = Ext.get(view.getNode(photo)).down('div.upload-progress');//��ʾ������Ϣ
			progress.show();
			var xhr = new XMLHttpRequest(); //��ʼ��XMLHttpRequest
			xhr.open('post', 'upload', true);
			xhr.upload.onprogress = function(p) { //��������ϴ����ȣ���ȡʵʱ���ϴ�����
				return function(e) {
					if (e.lengthComputable) {
						var percentage = Math.round((e.loaded * 100) / e.total);
						progress.update(percentage + "%");
					}
				}
			}(progress);
			xhr.upload.onload = function(p) { //���ϴ���֮��ִ�еĻص�����
				return function(e) {
					progress.update("�ϴ��ɹ�!");
				}
			}(progress);
			var fd = new FormData(); //����ܹؼ�����ʼ��һ��FormData������File�ļ����͵���̨
			fd.append("file", photo.data.file);
			xhr.send(fd);
		});
	}
});

/*;*/