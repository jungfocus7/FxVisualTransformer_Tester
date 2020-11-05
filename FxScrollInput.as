package
{
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;	
	import flash.text.TextField;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.DisplayObject;
	
	
	


	public final class FxScrollInput
	{
		private static function pf_NumDown(ttxb:TextField, tf:Function, ta:Number, tn:Number, tm:Number, tx:Number):void
		{
			var tv:Number = Number(ttxb.text);
			if (!isNaN(tv))
			{
				tv -= ta;
				if (tv < tn) tv = tn;
				else if (tv > tm) tv = tm;
				tf(tv);
				ttxb.text = tv.toFixed(tx);
			}
		}
		
		private static function pf_NumUp(ttxb:TextField, tf:Function, ta:Number, tn:Number, tm:Number, tx:Number):void
		{
			var tv:Number = Number(ttxb.text);
			if (!isNaN(tv))
			{
				tv += ta;
				if (tv < tn) tv = tn;
				else if (tv > tm) tv = tm;
				tf(tv);
				ttxb.text = tv.toFixed(tx);
			}
		}	
		
		
		
		public function FxScrollInput(
							ttp:String, ttg:Sprite, tdoc_ipg:Sprite,
							txbnm3:String = 'txbv3', txbnm2:String = 'txbv2', txbnm1:String = 'txbv1',
							tsz:Number = 400, tssr:Number = 1.0, tpr:Number = 0.0,
							tfevt:Function = null)
		{
			_target = ttg;
			_target.tabEnabled = false;
			_doc_ipg = tdoc_ipg;
			
			_fxsb = new FxScrollbar(ttp, _target, tsz, tssr, tpr, pf__fxsb_upt);
			
			
			_tv3 = tsz;
			_tv2 = tssr;
			_tv1 = tpr;
			
			_txb3 = _doc_ipg[txbnm3];
			_txb3.text = _tv3.toFixed(0);
//			_txb3.addEventListener(KeyboardEvent.KEY_DOWN, pf_Keyduan3);
//			_txb3.addEventListener(MouseEvent.MOUSE_WHEEL, pf_Mswh3);			
			
			_txb2 = _doc_ipg[txbnm2];			
			_txb2.text = _tv2.toFixed(2);
			_txb2.addEventListener(KeyboardEvent.KEY_DOWN, pf_Keyduan2);
			_txb2.addEventListener(MouseEvent.MOUSE_WHEEL, pf_Mswh2);			
			
			_txb1 = _doc_ipg[txbnm1];			
			_txb1.text = _tv1.toFixed(2);
			_txb1.addEventListener(KeyboardEvent.KEY_DOWN, pf_Keyduan1);
			_txb1.addEventListener(MouseEvent.MOUSE_WHEEL, pf_Mswh1);
			
			
			_fevt = tfevt;
		}
		private var _target:Sprite;
		private var _doc_ipg:Sprite;
		private var _fxsb:FxScrollbar;
		public function GetFxsb():FxScrollbar
		{
			return _fxsb;
		}
		
		
		private var _tv3:Number;
		private var _tv2:Number;
		private var _tv1:Number;
		
		private var _txb3:TextField;
		private var _txb2:TextField;
		private var _txb1:TextField;
		
		private var _fevt:Function;
		
		

		private function pf_Keyduan3(te:KeyboardEvent):void
		{		
			const ta:Number = 10;
			const tn:Number = 100;
			const tm:Number = 500;
			const tx:Number = 0;
			if (te.keyCode == Keyboard.DOWN)
			{
				pf_NumDown(_txb3, _fxsb.SetSize, ta, tn, tm, tx);
			}	
			else if (te.keyCode == Keyboard.UP)
			{
				pf_NumUp(_txb3, _fxsb.SetSize, ta, tn, tm, tx);
			}
		}
		
		private function pf_Keyduan2(te:KeyboardEvent):void
		{		
			const ta:Number = 0.1;
			const tn:Number = 0.0;
			const tm:Number = 1.0;
			const tx:Number = 2;	
			if (te.keyCode == Keyboard.DOWN)
			{
				pf_NumDown(_txb2, _fxsb.SetScrollSizeRatio, ta, tn, tm, tx);
			}	
			else if (te.keyCode == Keyboard.UP)
			{
				pf_NumUp(_txb2, _fxsb.SetScrollSizeRatio, ta, tn, tm, tx);
			}
		}
		
		private function pf_Keyduan1(te:KeyboardEvent):void
		{		
			const ta:Number = 0.1;
			const tn:Number = 0.0;
			const tm:Number = 1.0;
			const tx:Number = 2;	
			if (te.keyCode == Keyboard.DOWN)
			{
				pf_NumDown(_txb1, _fxsb.SetPositionRatio, ta, tn, tm, tx);
			}	
			else if (te.keyCode == Keyboard.UP)
			{
				pf_NumUp(_txb1, _fxsb.SetPositionRatio, ta, tn, tm, tx);
			}
		}
		
		
		
		private function pf_Mswh3(te:MouseEvent):void
		{			
			const ta:Number = 10;
			const tn:Number = 100;
			const tm:Number = 700;
			const tx:Number = 0;
			if (te.delta == -3)
			{
				pf_NumDown(_txb3, _fxsb.SetSize, ta, tn, tm, tx);
			}
			else if (te.delta == 3)
			{
				pf_NumUp(_txb3, _fxsb.SetSize, ta, tn, tm, tx);
			}
		}
		
		private function pf_Mswh2(te:MouseEvent):void
		{			
			var ta:Number = 0.1;
			if (te.ctrlKey) ta = 0.01;
			const tn:Number = 0.0;
			const tm:Number = 1.0;
			const tx:Number = 2;
			if (te.delta == -3)
			{
				pf_NumDown(_txb2, _fxsb.SetScrollSizeRatio, ta, tn, tm, tx);
			}
			else if (te.delta == 3)
			{
				pf_NumUp(_txb2, _fxsb.SetScrollSizeRatio, ta, tn, tm, tx);
			}
		}
		
		private function pf_Mswh1(te:MouseEvent):void
		{			
			var ta:Number = 0.1;
			if (te.ctrlKey) ta = 0.01;
			const tn:Number = 0.0;
			const tm:Number = 1.0;
			const tx:Number = 2;	
			if (te.delta == -3)
			{
				pf_NumDown(_txb1, _fxsb.SetPositionRatio, ta, tn, tm, tx);
			}
			else if (te.delta == 3)
			{
				pf_NumUp(_txb1, _fxsb.SetPositionRatio, ta, tn, tm, tx);
			}
		}
		
		
		private function pf__fxsb_upt(te:Event):void
		{
			var tr:Number = _fxsb.GetPositionRatio();
			_txb1.text = tr.toFixed(2);
			
			if (_fevt != null)
				_fevt(te);
		}	
		

		
		public function fn__txb3_update():void
		{
			var tr:Number = _fxsb.GetSize();
			_txb3.text = tr.toFixed(1);
		}
		
		public function fn__txb2_update():void
		{
			var tr:Number = _fxsb.GetScrollSizeRatio();
			_txb2.text = tr.toFixed(2);
		}	
		
		public function fn__txb1_update():void
		{
			pf__fxsb_upt(null);
		}		
	}	
}

