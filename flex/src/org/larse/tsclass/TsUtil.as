package org.larse.tsclass
{
	public class TsUtil
	{

		public static function score(value:String):int {
			var s:int = 3;
			if (value==null)
				return 0;
			switch (value.toLowerCase()) {
				case "high":
					s = 3;
					break;
				case "medium":
					s = 2;
					break;
				case "low":
					s = 1;
					break;
				default: //this should never happen
					s = 0; 
					break;
			}
			return s;
		}
	}
}