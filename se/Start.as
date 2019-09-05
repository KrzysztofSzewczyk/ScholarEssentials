package se {
	import flash.display.MovieClip;
	import flash.utils.setInterval;
	import flash.events.MouseEvent;
	
	public class Start {

		private var parent:MovieClip;
		private var clockFlipped:Boolean = false;
		public static var db:Database;

		public function zeroPad(number:int, width:int):String {
			var ret:String = "" + number;
			while(ret.length < width)
				ret = "0" + ret;
			return ret;
		}
		
		private function stringifyHour(hour:Hour):String {
			return zeroPad(hour.hour, 2) + ":" + zeroPad(hour.minute, 2);
		}

		public function Start(parent:MovieClip) {
			this.parent = parent;
			
			parent.Notes.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
				parent.NotesInstance.visible = true;
			});
			
			parent.Settings.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
				parent.SettingsInstance.visible = true;
			});
			
			db = new Database(new DefaultDatabase());
			
			var callback:Function = function() {
				var now:Date = new Date();
				
				parent.Time.text = now.hours + (clockFlipped ? ":" : " ") + zeroPad(now.minutes,2);
				
				var day:String;
				switch (now.day-1) {
					case 0: day = "Poniedziałek"; break;
					case 1: day = "Wtorek"; break;
					case 2: day = "Środa"; break;
					case 3: day = "Czwartek"; break;
					case 4: day = "Piątek"; break;
					case 5: day = "Sobota"; break;
					case 6: day = "Niedziela"; break;
				}
				
				parent.Date.text = day + ", " + zeroPad(now.date, 2) + "." + zeroPad(now.month + 1, 2) + "." + now.fullYear;
				clockFlipped = !clockFlipped;
				
				var setFlag:Boolean = true;
				
				/* Arriving bus */
				
				for(var i:int = 0; i < db.arrivingBuses.length; i++) {
					if(db.arrivingBuses[i].hour >= now.hours) {
						if(db.arrivingBuses[i].hour == now.hours && db.arrivingBuses[i].minute < now.minutes)
							continue;
						parent.BusArrivalTime.text = db.arrivingBuses[i].hour + ":" + db.arrivingBuses[i].minute;
						setFlag = false;
						break;
					}
				}
				
				if(setFlag == true) {
					parent.BusArrivalTime.text = "brak";
				}
				
				/* Departing bus */
				
				for(i = 0, setFlag = true; i < db.departingBuses.length; i++) {
					if(db.departingBuses[i].hour >= now.hours) {
						if(db.departingBuses[i].hour == now.hours && db.departingBuses[i].minute < now.minutes)
							continue;
						parent.BusDepartureTime.text = db.departingBuses[i].hour + ":" + db.departingBuses[i].minute;
						setFlag = false;
						break;
					}
				}
				
				if(setFlag == true) {
					parent.BusDepartureTime.text = "brak";
				}
				
				/* Break handling */
				
				for(i = 0, setFlag = true; i < db.breaks.length; i++) {
					if(db.breaks[i].time.hour >= now.hours) {
						if(db.breaks[i].time.hour == now.hours && db.breaks[i].time.minute < now.minutes)
							continue;
						parent.ClosestBreak.text = db.breaks[i].time.hour + ":" + db.breaks[i].time.minute;
						parent.ClosestBreakIn.text = ((db.breaks[i].time.hour * 60 + db.breaks[i].time.minute) - (now.hours * 60 + now.minutes)) + "m";
						setFlag = false;
						break;
					}
				}
				
				if(setFlag == true) {
					parent.ClosestBreak.text = "brak";
					parent.ClosestBreakIn.text = "n/am";
				}
				
				/* Now, update the schedule. */
				
				parent.LessonName1.text = "";
				parent.LessonName2.text = "";
				parent.LessonName3.text = "";
				parent.LessonName4.text = "";
				parent.LessonName5.text = "";
				parent.LessonName6.text = "";
				parent.LessonName7.text = "";
				parent.LessonName8.text = "";
				
				db.schedule[now.day-1].hours.forEach(function(e) {
					switch(e.hourid) {
						case 1: parent.LessonName1.text = e.name; break;
						case 2: parent.LessonName2.text = e.name; break;
						case 3: parent.LessonName3.text = e.name; break;
						case 4: parent.LessonName4.text = e.name; break;
						case 5: parent.LessonName5.text = e.name; break;
						case 6: parent.LessonName6.text = e.name; break;
						case 7: parent.LessonName7.text = e.name; break;
						case 8: parent.LessonName8.text = e.name; break;
					}
				});
				
				/* Now, update the next lesson. */
				
			};
			
			callback();
			setInterval(callback, 999);
		}

	}
	
}
