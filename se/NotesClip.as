package se {
	
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	
	
	public class NotesClip extends MovieClip {
		private var instance:NotesClip;
		
		public function NotesClip() {
			instance = this;
			
			var tf:TextFormat = new TextFormat();

			tf.font = "Arial Black";
			tf.size = 15;
			tf.color = 0xCC9933;
			
			Notes.setStyle("textFormat", tf);
			
			SaveAndQuit.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) { 
				instance.visible = false;
				Start.db.notes = Notes.text;
				SaveAndQuit.removeEventListener(MouseEvent.CLICK, this);
			});
		}
	}
	
}
