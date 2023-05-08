
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/super-build/ckeditor.js"></script>
<style>
	#preview_img1,
	#preview_img2,
	#preview_img3,
	#preview_img4,
	#preview_img5,
	#preview_img6{
	width: 30%;
	margin-left: 5px;
	margin-bottom: 3px;
	}
	#rec1,
	#rec2,
	#rec3,
	#rec4,
	#rec5,
	#rec6{
	margin:5px 0;
	}
	#menu_img1,
	#menu_img2,
	#menu_img3,
	#menu_img4,
	#menu_img5,
	#menu_img6	{
	  display: none;
	  visibility:hidden
	}
	input[type=file]::file-selector-button {
	  width: 100px;
	  height: 30px;
	  background: #lightgray;
	  border: 1px solid rgb(77,77,77);
	  border-radius: 10px;
	  cursor: pointer;
	  &:hover {
	    background: rgb(77,77,77);
	    color: #fff;
	  }
	}
	.btn-upload {
	margin-right:100px;
	margin-left:110%;
	  width: 250px;
	  height: 200px;
	  background: #fff;
	  border: 1px solid rgb(77,77,77);
	  border-radius: 10px;
	  font-weight: 500;
	  cursor: pointer;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  &:hover {
	    background: rgb(77,77,77);
	    color: #fff;
	  }
	}
	
	#file {
	  display: none;
	}
	#menu_thumbnail	{
	  display: none;
	  visibility:hidden
	}
	
	#preview{
		width :300px;
		height :200px;
		float :right;
		border: none;
		margin-right:25%;
	}
	
	#menuForm{
		margin-top:100px;
	}
	#menuForm li{
		padding:10px 0px;
	}
	#subject{
		width:100%;
	}
	/*CKEDITOR*/
	.ck-editor__editable[role="textbox"] {
        /* editing area */
        min-height: 400px;
    }
    .ck-content .image {
        /* block images */
        max-width: 80%;
        margin: 20px auto;
    }
</style>
<script>
	$(function(){
		CKEDITOR.ClassicEditor.create(document.getElementById("content"), {
            // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
            toolbar: {
                items: [
                    'exportPDF','exportWord', '|',
                    'findAndReplace', 'selectAll', '|',
                    'heading', '|',
                    'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                    'bulletedList', 'numberedList', 'todoList', '|',
                    'outdent', 'indent', '|',
                    'undo', 'redo',
                    '-',
                    'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                    'alignment', '|',
                    'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                    'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                    'textPartLanguage', '|',
                    'sourceEditing'
                ],
                shouldNotGroupWhenFull: true
            },
            // Changing the language of the interface requires loading the language file using the <script> tag.
            // language: 'es',
            list: {
                properties: {
                    styles: true,
                    startIndex: true,
                    reversed: true
                }
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
            heading: {
                options: [
                    { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                    { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                    { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                    { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                    { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                    { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                    { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
                ]
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
            placeholder: '내용을 입력하세요',
            // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
            fontFamily: {
                options: [
                    'default',
                    'Arial, Helvetica, sans-serif',
                    'Courier New, Courier, monospace',
                    'Georgia, serif',
                    'Lucida Sans Unicode, Lucida Grande, sans-serif',
                    'Tahoma, Geneva, sans-serif',
                    'Times New Roman, Times, serif',
                    'Trebuchet MS, Helvetica, sans-serif',
                    'Verdana, Geneva, sans-serif'
                ],
                supportAllValues: true
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
            fontSize: {
                options: [ 10, 12, 14, 'default', 18, 20, 22 ],
                supportAllValues: true
            },
            // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
            // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
            htmlSupport: {
                allow: [
                    {
                        name: /.*/,
                        attributes: true,
                        classes: true,
                        styles: true
                    }
                ]
            },
            // Be careful with enabling previews
            // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
            htmlEmbed: {
                showPreviews: true
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
            link: {
                decorators: {
                    addTargetToExternalLinks: true,
                    defaultProtocol: 'https://',
                    toggleDownloadable: {
                        mode: 'manual',
                        label: 'Downloadable',
                        attributes: {
                            download: 'file'
                        }
                    }
                }
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
            mention: {
                feeds: [
                    {
                        marker: '@',
                        feed: [
                            '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                            '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                            '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                            '@sugar', '@sweet', '@topping', '@wafer'
                        ],
                        minimumCharacters: 1
                    }
                ]
            },
            // The "super-build" contains more premium features that require additional configuration, disable them below.
            // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
            removePlugins: [
                // These two are commercial, but you can try them out without registering to a trial.
                // 'ExportPdf',
                // 'ExportWord',
                'CKBox',
                'CKFinder',
                'EasyImage',
                // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                // Storing images as Base64 is usually a very bad idea.
                // Replace it on production website with other solutions:
                // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                // 'Base64UploadAdapter',
                'RealTimeCollaborativeComments',
                'RealTimeCollaborativeTrackChanges',
                'RealTimeCollaborativeRevisionHistory',
                'PresenceList',
                'Comments',
                'TrackChanges',
                'TrackChangesData',
                'RevisionHistory',
                'Pagination',
                'WProofreader',
                // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                // from a local file system (file://) - load this site via HTTP server if you enable MathType
                'MathType'
            ]
        });
		
		//폼의 유효성검사
		$("#menuForm").submit(function(){
			//제목 유효성
			if($("#subject").val()==""){
				alert("제목을 입력하세요");
				return false;
			}
			//내용 유효성
			if($("#content").val()==""){
				alert("내용을 입력하세요");
				return false;
			}
			return true;
		});
	});
	
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		      document.getElementById('menu_thumbnail').value = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		    document.getElementById('menu_thumbnail').value = "";
		  }
		}
</script>

<!-- 배너 -->
	<div class= "banner" style="overflow: hidden;">
		<img src="img/bannerimg2.png" width="100%" height="300px;">
	</div>
	
<div class="container">
	<form method="post" action="menuWriteOk" id="menuForm" enctype="multipart/form-data">  
		<ul>
			<h1 style="display: inline;">식단 등록</h1>
			<hr style="height: 3px; background-color:black;"/>
			<li>
				<label for="file" style="width:250px">
	  				<div class="btn-upload">메인 이미지 등록하기</div>
				</label>
				<input type="file" name="menu_thumbnail2" id="file" onchange="readURL(this);">
				<img id="preview"/>
			</li>
			<!-- <li><input type="text" name="recipe_thumbnail" id="recipe_thumbnail" /></li> -->
			<li><input type="text" name="menu_thumbnail" id="menu_thumbnail" value="${dto.menu_thumbnail }"/></li>
			<li><input type="text" name="menu_title" id="subject" placeholder="식단 메뉴"/></li>
			<div class="input-box2 genderCheck">
	    	<span>식이구분</span>
		    <div class="form-check form-check-inline">
			  일반식<input type="radio" class="form-check-input" name="amenu_type_no" value="3" checked>
			</div>
			<div class="form-check form-check-inline">
			  당뇨식<input type="radio" class="form-check-input" name="amenu_type_no" value="1">
			</div>
			<div class="form-check form-check-inline">
			  연식<input type="radio" class="form-check-input" name="amenu_type_no" value="2">
			</div>
			<div class="form-check form-check-inline">
			  저염식<input type="radio" class="form-check-input" name="amenu_type_no" value="4">
			</div>
			<div class="form-check form-check-inline">
			  저요오드식<input type="radio" class="form-check-input" name="amenu_type_no" value="5">
			</div>
			<div class="form-check form-check-inline">
			  항암식<input type="radio" class="form-check-input" name="amenu_type_no" value="6">
			</div>
			
			
	    </div>
			<li>
				<textarea name="menu_text" id="content"></textarea>
			</li>
			<!--글 작성 폼-->
				<!-- 사진 1 -->
				<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#rec1">사진 1</button>
				<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#rec2">사진 2</button>
				<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#rec3">사진 3</button>
				<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#rec4">사진 4</button>
				<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#rec5">사진 5</button>
				<button type="button" class="btn btn-light" data-toggle="collapse" data-target="#rec6">사진 6</button>
				 <div id="rec1" class="collapse" >
				 <b>식단사진 1 :&emsp;</b>
				<input type="file"  id="img1" onchange="readURL1(this);" style="padding:10px;"/>
				 <input type="text" name="menu_img1" id="menu_img1" />
				 </div>
				 
				<!-- 사진 2 -->
				  <div id="rec2" class="collapse" >
				  <b>식단사진 2 :&emsp;</b>
				<input type="file"  id="img2" onchange="readURL2(this);"style="padding:10px;"/>
				  <input type="text" name="menu_img2" id="menu_img2" />
				  </div>
				 
				<!-- 사진 3 -->
				  <div id="rec3" class="collapse">
				  <b>식단사진 3 :&emsp;</b>
				<input type="file"  id="img3" onchange="readURL3(this);"style="padding:10px;"/>
				  <input type="text" name="menu_img3" id="menu_img3" />
				  </div>
				  
				 <!-- 사진 4 -->
				  <div id="rec4" class="collapse">
				  <b>식단사진 4 :&emsp;</b>
				<input type="file"  id="img4" onchange="readURL4(this);"style="padding:10px;"/>
				  <input type="text" name="menu_img4" id="menu_img4" />
				  </div>
				  
				<!-- 사진 5 -->
				  <div id="rec5" class="collapse">
				  <b>식단사진 5 :&emsp;</b>
				<input type="file"  id="img5" onchange="readURL5(this);"style="padding:10px;"/>
				  <input type="text" name="menu_img5" id="menu_img5" />
				  </div>
				  
				  <!-- 사진 6 -->
				   
				  <div id="rec6" class="collapse">
				  <b>식단사진 6 :&emsp;</b>
				<input type="file"  id="img6" onchange="readURL6(this);"style="padding:10px;"/>
				  <input type="text" name="menu_img6" id="menu_img6" />
				  </div>
				  <div>
				  <img id="preview_img1"/>
				  <img id="preview_img2"/>
				  <img id="preview_img3"/>
				  <img id="preview_img4"/>
				  <img id="preview_img5"/>
				  <img id="preview_img6"/>
				  </div>
			<li>
				<input type="submit" value="등록"/>
			</li>
		</ul>
	</form>
</div>
<script>

//사진 1
function readURL1(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      $('#rec1').collapse('hide');
	      document.querySelector('[data-target="#rec1"]').click();
		  document.getElementById('preview_img1').src = e.target.result;
	      document.getElementById('menu_img1').value = e.target.result;
	     
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
		  document.getElementById('preview_img1').src = "";
	    document.getElementById('menu_img1').value = "";
	  }
	}

//사진 2
function readURL2(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
		  document.querySelector('[data-target="#rec2"]').click();
		  document.getElementById('preview_img2').src = e.target.result;
	      document.getElementById('menu_img2').value = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
		  document.getElementById('preview_img2').src = "";
	    document.getElementById('menu_img2').value = "";
	  }
	}

//사진 3
function readURL3(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
		      document.querySelector('[data-target="#rec3"]').click();
		  document.getElementById('preview_img3').src = e.target.result;
	      document.getElementById('menu_img3').value = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
		  document.getElementById('preview_img3').src = "";
	    document.getElementById('menu_img3').value = "";
	  }
	}

//사진 4
function readURL4(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
		      document.querySelector('[data-target="#rec4"]').click();
		  document.getElementById('preview_img4').src = e.target.result;
	      document.getElementById('menu_img4').value = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
		  document.getElementById('preview_img4').src = "";
	    document.getElementById('menu_img4').value = "";
	  }
	}

//사진 5
function readURL5(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
		      document.querySelector('[data-target="#rec5"]').click();
		  document.getElementById('preview_img5').src = e.target.result;
	      document.getElementById('menu_img5').value = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
		  document.getElementById('preview_img5').src = "";
	    document.getElementById('menu_img5').value = "";
	  }
	}

//사진 6
function readURL6(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
		      document.querySelector('[data-target="#rec6"]').click();
		  document.getElementById('preview_img6').src = e.target.result;
	      document.getElementById('menu_img6').value = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
		  document.getElementById('preview_img6').src = "";
	    document.getElementById('menu_img6').value = "";
	  }
	}
</script>