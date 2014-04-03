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
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;

    public class StyledTextField extends Sprite {

        private var tf:TextField;

        public static function Create(width:Number, height:Number, style:Object):StyledTextField {

            return new StyledTextField(style.colorBg, style.colorBorder, style.thicknessBorder, style.alphaBg,
                    style.sizeRound,
                    (width != 0? width : style.width),
                    (height != 0? height : style.height),
                    style.autoSize,
                    style.isMultiline,
                    style.sizeFont,
                    style.font,
                    style.colorText,
                    style.isBold,
                    style.isItalic,
                    style.align,
                    style.verticalAlign);
        }


        public function StyledTextField(colorBg:uint = 0xFFFFFF, colorBorder:uint = 0x000000,
                                        thicknessBorder:Number = 2,
                                        alphaBg:Number = 1,
                                        sizeRound:Number = 0,
                                        width:Number = 0,
                                        height:Number = 0,
                                        autoSize:String = "left",
                                        isMultiline:Boolean = false,
                                        sizeFont:int = 14,
                                        font:String = "Arial",
                                        colorText:uint = 0xDBF224,
                                        isBold:Boolean = false,
                                        isItalic:Boolean = false,
                                        align:String = "left",
                                        verticalAlign:String = "center") {

            this.graphics.beginFill(colorBg, alphaBg);
            if (thicknessBorder > 0)
                this.graphics.lineStyle(thicknessBorder, colorBorder, 1, true);
            this.graphics.drawRoundRect(0, 0, width, height, sizeRound);
            this.graphics.endFill();

            tf = new TextField();
            tf.antiAliasType = "advanced";
            tf.autoSize = autoSize;
            tf.multiline = isMultiline;
            tf.selectable = false;

            tf.defaultTextFormat = new TextFormat(font, sizeFont, colorText, isBold, isItalic, false,
                                                    null, null, align);

            tf.x = 5;
            if (verticalAlign == "top") {
                tf.y = 0;
            } else if (verticalAlign == "center") {
                tf.text = "100";
                tf.y = (height - tf.textHeight) / 2;
                tf.text = "";
            }

            this.addChild(tf);
        }

        public function get text():String {
            return tf.htmlText;
        }

        public function set text(value:String):void {
            tf.htmlText = value;
        }

        public function get textField():TextField {
            return tf;
        }

    }
}
