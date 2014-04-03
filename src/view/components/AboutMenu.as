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
import com.greensock.easing.Back;

import flash.display.Sprite;


import view.MainMenuMediator;
import view.gui.Button;
import view.gui.StyledText;
import view.gui.StyledTextField;
import view.gui.Styles;

public class AboutMenu extends Sprite {

   	private var lTitle:StyledText;
   	private var lAbout:StyledTextField;
   	private var lAuthor:StyledText;
   	private var lSite:StyledText;
	private var bBack:Button;

	public function AboutMenu() {
		lTitle = StyledText.Create("Об игре", 0, Styles.BIG_GREEN_TEXT);
		lTitle.x = (MainMenuMediator.panelWidth - lTitle.width) / 2;
		lTitle.y = MainMenuMediator.PADDING;
		this.addChild(lTitle);

		lAbout = StyledTextField.Create(0, 0, Styles.ABOUT_AREA);
		lAbout.text = "<br> Игра создана и выложена на Github для обучения <br>"
				+ " подрастающего поколения.<br>"
				+ " Специально для сайта <a href='event:http://as3.com.ua'><strong>as3.com.ua</strong></a>";
		lAbout.x = 40;
		lAbout.y = lTitle.y + lTitle.height + MainMenuMediator.PADDING * 2;
		this.addChild(lAbout);

		lAuthor = StyledText.Create("Автор: Александр Албул", 0, Styles.ORANGE_TEXT_LINK);
		lAuthor.x = (MainMenuMediator.panelWidth - lAuthor.width) / 2;
		lAuthor.y = lAbout.y + lAbout.height + MainMenuMediator.PADDING;
		this.addChild(lAuthor);

		lSite = StyledText.Create("Сайт: http://as3.com.ua", 20, Styles.ORANGE_TEXT_LINK);
		lSite.x = (MainMenuMediator.panelWidth - lSite.width) / 2;
		lSite.y = lAuthor.y + lAuthor.height + MainMenuMediator.PADDING;
		this.addChild(lSite);

		bBack = Button.Create("Назад", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
		bBack.x = (MainMenuMediator.panelWidth - bBack.width) / 2;
		bBack.y = lSite.y + lSite.height + MainMenuMediator.PADDING * 2;
		this.addChild(bBack);

		this.hide();
	}

	public function show():void {
		this.visible = true;

		var delay:Number = 0.05;

		var tween1:TweenLite = new TweenLite(lTitle, 0.5, {alpha: 1});
		var tween2:TweenLite = new TweenLite(lAbout, 0.5, {alpha: 1});
		var tween3:TweenLite = new TweenLite(lAuthor, 0.5, {x:lAuthor.x, delay: 0 * delay, ease:Back.easeOut});
		var tween4:TweenLite = new TweenLite(lSite, 0.5, {x:lSite.x, delay: 1 * delay, ease:Back.easeOut});
		var tween5:TweenLite = new TweenLite(bBack, 0.5, {x:bBack.x, delay: 2 * delay, ease:Back.easeOut});

		lTitle.alpha = 0;
		lAbout.alpha = 0;
		lAuthor.x = this.stage.stageWidth;
		lSite.x = this.stage.stageWidth;
		bBack.x = this.stage.stageWidth;

		tween1.play();
		tween2.play();
		tween3.play();
		tween4.play();
		tween5.play();
	}

	public function hide():void {
		this.visible = false;
	}

}
}
