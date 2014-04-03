/**
 * Copyright (c) 2011-2012 Alexandr Albul
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
package view.components {

import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;


import view.MainMenuMediator;
import view.gui.Button;
import view.gui.StyledText;
import view.gui.StyledTextField;
import view.gui.Styles;

public class RecordsMenu extends Sprite {

	private var bBackMenu:Button;
	private var label:StyledText;
	private var labelName:StyledText;
	private var recordsBlock:Sprite; // Displays the time

	public function RecordsMenu() {
		label = StyledText.Create("Рекорды", 0, Styles.BIG_GREEN_TEXT);
		label.x = (MainMenuMediator.panelWidth - label.width) / 2;
		label.y = MainMenuMediator.PADDING * 2;
		this.addChild(label);

		labelName = StyledText.Create("Имя:", 20, Styles.ORANGE_TEXT);
		labelName.x = 40;
		labelName.y = label.y + label.height + MainMenuMediator.PADDING;
		this.addChild(labelName);

		var labelSteps:StyledText = StyledText.Create("Ходов:", 20, Styles.ORANGE_TEXT);
		labelSteps.x = 250;
		labelSteps.y = labelName.y;
		this.addChild(labelSteps);

		var labelTime:StyledText = StyledText.Create("Время:", 20, Styles.ORANGE_TEXT);
		labelTime.x = 340;
		labelTime.y = labelName.y;
		this.addChild(labelTime);

		recordsBlock = new Sprite();
		recordsBlock.graphics.beginFill(0xFFFFFF);
		recordsBlock.graphics.lineStyle(3, 0x673B15, 1, true);
		recordsBlock.graphics.drawRoundRect(0, 0, 378, 300, 0);
		recordsBlock.graphics.endFill();
		recordsBlock.x =  40;
		recordsBlock.y = labelSteps.y + labelSteps.height + MainMenuMediator.PADDING;
		this.addChild(recordsBlock);

		// Create button back to menu
		bBackMenu = Button.Create("Назад", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
		bBackMenu.x = (MainMenuMediator.panelWidth - bBackMenu.width) / 2;
		bBackMenu.y = recordsBlock.y + recordsBlock.height + MainMenuMediator.PADDING;
		this.addChild(bBackMenu);

		this.hide();
	}

	public function show():void {
		this.visible = true;

		var tween1:TweenLite = new TweenLite(label, 0.5, {alpha: 1});
		var tween3:TweenLite = new TweenLite(recordsBlock, 0.5, {alpha: 1});

		label.alpha = 0;
		recordsBlock.alpha = 0;

		tween1.play();
		tween3.play();
	}

	public function hide():void {
		this.visible = false;
	}

	public function setRecords(records:Array):void {
		while (recordsBlock.numChildren) {
			recordsBlock.removeChildAt(0);
		}

		var textFormat:TextFormat = new TextFormat("Arial", 16, 0x4F2D10, true);

		for (var i:int = 0; i < records.length; i++) {
			var textField:TextField = new TextField();
			textField.defaultTextFormat = textFormat;
			textField.text = (i + 1).toString() + ". " + records[i].name;
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.x = 4;
			textField.y = (textField.height + 5) * i + 5;
			recordsBlock.addChild(textField);
		}


		for (var i:int = 0; i < records.length; i++) {
			var textField:TextField = new TextField();
			textField.defaultTextFormat = textFormat;
			textField.text = records[i].steps;
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.x = 230;
			textField.y = (textField.height + 5) * i;
			recordsBlock.addChild(textField);
		}

		for (var i:int = 0; i < records.length; i++) {
			var textField:TextField = new TextField();
			textField.defaultTextFormat = textFormat;
			textField.text = records[i].time;
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.x = 330;
			textField.y = (textField.height + 5) * i;
			recordsBlock.addChild(textField);
		}
	}

}
}
