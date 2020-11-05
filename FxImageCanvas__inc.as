import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.display.Stage;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.geom.Point;
import flash.text.TextField;










function pf__repos_v(tsw:Number, tsh:Number):void
{
	var tx:Number, ty:Number;
	var th:Number;
	
	var fxsb:FxScrollbar = _fxsiv.GetFxsb();
	tx = tsw - 30;
	th = tsh - 140;
	fxsb.SetX(tx);
	fxsb.SetSize(th);
	_fxsiv.fn__txb3_update();
	
	var tipg:DisplayObject = mvc_ipgv;
	tx = tsw - 200;
	ty = tsh - 49;
	tipg.x = tx;
	tipg.y = ty;
}

function pf__repos_h(tsw:Number, tsh:Number):void
{
	var ty:Number;
	var tw:Number;
	
	var fxsb:FxScrollbar = _fxsih.GetFxsb();
	ty = tsh - 130;
	tw = tsw - 40;
	fxsb.SetY(ty);
	fxsb.SetSize(tw);
	_fxsih.fn__txb3_update();
	
	var tipg:DisplayObject = mvc_ipgh;
	ty = tsh - 49;
	tipg.y = ty;
}

function pf__repos_image_all(tsw:Number, tsh:Number):void
{
	var tw:Number = tsw - 40;
	var th:Number = tsh - 140;
	
	_mask.width = tw;
	_mask.height = th;
	_background.width = tw;
	_background.height = th;
}

function pf__stage_resize(te:Event):void
{
	var tsw:Number = _stage.stageWidth;
	var tsh:Number = _stage.stageHeight;	
	//trace(tsw, tsh);
	
	pf__repos_v(tsw, tsh);
	pf__repos_h(tsw, tsh);
	pf__repos_image_all(tsw, tsh);
	pf_ImageSizeUpdate();
}

function pf_ImageSizeUpdate():void
{
	var trct:Rectangle = _mask.getBounds(_owrt);
	var tcx:Number = trct.left + (trct.width / 2);
	var tcy:Number = trct.top + (trct.height / 2);
	
	_fxvt.MoveRectToPoint(tcx, tcy);
	_fxvt.DrawBounds(_grp);	
	
	pf_ImageHeightUpdate();
	pf_ImageWidthUpdate();
}

function pf_ImageHeightUpdate():void
{	
	var tmh:Number = _mask.height;
	var tih:Number = _fxvt.GetBounds().height;
	var tssr:Number = tmh / tih;
	var fxsb:FxScrollbar = _fxsiv.GetFxsb();
	fxsb.SetScrollSizeRatio(tssr);
	pp_fxsi_ecb__v(null);
}

function pf_ImageWidthUpdate():void
{	
	var tmw:Number = _mask.width;
	var tiw:Number = _fxvt.GetBounds().width;
	var tssr:Number = tmw / tiw;
	var fxsb:FxScrollbar = _fxsih.GetFxsb();
	fxsb.SetScrollSizeRatio(tssr);		
}

function pp_fxsi_ecb__v(te:Event):void
{
	var fxsb:FxScrollbar = _fxsiv.GetFxsb();
	var tssr:Number = fxsb.GetScrollSizeRatio();
	//trace('tssr:', tssr);
	if (tssr < 1)
	{
		var tmh:Number = _mask.height;
		var tih:Number = _fxvt.GetBounds().height;	
		var tss:Number = tih - tmh;		
		var tpr:Number = fxsb.GetPositionRatio();
		trace(tpr);
		var tiy:Number = _mask.y - (tss * tpr);
		trace(tiy);
		
		_fxvt.MoveRect(0, tiy);
	}
}

function pp_fxsi_ecb__h(te:Event):void
{
}



function pf_RotateRectFromCenter(td:Number):void
{	
	const tpx:Number = Math.PI / 100;
	
	var trd:Number;
	if (td < 0)
		trd = -tpx;
	else if (td > 1)
		trd = tpx;
		
	_fxvt.RotateRectFromCenter(trd);
	_fxvt.DrawBounds(_grp);
}

function pf_ResizeRectFromCenter(td:Number):void
{
	var tsx:Number, tsy:Number;
	if (td < 0)
		tsx = 0.9, tsy = 0.9;
	else if (td > 1)
		tsx = 1.1, tsy = 1.1;
		
	_fxvt.ResizeRectFromCenter(tsx, tsy);
	_fxvt.DrawBounds(_grp);
}


function pf_InitOnce():void
{
	_owrt = this;
	_stage = _owrt.stage;
	_stage.align = StageAlign.TOP_LEFT;
	_stage.scaleMode = StageScaleMode.NO_SCALE;
	_stage.addEventListener(Event.RESIZE, pf__stage_resize);
	

	_fxsiv = new FxScrollInput(
		FxScrollbar.TYPE_VERTICAL, mvc_fxsbv, mvc_ipgv, 'txbv3', 'txbv2', 'txbv1',
		300.0, 1.0, 0.0, pp_fxsi_ecb__v);

	_fxsih = new FxScrollInput(
		FxScrollbar.TYPE_HORIZONTAL, mvc_fxsbh, mvc_ipgh, 'txbv3', 'txbv2', 'txbv1',
		300.0, 1.0, 0.0, pp_fxsi_ecb__h);
	
	
	
	_mask = _owrt['mvcMask'];
	_mask.mouseChildren = false;
	_mask.mouseEnabled = false;
	_image = _owrt['mvcImage'];

	_drawCanvas = _owrt['mvcDrawCanvas'];
	_drawCanvas.mouseChildren = false;
	_drawCanvas.buttonMode = true;
	_grp = _drawCanvas.graphics;
	
	_background = _owrt['mvcBackground'];
	_background.mouseChildren = false;
	_background.mouseEnabled = false;
	
	
	_fxvt = new FxVisualTransformer(_image);
	_fxvt.DrawBounds(_grp);
	
	
	
	_drawCanvas.addEventListener(MouseEvent.MOUSE_WHEEL,
		function(te:MouseEvent):void {
			if (te.ctrlKey)
			{
				pf_ResizeRectFromCenter(te.delta);
				return;
			}
			pf_RotateRectFromCenter(te.delta);
		});


		
		
	pf__stage_resize(null);
	
}
var _owrt:Sprite;
var _stage:Stage;

var _fxsiv:FxScrollInput;
var _fxsih:FxScrollInput;

var _mask:Sprite;
var _image:Sprite;
var _drawCanvas:Sprite;
var _grp:Graphics;
var _background:Sprite;

var _fxvt:FxVisualTransformer;



pf_InitOnce();




