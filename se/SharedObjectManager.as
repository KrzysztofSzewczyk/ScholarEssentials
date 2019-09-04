package se {
	import flash.net.SharedObject;
	
	public class SharedObjectManager {
		private shroot:SharedObject;
		
		private static instance:SharedObjectManager;

		private function SharedObjectManager() {
			shroot = SharedObject.getLocal("shroot");
		}
		
		public static function get defaultManager():SharedObjectManager {
			if(instance == null)
				instance = new SharedObjectManager();
			
			return instance;
		}
		
		public function get sharedObject():* {
			return shroot;
		}
	}
}
