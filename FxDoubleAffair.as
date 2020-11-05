package
{
	public class FxDoubleAffair
	{
		public function FxDoubleAffair(
							min:Number = 0.0,
							max:Number = 1.0,
							val:Number = 0.0,
							txa:Number = 0.1,
							txb:Number = 10.0,
							txc:Number = 0.01,
							txd:Number = 1.0,
							tfd:uint = 1)
		{
			if (min >= max)
				throw new Error('max must be greater than min.');
				
			_min = min;
			_max = max;
			
			if (val < _min)
				val = _min;
			else if (val > _max)
				val = _max;
			_val = val;
			//trace(_min, _max, _val);
			
			_xa = txa;
			_xb = txb;
			_xc = txc;
			_xd = txd;
			//trace(_xa, _xb, _xc, _xd);
			
			_fd = tfd;
			//trace(_fd);
		}
		
		private var _min:Number;
		private var _max:Number;
		private var _val:Number;
		
		private var _xa:Number;
		private var _xb:Number;
		private var _xc:Number;
		private var _xd:Number;
		
		private var _fd:uint;
		
		
		
		public function ValueUpDown(tt:String = 'up', tn:uint = 1):void
		{
			if (((tt == 'up') || (tt == 'down')) &&
				((tn >= 1) && (tn <= 4)))
			{				
				var ta:Number;
				if (tn == 1)
					ta = _xa;
				else if (tn == 2)
					ta = _xb;
				else if (tn == 3)
					ta = _xc;
				else if (tn == 4)
					ta = _xd;
					
				var tv:Number;
				if (tt == 'up')
					tv = _val + ta;
				else if (tt == 'down')
					tv = _val - ta;
					
				if (tv < _min)
					tv = _min;
				else if (tv > _max)
					tv = _max;				
					
				_val = tv;
			}
		}
		
		public function GetRatio():Number
		{
			var tsv:Number = _max - _min;
			if (tsv <= 0) return 0;
			
			var tr:Number = (_val - _min) / tsv;
			return tr;
		}
		
		public function SetRatio(tr:Number):void
		{
			if (tr < 0) tr = 0;
			else if (tr > 1) tr = 1;
			
			var tsv:Number = _max - _min;
			if (tsv < 0) tsv = 0;
			_val = _min + (tsv * tr);
		}
		
		
		
		public function GetValue():Number
		{ 
			return _val;
		}
		
		public function SetValue(tv:Number):void
		{ 
			if (tv < _min)
				tv = _min;
			else if (tv > _max)
				tv = _max;		
		
			_val = tv;
		}		
		
		public function GetValueFixed():String
		{
			return _val.toFixed(_fd);
		}
		
	}
}
