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
    import flash.filters.BitmapFilterQuality;
    import flash.filters.BitmapFilterType;
    import flash.filters.BlurFilter;
    import flash.filters.GradientGlowFilter;
    import flash.text.AntiAliasType;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;

    public class StyledText extends TextField {

        public static function Create(text:String, sizeFont:int, style:Object):StyledText {
            return new StyledText(text,
                    (sizeFont != 0? sizeFont : style.sizeFont),
                    style.font,
                    style.colorText,
                    style[Style.IS_MULTILINE],
                    style.colorBorder,
                    style.mouseEnabled);
        }

        public function StyledText(text:String = null, sizeFont:int = 14,
                                   font:String = "Comic Sans MS",
                                   colorText:uint = 0xDBF224,
                                   isMultiline:Boolean = false,
                                   colorBorder:uint = 0x000000,
                                   mouseEnabled:Boolean = false) {
            this.mouseEnabled = mouseEnabled;
            var format:TextFormat = new TextFormat();
            format.font = font;
            format.color = colorText;
            format.size = sizeFont;
            format.align = "center";
            format.bold = true;

            this.defaultTextFormat = format;
            this.selectable = false;
            this.multiline = isMultiline;
            this.antiAliasType = AntiAliasType.ADVANCED;
            this.autoSize = TextFieldAutoSize.LEFT;
            this.htmlText = text;

            var gradientGlowFilter: GradientGlowFilter = new GradientGlowFilter();
            gradientGlowFilter.distance = 0;
            gradientGlowFilter.angle = 45;
            gradientGlowFilter.colors = [colorBorder, colorBorder];
            gradientGlowFilter.alphas = [0, 1];
            gradientGlowFilter.ratios = [0, 255];
            gradientGlowFilter.blurX = 2;
            gradientGlowFilter.blurY = 2;
            gradientGlowFilter.strength = 3;
            gradientGlowFilter.quality = BitmapFilterQuality.HIGH;
            gradientGlowFilter.type = BitmapFilterType.OUTER;

            var blurFilter:BlurFilter = new BlurFilter(1, 1, 2);
            this.filters = [blurFilter, gradientGlowFilter];
        }

    }
}