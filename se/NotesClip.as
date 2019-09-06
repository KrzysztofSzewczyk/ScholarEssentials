package se {
	
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	
	
	public class NotesClip extends MovieClip {
		private function handler(e:MouseEvent):void {
			visible = false;
			Start.db.notes = Notes.text;
			SharedObjectManager.progmem.data.notes = Start.db.notes;
			SharedObjectManager.progmem.flush();
		}
		
		public function run():void {
			if(Start.db.notes == null) {
				if(SharedObjectManager.progmem.data.notes == null) {
					SharedObjectManager.progmem.data.notes = Start.db.notes = "";
					SharedObjectManager.progmem.flush();
				} else {
					Start.db.notes = SharedObjectManager.progmem.data.notes as String;
				}
			}
			
			Notes.text = Start.db.notes;
		}
		
		public function NotesClip() {
			var tf:TextFormat = new TextFormat();

			tf.font = "Arial Black";
			tf.size = 15;
			tf.color = 0xCC9933;
			
			Notes.setStyle("textFormat", tf);
			
			SaveAndQuit.addEventListener(MouseEvent.CLICK, handler);
		}
	}
	
}
