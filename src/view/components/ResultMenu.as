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

import flash.display.Sprite;

import view.MainMenuMediator;
import view.gui.Button;
import view.gui.StyledText;
import view.gui.StyledTextField;
import view.gui.Styles;

public class ResultMenu extends Sprite {

	private var label:StyledText;
	private var labelSteps:StyledText;
	private var labelTime:StyledText;
	private var bBackMenu:Button;
	private var tfTime:StyledTextField;
	private var tfSteps:StyledTextField;

	public function ResultMenu() {
		label = StyledText.Create("Результаты", 0, Styles.BIG_GREEN_TEXT);
		label.x = (MainMenuMediator.panelWidth - label.width) / 2;
		label.y = MainMenuMediator.PADDING * 2;
		this.addChild(label);

		labelSteps = StyledText.Create("Хода:", 42, Styles.ORANGE_TEXT);
		labelSteps.y = label.y + label.height + MainMenuMediator.PADDING;
		this.addChild(labelSteps);

		tfSteps = StyledTextField.Create(0, 0, Styles.TEXT_FIELD);
		tfSteps.x =  (MainMenuMediator.panelWidth - tfSteps.width) / 2;
		tfSteps.y = labelSteps.y + labelSteps.height + MainMenuMediator.PADDING / 3;
		tfSteps.text = "100";
		this.addChild(tfSteps);

		labelSteps.x = tfSteps.x;

		labelTime = StyledText.Create("Время:", 42, Styles.ORANGE_TEXT);
		labelTime.x = tfSteps.x;
		labelTime.y = tfSteps.y + tfSteps.height + MainMenuMediator.PADDING * 2;
		this.addChild(labelTime);

		tfTime = StyledTextField.Create(0, 0, Styles.TEXT_FIELD);
		tfTime.x =  (MainMenuMediator.panelWidth - tfSteps.width) / 2;
		tfTime.y = labelTime.y + labelTime.height + MainMenuMediator.PADDING / 3;
		tfTime.text = "100";
		this.addChild(tfTime);

		// Create button back to menu
		bBackMenu = Button.Create("Назад", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
		bBackMenu.x = (MainMenuMediator.panelWidth - bBackMenu.width) / 2;
		bBackMenu.y = tfTime.y + tfTime.height + MainMenuMediator.PADDING * 3;
		this.addChild(bBackMenu);

		this.hide();
	}

	public function show():void {
		this.visible = true;
	}

	public function hide():void {
		this.visible = false;
	}

	public function setResult():void {

	}

}
}
