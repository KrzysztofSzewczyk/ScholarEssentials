package se {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class SettingsClip extends MovieClip {
		private function handler(m:MouseEvent):void {
			visible = false;
			SaveAndQuit.removeEventListener(MouseEvent.CLICK, handler);
		}
		
		public function SettingsClip() {
			SaveAndQuit.addEventListener(MouseEvent.CLICK, handler);
		}
	}
	
}
