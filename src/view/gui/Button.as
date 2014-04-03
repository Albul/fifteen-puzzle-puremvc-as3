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
    import flash.display.SimpleButton;
    import flash.display.Sprite;

	public class Button extends Sprite {
		
		public var title:String;

        public static function Create(title:String, style:Object, styleText:Object):Button {
            return new Button(title, style.width, style.height, style.deltaWidth, style.deltaHeight, style.colorBg,
                    style.colorBgOver,
                    style.colorBgDown,
                    style.alphaBg,
                    style.thicknessBorder,
                    style.colorBorder,
                    style.sizeRound,
                    style.blurX,
                    style.blurY,
                    style.styleGlowUp,
                    style.styleGlowOver,
                    style.styleGlowDown,
                    styleText);
        }

		public function Button(title:String, width:int = 0, height:int = 0,
                               deltaWidth:int = 20,
                               deltaHeight:int = 12,
                               colorBg:uint = 0x673B15,
                               colorBgOver:uint = 0xFF6600,
                               colorBgDown:uint = 0xFF6600,
                               alphaBg:Number = 0.9,
                               thicknessBorder:int = 0,
                               colorBorder:uint = 0x676D71,
                               sizeRound:int = 14,
                               blurX:int = 0,
                               blurY:int = 0,
                               styleGlowUp:Object = null,
                               styleGlowOver:Object = null,
                               styleGlowDown:Object = null,
                               styleText:Object = null) {
			this.title = title;

            var buttonText:StyledText = StyledText.Create(title, 0, styleText);
            buttonText.mouseEnabled = false;
			this.addChild(buttonText);
			
			var w:Number = buttonText.width + deltaWidth;
			var h:Number = buttonText.height + deltaHeight;
			if (width > 0) {
                w = width;
                buttonText.x = (w - buttonText.width) / 2;
			} else {
                w = buttonText.width + deltaWidth;
                buttonText.x = deltaWidth / 2;
			}

			if (height > 0) {
                h = height;
                buttonText.y = (h - buttonText.height) / 2;
			} else {
                h = buttonText.height + deltaHeight;
                buttonText.y = deltaHeight / 2 - styleText.sizeFont / 15;
			}

			var button:SimpleButton = new SimpleButton();
			button.upState        	= new ButtonDisplayState(colorBg, alphaBg, thicknessBorder, colorBorder, w, h,
                                            sizeRound, blurX, blurY, styleGlowUp);
			button.overState     	= new ButtonDisplayState(colorBgOver, alphaBg, thicknessBorder, colorBorder, w, h,
                                            sizeRound, blurX, blurY, styleGlowOver);
			button.downState      	= new ButtonDisplayState(colorBgDown, alphaBg, thicknessBorder, colorBorder, w, h,
                                            sizeRound, blurX, blurY, styleGlowDown);
			button.hitTestState   	= button.overState;
			button.useHandCursor  	= true;
			this.addChildAt(button, 0);
		}

		public function disable():void {
			this.alpha = 0.5;
			this.mouseChildren = false;
			this.mouseEnabled = false;
		}
		
	}
}

import flash.display.Sprite;
import flash.filters.BitmapFilterQuality;
import flash.filters.BlurFilter;
import flash.filters.GradientGlowFilter;

class ButtonDisplayState extends Sprite {

    public function ButtonDisplayState(colorBg:int, alphaBg:Number, border:Number, colorBorder:int, width:Number,
                                       height:Number,
                                       sizeRound:int,
                                       blurX:int,
                                       blurY:int,
                                       styleGlow:Object = null) {
        this.graphics.beginFill(colorBg, alphaBg);
			if (border > 0)											
				this.graphics.lineStyle(border, colorBorder, 1, true);	
		this.graphics.drawRoundRect(0, 0, width, height, sizeRound, sizeRound);
		this.graphics.endFill();

        var arrFilters:Array = new Array();
        if (blurX > 0 && blurY > 0) {
            var blurFilter:BlurFilter = new BlurFilter(blurX, blurY, 2);
            arrFilters.push(blurFilter);
        }

        var gradientGlow:GradientGlowFilter;
        if (styleGlow) {
            gradientGlow = new GradientGlowFilter(styleGlow.distance, styleGlow.angle,
                    styleGlow.colors,
                    styleGlow.alphas,
                    styleGlow.ratios,
                    styleGlow.blurX,
                    styleGlow.blurY,
                    styleGlow.strength,
                    BitmapFilterQuality.HIGH,
                    styleGlow.type);
            arrFilters.push(gradientGlow);
        }
        this.filters = arrFilters;
    }
}