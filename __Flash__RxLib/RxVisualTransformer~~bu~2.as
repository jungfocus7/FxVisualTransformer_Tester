package
{	
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;


	public class RxVisualTransformer
	{	
		public function RxVisualTransformer(tdo:DisplayObject)
		{
			_tdo = tdo;
			_mtr = _tdo.transform.matrix;
			_rct = _tdo.getBounds(_tdo.parent);

		}
		private var _tdo:DisplayObject;
		public function GetTarget():DisplayObject
		{
			return _tdo;
		}
		
		private var _mtr:Matrix;
		public function GetMatrix():Matrix
		{
			return _mtr;
		}
		public function GetMatrixToStr():String
		{
			var tstr:String =
				'(a=' + RxGeom.DoubleRound(_mtr.a) + ', b=' + RxGeom.DoubleRound(_mtr.b) +
				', c=' + RxGeom.DoubleRound(_mtr.c) + ', d=' + RxGeom.DoubleRound(_mtr.d) +
				', tx=' + RxGeom.DoubleRound(_mtr.tx) + ', ty=' + RxGeom.DoubleRound(_mtr.ty) + ')';
			return tstr;
		}
		
		private var _rct:Rectangle;		
		public function GetRect():Rectangle
		{
			return _rct;
		}
		
		
		private function pf_ApplyMatrix():void
		{
			_tdo.transform.matrix = _mtr;
			_rct = _tdo.getBounds(_tdo.parent);
		}
		
		
		public function SetRotateAt(tcx:Number, tcy:Number, trd:Number):void
		{
			var tyrd:Number = RxGeom.GetRadian1(_mtr);
			var tnrd:Number = RxGeom.DoubleRound(trd);
			//trace(tyrd, tnrd);
			if (tnrd !== tyrd)
			{
				_mtr.translate(-tcx, -tcy);
				_mtr.rotate(-tyrd);
				_mtr.rotate(tnrd);
				_mtr.translate(tcx, tcy);
				pf_ApplyMatrix();
				//trace('적용');
			}
			else
			{
				//trace('같음');
			}
		}
		
		
		public function SetScaleAt(tcx:Number, tcy:Number, tsx:Number, tsy:Number):void
		{
			const txx:Number = 0.001;
			
			if (tsx < 0.1) return;
			if (tsy < 0.1) return;
			
			var tysx:Number = RxGeom.GetScaleX(_mtr);
			var tysy:Number = RxGeom.GetScaleY(_mtr);
			//trace(tysx, tysy);
			
			var tnsx:Number = RxGeom.DoubleRound(tsx);
			var tnsy:Number = RxGeom.DoubleRound(tsy);
			//trace(tnsx, tnsy);
			
			if ((tysx !== tnsx) && (tysy !== tnsy))
			{
				_mtr.translate(-tcx, -tcy);				
            	var tbsx:Number = 1 / tysx;
            	var tbsy:Number = 1 / tysy;
				_mtr.scale(tbsx, tbsy);				
				_mtr.scale(tnsx, tnsy);
				_mtr.translate(tcx, tcy);
				pf_ApplyMatrix();
				trace('적용');
			}
			else
			{
				//trace('같음');
			}
		}		
		
	}

}