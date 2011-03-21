function show_kindeditor(id){
	if (id=="kindeditor"){
		KE.show({
		    id : 'kindeditor',
		    allowFileManager : false,
				allowUpload: true,
		    imageUploadJson:'/kindeditor/upload',
				width : "690px",
				filterMode : true,
				resizeMode: 1,
				items:['source', '|', 'undo', 'redo',
				'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
				'superscript', 
				'title', 'textcolor', 'bold',
				'italic', 'underline', 'strikethrough', 'removeformat', '|', 'table', 'image',  'flash', 'media', 'hr', 'emoticons', 'link', 'unlink']
		});
	};
	if (id=="kindeditor_s"){
		KE.show({
		    id : 'kindeditor_s',
		    allowFileManager : false,
				allowUpload: false,
				width : "690px",
				filterMode : true,
				resizeMode: 1,
				items:['insertorderedlist', 'insertunorderedlist', '|', 'justifyleft', 'justifycenter']
		});
	};
	if (id=="kindeditor_b"){
		KE.show({
		    id : 'kindeditor_b',
		    allowFileManager : true,
				allowUpload: true,
				width : "690px",
		    imageUploadJson:'/kindeditor/upload',
				filterMode : true,
				resizeMode: 1,
				items:['source', '|', 'undo', 'redo', 'cut', 'copy', 'paste',
				'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
				'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
				'superscript', '|', 'selectall', '-',
				'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
				'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
				'flash', 'media', 'table', 'hr', 'emoticons', 'link', 'unlink']
		});
	};
	if (id=="kindeditor_full"){
		KE.show({
		    id : 'kindeditor',
		    allowFileManager : false,
				allowUpload: true,
		    imageUploadJson:'/kindeditor/upload',
				width : "450px",
				filterMode : true,
				resizeMode: 1,
				items:['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
				'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
				'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
				'superscript', '|', 'selectall', '-',
				'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',
				'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
				'flash', 'media', 'table', 'hr', 'emoticons', 'link', 'unlink']
		});
	};
}
