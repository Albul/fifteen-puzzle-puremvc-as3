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
import view.gui.Styles;


public class ChoiceGameMenu extends Sprite {

    private var label:StyledText;
    private var b2D:Button;
    private var b3D:Button;
    private var bBack:Button;

    public function ChoiceGameMenu() {
        label = StyledText.Create("Вариант игры:", 0, Styles.BIG_GREEN_TEXT);
        label.x = (MainMenuMediator.panelWidth - label.width) / 2;
        label.y = MainMenuMediator.PADDING * 2;
        this.addChild(label);

        b2D = Button.Create("Двухмерная 2D", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
        b2D.x = (MainMenuMediator.panelWidth - b2D.width) / 2;
        b2D.y = label.y + label.height + MainMenuMediator.PADDING * 3;
        this.addChild(b2D);

        b3D = Button.Create("Трехмерная 3D", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
        b3D.x = (MainMenuMediator.panelWidth - b3D.width) / 2;
        b3D.y = b2D.y + b2D.height + MainMenuMediator.PADDING;
        this.addChild(b3D);

        bBack = Button.Create("Назад", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
        bBack.x = (MainMenuMediator.panelWidth - bBack.width) / 2;
        bBack.y = b3D.y + b3D.height + MainMenuMediator.PADDING;
        this.addChild(bBack);

        this.hide();
    }

    public function show():void {
        this.visible = true;

        var delay:Number = 0.05;

        var tween1:TweenLite = new TweenLite(label, 0.5, {alpha: 1});
        var tween2:TweenLite = new TweenLite(b2D, 0.5, {x:b2D.x, delay: 0 * delay, ease:Back.easeOut});
        var tween3:TweenLite = new TweenLite(b3D, 0.5, {x:b3D.x, delay: 1 * delay, ease:Back.easeOut});
        var tween4:TweenLite = new TweenLite(bBack, 0.5, {x:bBack.x, delay: 2 * delay, ease:Back.easeOut});

        label.alpha = 0;
        b2D.x = this.stage.stageWidth;
        b3D.x = this.stage.stageWidth;
        bBack.x = this.stage.stageWidth;

        tween1.play();
        tween2.play();
        tween3.play();
        tween4.play();
    }

    public function hide():void {
        this.visible = false;
    }
}
}
