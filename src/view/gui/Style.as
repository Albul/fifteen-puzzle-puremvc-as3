/*
 * Copyright 2012 Alexandr Albul
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package view.gui {

	public class Style extends Object {

        // Text constants
        public static const FONT_SIZE:String = "fontSize";
		public static const FONT:String = "font";
        public static const COLOR_TEXT:String = "colorText";
		public static const ALIGN:String = "align";
		public static const IS_BOLD:String = "isBold";
		public static const IS_ITALIC:String = "isItalic";
		public static const IS_MULTILINE:String = "isMultiline";
		public static const AUTO_SIZE:String = "autoSize";

		// Background
        public static const COLOR_BG:String = "colorBg";
        public static const COLOR_BG_OVER:String = "colorBgOver";
        public static const COLOR_BG_DOWN:String = "colorBgDown";
        public static const ALPHA_BG:String = "alphaBg";

		// Border
        public static const THICKNESS_BORDER:String = "thicknessBorder";
        public static const COLOR_BORDER:String = "colorBorder";
        public static const COLOR_BORDER_OVER:String = "colorBorderOver";
        public static const ALPHA_BORDER:String = "alphaBorder";

		// Size
		public var width:Number;
		public var height:Number;
		public var deltaWidth:Number;
		public var deltaHeight:Number;
		public var sizeRound:int;
	}
}