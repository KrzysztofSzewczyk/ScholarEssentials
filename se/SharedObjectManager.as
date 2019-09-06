package se {
	import flash.net.SharedObject;
	
	public class SharedObjectManager {
		public static var progmem:SharedObject = SharedObject.getLocal("progmem");
	}
}
