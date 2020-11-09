package
{	
	import flash.display.DisplayObject;
	import flash.geom.Matrix;


	public class RxVisualTransformer
	{	
		public function RxVisualTransformer(tdo:DisplayObject)
		{
			_tdo = tdo;
			_mtr = _tdo.transform.matrix;
			//trace('_mtr:', _mtr);
			//trace(_tdo.transform.matrix == _tdo.transform.matrix);
			//trace(_tdo.transform.matrix == _tdo.transform.matrix);
			
			_tx = RxGeom.GetX(_mtr);
			_ty = RxGeom.GetY(_mtr);
			_sx = RxGeom.GetScaleX(_mtr);
			_sy = RxGeom.GetScaleY(_mtr);
			_rd = RxGeom.GetRadian1(_mtr);
//			trace(_tx, _ty, _sx, _sy, _rd);
//			trace(RxGeom.GetAngle(_tdo));
//			trace(RxGeom.GetAngleToRadian(RxGeom.GetAngle(_tdo)));
			
			/*
			trace(_tdo.rotation);
			var txa:Number = RxGeom.GetAngleToRadian(_tdo.rotation);
			var txb:Number = _rd;
			trace(txa, txb);
			trace(txa - txb);
			*/
			
		}
		private var _tdo:DisplayObject;
		private var _mtr:Matrix;
		private var _tx:Number;
		private var _ty:Number;
		private var _sx:Number;
		private var _sy:Number;
		private var _rd:Number;
		
		
		
		public function SetRotateAt(tcx:Number, tcy:Number, trd:Number):void
		{
			trd = RxGeom.DoubleRound(trd);
			if (_rd === trd)
			{
				_mtr.translate(-tcx, -tcy);
				_mtr.rotate(trd);
				_mtr.translate(tcx, tcy);
				_tdo.transform.matrix = _mtr;
			}
		}
		
	}

}