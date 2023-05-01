<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/super-build/ckeditor.js"></script>
<style>
	.container{
	padding:30px;
	}
	#supForm li{
		padding:10px 0px;
	}
	#sup_title{
		width:100%;
		height:30px;
	}
	/*CKEDITOR*/
	 .ck-editor__editable[role="textbox"] {
                /* editing area */
                min-height: 300px;
                 max-width: 100%;
            }
     .ck-content .image {
                /* block images */
                max-width: 100%;
                margin: 20px auto;
            }
</style>
<!-- 내용디자인폼 -->
<script>
	$(function(){
		 CKEDITOR.ClassicEditor.create(document.getElementById("sup_text"), {
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
             placeholder: '',
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
         }); 	//CKEDITOR

         <!------------------------------------------------------------------------------->	
       
		 //폼의 유효성검사
		 $("#supForm").submit(function(){
			 if($("#sup_title").val()==""){
				 alert("제목을 입력하세요...");
				 return false;
			 }
			 return true;
		 });
	});
</script>
<!-- 배너 -->
<div class= "banner" >
	<img src="../img/bannerimg2.png" width="100%" height="300px;">
</div>
 <!-- 문의글 수정 페이지 -->
<div class="container">
	<h1>문의글 수정하기</h1>
	<hr style="border: solid 2px black;">
	<br/>
	<form method="post" action="/happy/sup/supEditOk" id="supForm">
		<input type="hidden" name="sup_no" value="${dto.sup_no}"/>
		<ul>
			
			<li><input type="text" name="sup_title" id="sup_title" value="${dto.sup_title}"/></li>
			
			<li>
				<!-- 에디터.... -->
				<textarea name="sup_text" id="sup_text">${dto.sup_text}</textarea>
			</li>
			<li>
			<!-- 수정버튼 -->
				<button type="submit" class="btn btn-outline-warning" value="수정하기">수정하기</button>
				
			<!-- 목록으로가는 버튼 -->
  				<button type="button" class="btn btn-outline-success" ><a href="../supList">취소</a></div></button>
			</li>
		</ul>
	</form>
</div>