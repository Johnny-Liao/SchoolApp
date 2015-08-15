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
						{name : 'height'},
						{name : 'trueWidth'},
						{name : 'trueHeight'}]
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
						'<div class="thumb-upload-progress">0%</div><div class="thumb-loading-tip">���ڼ���...</div>',
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
															.get('size'),record
															.get('trueWidth') + "��" + record
															.get('trueHeight'),
													Ext.Date.format(
															record.get('lastmod'),
															'Y��m��d�� Hʱi��')));
										 
									}
								}
							});
					}
				}
			});

	var addButton = Ext.create('Ext.button.Button',{
            text: '���',
            cls: Ext.baseCSSPrefix + 'form-file-wrap',
            preventDefault: false,
            style: 'margin-left:3px',
			iconCls : 'add'
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

	function add(file){
			//����һ����Ƭ����ʵ�����������ƣ���С�����ͣ��޸����ڣ��ļ�����Ϣ
			var photo = Ext.ModelManager.create({
						name : file.fileName,
						size : (file.fileSize / 1024).toFixed(1) + "KB",
						type : file.type,
						file : file,
						lastmod : file.lastModifiedDate
					}, PhotoModel);
			//��ӵ�����Դ�У���ʱ�����׻ᷢ����Ӧ�ı仯
			store.add(photo);
			Ext.get(view.getNode(photo)).down('div.thumb-loading-tip').show();
			Ext.get(view.getNode(photo)).down('img').hide();;
			//ͨ��FileReader�����ȡԤ��
			var reader = new FileReader();
			//����ȡ���֮��ִ�еĻص�
			reader.onload = (function(p) {
				return function() {
					//����ȡ����Base64��ʽ��ͼƬ���ݣ��������\
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