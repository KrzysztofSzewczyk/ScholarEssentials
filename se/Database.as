package se {
	
	public class Database {
		public var arrivingBuses:Array;
		public var departingBuses:Array;
		public var start:Hour;
		public var breaks:Array;
		public var schedule:Array;
		
		public static var started:Boolean = true;
		
		public function Database(d:DefaultDatabase = null) {
			if(d != null) {
				this.arrivingBuses = DefaultDatabase.arrivingBuses();
				this.breaks = DefaultDatabase.breaks();
				this.departingBuses = DefaultDatabase.departingBuses();
				this.schedule = DefaultDatabase.schedule();
				this.start = DefaultDatabase.start();
			}
		}
	}
	
}
