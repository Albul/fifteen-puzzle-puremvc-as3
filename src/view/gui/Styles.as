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
    import flash.filters.BitmapFilterType;

    public class Styles extends Object {

		public static const BUTTON_FLEX:Object = {
			"width": 0, 
			"height": 0, 
			"deltaWidth": 20, 
			"deltaHeight": 12, 
			"sizeRound": 8, 
			"colorBg": 0xF0F0F0, 
			"alphaBg": 0.9, 
			"thicknessBorder": 1, 
			"colorBorder": 0x676D71, 
			"alphaBorder": 1, 
			"sizeFont": 12, 
			"font": "Verdana", 
			"colorText": 0x000000, 
			"align": "center", 
			"isBold": true, 
			"isItalic": false, 
			"isMultiline": false, 
			"autoSize": "center", 
			"colorBgOver": 0xECECEC, 
			"colorBgDown": 0xA4DBFE, 
			"colorBorderOver": 0x0088DE
		};

        public static const SMALL_ORANGE_TEXT:Object = {
            "sizeFont": 18,
            "font": "Comic Sans MS",
            "colorText": 0xDBF224,
            "isMultiline": true,
            "colorBorder": 0x000000
        };

        public static const BIG_GREEN_TEXT:Object = {
            "sizeFont": 50,
            "font": "Comic Sans MS",
            "colorText": 0x1A790B,
            "colorBorder": 0x000000
        };

        public static const ORANGE_TEXT:Object = {
            "sizeFont": 28,
            "font": "Comic Sans MS",
            "colorText": 0xDBF224,
            "isMultiline": true,
            "colorBorder": 0x000000,
            "mouseEnabled": false
        };

        public static const ORANGE_TEXT_LINK:Object = {
            "sizeFont": 24,
            "font": "Comic Sans MS",
            "colorText": 0xDBF224,
            "isMultiline": true,
            "colorBorder": 0x000000,
            "mouseEnabled": true
        };

        public static const MENU_BUTTON:Object = {
            "width": 0,
            "height": 0,
            "deltaWidth": 36,
            "deltaHeight": 12,
            "sizeRound": 14,
            "colorBg": 0x673B15,
            "alphaBg": 0.9,
            "thicknessBorder": 0,
            "colorBorder": 0x676D71,
            "alphaBorder": 1,
            "colorBgOver": 0xFF6600,
            "colorBgDown": 0xFF6600,
            "colorBorderOver": 0x0088DE,
            "blurX": 4,
            "blurY": 4,
            "styleGlowOver": {
                "distance": 0,
                "angle": 45,
                "colors" : [0x000000, 0xFF6600],
                "alphas": [0, 1],
                "ratios": [0, 255],
                "blurX": 5,
                "blurY": 5,
                "strength": 2,
                "type":BitmapFilterType.OUTER
            }
        };

        public static const TEXT_FIELD:Object = {
            "width": 170,
            "height": 60,
            "sizeRound": 0,
            "colorBg": 0xFFFFFF,
            "alphaBg": 0.9,
            "thicknessBorder": 3,
            "colorBorder": 0x673B15,
            "alphaBorder": 1,
            "sizeFont": 42,
            "font": "Arial",
            "colorText": 0x4F2D10,
            "align": "left",
            "isBold": true,
            "isItalic": false,
            "isMultiline": false,
            "autoSize": "left",
            "verticalAlign": "center"
        };

        public static const TEXT_FIELD_VIEW2D:Object = {
            "width": 210,
            "height": 40,
            "sizeRound": 0,
            "colorBg": 0xFFFFFF,
            "alphaBg": 0.9,
            "thicknessBorder": 3,
            "colorBorder": 0x673B15,
            "alphaBorder": 1,
            "sizeFont": 24,
            "font": "Arial",
            "colorText": 0x4F2D10,
            "align": "left",
            "isBold": true,
            "isItalic": false,
            "isMultiline": false,
            "autoSize": "left",
            "verticalAlign": "center"
        };

        public static const TEXT_FIELD_VIEW3D:Object = {
            "width": 105,
            "height": 30,
            "sizeRound": 0,
            "colorBg": 0xFFFFFF,
            "alphaBg": 0.9,
            "thicknessBorder": 3,
            "colorBorder": 0x673B15,
            "alphaBorder": 1,
            "sizeFont": 20,
            "font": "Arial",
            "colorText": 0x4F2D10,
            "align": "left",
            "isBold": true,
            "isItalic": false,
            "isMultiline": false,
            "autoSize": "left",
            "verticalAlign": "center"
        };

        public static const BESTS_AREA:Object = {
            "width": 378,
            "height": 300,
            "sizeRound": 0,
            "colorBg": 0xFFFFFF,
            "alphaBg": 0.9,
            "thicknessBorder": 3,
            "colorBorder": 0x673B15,
            "alphaBorder": 1,
            "sizeFont": 16,
            "font": "Arial",
            "colorText": 0x4F2D10,
            "align": "left",
            "isBold": true,
            "isItalic": false,
            "isMultiline": true,
            "autoSize": "left",
            "verticalAlign": "top"
        };

        public static const ABOUT_AREA:Object = {
            "width": 378,
            "height": 98,
            "sizeRound": 0,
            "colorBg": 0xFFFFFF,
            "alphaBg": 0.9,
            "thicknessBorder": 3,
            "colorBorder": 0x673B15,
            "alphaBorder": 1,
            "sizeFont": 14,
            "font": "Comic Sans MS",
            "colorText": 0x4F2D10,
            "align": "justify",
            "isBold": true,
            "isItalic": false,
            "isMultiline": true,
            "autoSize": "left",
            "verticalAlign": "top"
        };

	}
}

