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
    import flash.events.Event;
    import flash.filters.BlurFilter;

    import flash.text.TextField;
    import flash.text.TextFormat;

    import com.greensock.*;
    import com.greensock.easing.*;

    /**
     * Class allows to create a notification in the form of text in a rectangle
     */
    public class Message extends Sprite {

        private var time:Number;

        /**
         *  Constructor
         * @param text Notification text
         * @param colorBg Background color of notification
         * @param alphaBg Background transparency
         * @param time Time of fade notification
         * @param sizeFont
         * @param isBold
         * @param font
         * @param width
         * @param height
         * @param sizeRound Rounded corners of notification
         */
        public function Message(text:String, colorBg:uint = 0x00FF00, alphaBg:Number = 1, time:Number = 4,
                                sizeFont:int = 32, isBold:Boolean = true, font:String = "Tahoma",
                                width:int = 0, height:int = 0, sizeRound:int = 45) { // 0xFF0000
            this.time = time;

            var format:TextFormat = new TextFormat();
            format.font = font;
            format.color = 0x000000;
            format.size = sizeFont;
            format.align = "center";
            format.bold = isBold;

            var tf:TextField = new TextField();
            tf.autoSize = "left";
            tf.defaultTextFormat = format;
            tf.antiAliasType = "advanced";
            tf.selectable = false;
            tf.multiline = true;
            tf.htmlText = text;

            var myBlurFilter:BlurFilter = new BlurFilter(1, 1, 2);
            var myArrayFilters:Array = new Array(myBlurFilter);
            tf.filters = myArrayFilters;
            tf.x = - tf.textWidth / 2;
            tf.y = - tf.textHeight / 2;
            this.addChild(tf);

            graphics.beginFill(colorBg, alphaBg);
            if (width == 0 && height == 0) {
                if (sizeRound > 0)
                    graphics.drawRoundRect(tf.x - 40, tf.y - 18, tf.textWidth + 80, tf.textHeight + 40, sizeRound);
                else
                    graphics.drawRect(tf.x - 40, tf.y - 18, tf.textWidth + 80, tf.textHeight + 40);
            }
            else {
                if (sizeRound > 0)
                    graphics.drawRoundRect( -width / 2, -height / 2, width, height, sizeRound);
                else
                    graphics.drawRect( -width / 2, -height / 2, width, height);
            }
            graphics.endFill();

            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
        }


//-------------------------------------------------------------------------------------------------
//
//  Events handlers
//
//-------------------------------------------------------------------------------------------------

        private function onAddToStage(e:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
            if (this.time > 0)
                TweenLite.to(this, time, { alpha: 0, ease: Back.easeIn, onComplete: onComplete});
        }

        private function onComplete():void {
            if (stage != null && stage.contains(this))
                stage.removeChild(this);
        }

    }
}