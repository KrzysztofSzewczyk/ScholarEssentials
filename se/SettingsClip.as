package se {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class SettingsClip extends MovieClip {
		private var instance:SettingsClip;
		
		public function SettingsClip() {
			instance = this;
			
			SaveAndQuit.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) { 
				instance.visible = false;
				SaveAndQuit.removeEventListener(MouseEvent.CLICK, this);
			});
		}
	}
	
}
