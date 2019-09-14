package se {
	
	public class DefaultDatabase {
		public static function arrivingBuses():Array {
			return new Array(
				new Hour(5, 46),
				new Hour(6, 51),
				new Hour(7, 51),
				new Hour(8, 21),
				new Hour(8, 51),
				new Hour(9, 21),
				new Hour(9, 51),
				new Hour(10, 21),
				new Hour(10, 51),
				new Hour(11, 21),
				new Hour(11, 51),
				new Hour(12, 21),
				new Hour(12, 51),
				new Hour(13, 51),
				new Hour(14, 51)
			);
		}
		
		public static function departingBuses():Array {
			return new Array(
				new Hour(5, 41),
				new Hour(6, 17),
				new Hour(6, 36),
				new Hour(7, 11),
				new Hour(7, 41),
				new Hour(8, 11),
				new Hour(8, 41),
				new Hour(9, 11),
				new Hour(9, 41),
				new Hour(10, 11),
				new Hour(10, 41),
				new Hour(11, 11),
				new Hour(11, 41),
				new Hour(12, 11),
				new Hour(12, 41),
				new Hour(13, 11),
				new Hour(13, 41),
				new Hour(14, 17),
				new Hour(14, 41),
				new Hour(15, 17),
				new Hour(15, 41),
				new Hour(16, 17),
				new Hour(16, 41),
				new Hour(17, 11),
				new Hour(17, 41),
				new Hour(18, 11)
			);
		}
		
		public static function start():Hour {
			return new Hour(8, 00);
		}
		
		public static function breaks():Array {
			return new Array(
				new Break(new Hour(8, 45), 10),
				new Break(new Hour(9, 40), 10),
				new Break(new Hour(10, 35), 10),
				new Break(new Hour(11, 30), 20),
				new Break(new Hour(12, 35), 20),
				new Break(new Hour(13, 40), 15),
				new Break(new Hour(14, 40), 5)
			);
		}
		
		public static function schedule():Array {
			return new Array(
				new SchoolDay(new Array(
					new SchoolHour("Język Polski s19", 1),
					new SchoolHour("Geografia s1", 2),
					new SchoolHour("WF", 3),
					new SchoolHour("WF", 4),
					new SchoolHour("Język Niem. s63 / Język Hiszp. s27", 5),
					new SchoolHour("Język Angielski s16 / s1", 6)
				)),
				
				new SchoolDay(new Array(
					new SchoolHour("Informatyka s20", 1),
					new SchoolHour("Matematyka s29", 2),
					new SchoolHour("Język Angielski s16 / s30", 3),
					new SchoolHour("Wiedza o Kulturze s27", 4),
					new SchoolHour("Basen", 5),
					new SchoolHour("Chemia s5", 6),
					new SchoolHour("Podstawy Przedsiębiorczości s4", 7),
					new SchoolHour("Godzina Wychowawcza s11", 8)
				)),
				
				new SchoolDay(new Array(
					new SchoolHour("Biologia s25", 1),
					new SchoolHour("Matematyka s12", 2),
					new SchoolHour("Edukacja dla Bezpieczeństwa s3", 3),
					new SchoolHour("Język Polski s27", 4),
					new SchoolHour("Język Polski s27", 5),
					new SchoolHour("Religia", 6)
				)),
				
				new SchoolDay(new Array(
					new SchoolHour("Język Polski s19", 2),
					new SchoolHour("Fizyka s10", 3),
					new SchoolHour("Matematyka s12", 4),
					new SchoolHour("Historia s19", 5),
					new SchoolHour("Język Niem. s11 / Język Hiszp. s27", 6),
					new SchoolHour("Podstawy Przedsiębiorczości s4", 7),
					new SchoolHour("Informatyka s20", 8)
				)),
				
				new SchoolDay(new Array(
					new SchoolHour("Religia", 1),
					new SchoolHour("Język Angielski s16 / s13", 2),
					new SchoolHour("Matematyka s12", 3),
					new SchoolHour("Język Polski s22", 4),
					new SchoolHour("Historia s19", 5),
					new SchoolHour("Wiedza o Społeczeństwie s25", 6)
				))
			);
		}
	}
}
