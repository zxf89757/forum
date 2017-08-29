/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.filebrowserImageUploadUrl= "${ pageContext.request.contextPath }/upload_imagesave.action";
	//config.filebrowserFlashUploadUrl= "${ pageContext.request.contextPath }/upload_flashsave.action";
	//config.filebrowserLinkUploadUrl= "${ pageContext.request.contextPath }/upload_flashsave.action";
	//config.disallowedContent = 'img{width,height};img[width,height]';
	config.language = "zh-cn";
	config.uiColor = '#AADC6E';
	
	// 设置宽高
   // config.width = 753;
    config.height = 200;
    //改变大小的最大高度
    config.resize_maxHeight = 1500;
    //config.font_names="宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;"+ config.font_names;
    config.toolbar = 'MyToolbar';
    config.toolbar_MyToolbar =     
        [      
            ['Undo','Redo','-','Find'],     
            ['TextColor'],     
               
            ['Outdent','Indent'],     
            ['JustifyLeft','JustifyCenter','JustifyRight'],        
            ['Link'],     
            ['Image','Smiley','SpecialChar'],     
                
            ['Font','FontSize']  ,
            ['Bold','Italic']
        ]; 
    config.smiley_columns = 8;
    config.smiley_images = [
        '1.gif','2.gif','3.gif','4.gif','5.gif','6.gif','7.gif','8.gif',
        '9.gif','10.gif','11.gif','12.gif','13.gif','14.gif','15.gif','16.gif',
        '17.gif','18.gif','19.gif','20.gif','21.gif','22.gif','23.gif','24.gif',
        '25.gif','26.gif','27.gif','28.gif','29.gif','30.gif','31.gif','32.gif'
    ]
    config.smiley_descriptions = [
        '乖','疑问','哈哈','生气','冷','滑稽','太开心','吐',
        '啊','委屈','鄙视','勉强','呵呵','喷','睡觉','花心',
        '阴险','笑眼','狂汗','静静看','不开心','呼~','怒','酷',
        '惊哭','泪','汗','黑线','真棒','吐舌','惊讶','钱'
    ]
};