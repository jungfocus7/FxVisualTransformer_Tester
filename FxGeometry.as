package
{
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	
	
	
	// ##
	//
	//
	public final class FxGeometry
	{
		//====================================================================================================
		// ## 
		//====================================================================================================
		
        //--
        public static const FullAngle:Number = 360;

        //--
        public static const FullAngleHalf:Number = FullAngle / 2;

        //--
        public static const FullAngleQuarter:Number = FullAngle / 4;



        //--
        public static const FullRadian:Number = Math.PI * 2;

        //--
        public static const FullRadianHalf:Number = FullRadian / 2;

        //--
        public static const FullRadianQuarter:Number = FullRadian / 4;



        //--
        public static const ToRadians:Number = Math.PI / 180;

        //--
        public static const ToAngles:Number = 180 / Math.PI;
		
		
        //:: Angle To Radian
        public static function GetAngleToRadian(ta:Number):Number
        {
            return ta * ToRadians;
        }

        //:: Radian To Angle
        public static function GetRadianToAngle(tr:Number):Number
        {
            return tr * ToAngles;
        }
		
		//====================================================================================================
		
		
		
		

		//====================================================================================================
		// ## 
		//====================================================================================================
		
		// (Geomery: Matrix, Rectangle, Point)
		// a: 1, c: 0, tx: 0,
		// b: 0, d: 1, ty: 0
		// u: 0, v: 0, w: 1
		
		public static function GetRadian1(tmtr:Matrix):Number
		{
			return Math.atan2(tmtr.b, tmtr.a);
		}
		
		public static function GetRadian2(tmtr:Matrix):Number
		{
			return -Math.atan2(tmtr.c, tmtr.d);
		}
		
		public static function GetScaleX(tmtr:Matrix):Number
		{
			var tsx:Number = Math.sqrt(Math.pow(tmtr.a, 2) + Math.pow(tmtr.b, 2));
			return tsx;
		}
		
		public static function GetScaleY(tmtr:Matrix):Number
		{
			var tsy:Number = Math.sqrt(Math.pow(tmtr.c, 2) + Math.pow(tmtr.d, 2));
			return tsy;
		}
		
		public static function GetRect(tdo:DisplayObject):Rectangle
		{
			var trct:Rectangle = tdo.getBounds(tdo.parent);
			return trct;
		}
		
		public static function GetCenterX(trct:Rectangle):Number
		{
			var tcx:Number = trct.x + (trct.width / 2);
			return tcx;
		}
		
		public static function GetCenterY(trct:Rectangle):Number
		{
			var tcy:Number = trct.y + (trct.height / 2);
			return tcy;
		}
		
		public static function GetX(trct:Rectangle):Number
		{
			return trct.left;
		}
		
		public static function GetY(trct:Rectangle):Number
		{
			return trct.top;
		}
		
		public static function GetCenterPoint(trct:Rectangle):Point
		{
			var tcx:Number = trct.x + (trct.width / 2);
			var tcy:Number = trct.y + (trct.height / 2);
			var tpt:Point = new Point(tcx, tcy);
			return tpt;
		}
		
		public static function GetRotationToRadian(tdo:DisplayObject):Number
		{
			var tag:Number = tdo.rotation;
			var trd:Number = GetAngleToRadian(tag);
			return trd;
		}
		
		//====================================================================================================
		
		
		
		
		//====================================================================================================
		// ## 
		//====================================================================================================		
		
		public static function MoveRectFromCenter(trct:Rectangle, tmtr:Matrix, tmx:Number, tmy:Number):void
		{
			var tcx:Number = GetCenterX(trct);
			var tcy:Number = GetCenterY(trct);
			tmtr.translate(tmx - tcx, tmy - tcy);
		}
		
		public static function MoveRect(trct:Rectangle, tmtr:Matrix, tmx:Number, tmy:Number):void
		{
			var tbx:Number = GetX(trct);
			var tby:Number = GetY(trct);			
			tmtr.translate(tmx - tbx, tmy - tby);
		}
		
		public static function RotateRectFromCenter(trct:Rectangle, tmtr:Matrix, trd:Number):void
		{
			var tcx:Number = GetCenterX(trct);
			var tcy:Number = GetCenterY(trct);
			tmtr.translate(-tcx, -tcy);
			tmtr.rotate(trd);
			tmtr.translate(tcx, tcy);
		}
		
		public static function ScaleRectFromCenter(trct:Rectangle, tmtr:Matrix, tsx:Number, tsy:Number):void
		{
			var tcx:Number = GetCenterX(trct);
			var tcy:Number = GetCenterY(trct);
			tmtr.translate(-tcx, -tcy);
			tmtr.scale(tsx, tsy);
			tmtr.translate(tcx, tcy);
		}
		
		//====================================================================================================
	}
}
