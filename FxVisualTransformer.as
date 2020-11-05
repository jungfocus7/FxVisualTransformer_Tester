package
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	


	public class FxVisualTransformer
	{
		//====================================================================================================
		// ## 
		//====================================================================================================
		
		//::
		public function FxVisualTransformer(ttdo:DisplayObject)
		{
			_tdo = ttdo;
		}
		
		//-- Target DisplayObject
		private var _tdo:DisplayObject;
		
		//-- Target Bounds
		private var _rct:Rectangle;
		
		//-- Target Matrix
		private var _mtr:Matrix;

		
		
		//::
		private function pf_RenewBounds():void
		{
			_rct = _tdo.getBounds(_tdo.parent);
			//trace('_rct:', _rct);
		}
		
		//::
		private function pf_RenewMatrix():void
		{
			_mtr = _tdo.transform.matrix;
			//trace('_mtr:', _mtr);
		}
		
		//::
		private function pf_UpdateMatrix():void
		{
			_tdo.transform.matrix = _mtr;
			//trace('_mtr:', _mtr);
		}
		
		//====================================================================================================
		
		
		
		

		//====================================================================================================
		// ## 
		//====================================================================================================
		
		//::
		public function GetTarget():DisplayObject
		{
			return _tdo;
		}
		
		//::
		public function GetBounds(tb:Boolean = false):Rectangle
		{
			if (tb) pf_RenewBounds();
			return _rct;
		}
		
		//::
		public function GetMatrix(tb:Boolean = false):Matrix
		{
			if (tb) pf_RenewMatrix();
			return _mtr;
		}
		
		
		//::
		public function GetRotationToRadian():Number
		{
			return FxGeometry.GetRotationToRadian(_tdo);
		}
		
		//::
		public function GetRadian1():Number
		{
			return FxGeometry.GetRadian1(_mtr);
		}
		
		//::
		public function GetRadian2():Number
		{
			return FxGeometry.GetRadian2(_mtr);
		}
		
		//::
		public function GetScaleX():Number
		{
			return FxGeometry.GetScaleX(_mtr);
		}
		
		//::
		public function GetScaleY():Number
		{
			return FxGeometry.GetScaleY(_mtr);
		}
		
		//::
		public function GetCenterX():Number
		{
			return FxGeometry.GetCenterX(_rct);
		}
		
		//::
		public function GetCenterY():Number
		{
			return FxGeometry.GetCenterY(_rct);
		}
		
		//====================================================================================================
		
		
		
		//====================================================================================================
		// ## 
		//====================================================================================================
		
		//::
		public function DrawBounds(tgrp:Graphics):void
		{
			pf_RenewBounds();
			tgrp.clear();
//			tgrp.lineStyle(5, 0xff0000, 0.35);
			tgrp.beginFill(0x00ff00, 0.35);			
			tgrp.drawRect(_rct.x, _rct.y, _rct.width, _rct.height);
//			tgrp.moveTo(_rct.left, _rct.top);
//			tgrp.lineTo(_rct.right, _rct.bottom);
//			tgrp.moveTo(_rct.left, _rct.bottom);
//			tgrp.lineTo(_rct.right, _rct.top);
		}
		
		
		//::
		public function MoveRectToPoint(tmx:Number, tmy:Number):void
		{
			pf_RenewBounds();
			pf_RenewMatrix();
			FxGeometry.MoveRectFromCenter(_rct, _mtr, tmx, tmy);
			pf_UpdateMatrix();
		}
		
		//::
		public function MoveRect(tmx:Number, tmy:Number):void
		{
			pf_RenewBounds();
			pf_RenewMatrix();
			FxGeometry.MoveRect(_rct, _mtr, tmx, tmy);
			pf_UpdateMatrix();
		}
		
		//::
		public function RotateRectFromCenter(trd:Number):void
		{
			pf_RenewBounds();
			pf_RenewMatrix();
			FxGeometry.RotateRectFromCenter(_rct, _mtr, trd);
			pf_UpdateMatrix();
		}
		
		//::
		public function ResizeRectFromCenter(tsx:Number, tsy:Number):void
		{
			pf_RenewBounds();
			pf_RenewMatrix();
			FxGeometry.ScaleRectFromCenter(_rct, _mtr, tsx, tsy);
			pf_UpdateMatrix();
		}
		
		//====================================================================================================
		
	}
}
