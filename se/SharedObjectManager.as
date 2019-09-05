package se {
	import flash.net.SharedObject;
	
	public class SharedObjectManager {
		private var shroot:SharedObject;
		
		private static var instance:SharedObjectManager;

		public function SharedObjectManager() {
			shroot = SharedObject.getLocal("shroot");
		}
		
		public static function get defaultManager():SharedObjectManager {
			if(instance == null)
				instance = new SharedObjectManager();
			
			return instance;
		}
		
		public function get sharedObject():SharedObject {
			return shroot;
		}
	}
}
