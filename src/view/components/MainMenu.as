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

public class MainMenu {

    private var Y_BUTTONS:Number;

    private var _container:Sprite;
    private var groupButtons:Sprite;

    private var label:StyledText;
    private var bNewGame:Button;
    private var bContinue:Button;
    private var bFinish:Button;
    private var bRecords:Button;
    private var bAbout:Button;
    private var bExit:Button;

    public function MainMenu() {
        _container = new Panel_design();
        groupButtons = new Sprite();
        _container.addChild(groupButtons);

        label = StyledText.Create("Главное меню", 0, Styles.BIG_GREEN_TEXT);
        label.x = (_container.width - label.width) / 2;
        label.y = MainMenuMediator.PADDING * 2;
        _container.addChild(label);

        Y_BUTTONS = label.y + label.height + MainMenuMediator.PADDING * 3;
        groupButtons.y = Y_BUTTONS;

        bContinue = Button.Create("Продолжить", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
        bContinue.x = (_container.width - bContinue.width) / 2;
        bContinue.y = 0;
        groupButtons.addChild(bContinue);

        bFinish = Button.Create("Завершить", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
        bFinish.x = (_container.width - bFinish.width) / 2;
        bFinish.y = bContinue.y + bContinue.height + MainMenuMediator.PADDING;
        groupButtons.addChild(bFinish);

        bNewGame = Button.Create("Новая игра", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
        bNewGame.x = (_container.width - bNewGame.width) / 2;
        bNewGame.y = bFinish.y;
        groupButtons.addChild(bNewGame);

        bRecords = Button.Create("Рекорды", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
        bRecords.x = (_container.width - bRecords.width) / 2;
        bRecords.y = bNewGame.y + bNewGame.height + MainMenuMediator.PADDING;
        groupButtons.addChild(bRecords);

        bAbout = Button.Create("Об игре", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
        bAbout.x = (_container.width - bAbout.width) / 2;
        bAbout.y = bRecords.y + bRecords.height + MainMenuMediator.PADDING;
        groupButtons.addChild(bAbout);

        bExit = Button.Create("Выход", Styles.MENU_BUTTON, Styles.ORANGE_TEXT);
        bExit.x = (_container.width - bExit.width) / 2;
        bExit.y = bAbout.y + bAbout.height + MainMenuMediator.PADDING;
        groupButtons.addChild(bExit);

        this.hide();
    }

    public function show(isPause:Boolean):void {
        label.visible = true;
        bRecords.visible = true;
        bAbout.visible = true;
        bExit.visible = true;
        if (isPause) {
            bContinue.visible = true;
            bFinish.visible = true;
            groupButtons.y = Y_BUTTONS;
        } else {
            bNewGame.visible = true;
            groupButtons.y = Y_BUTTONS - bContinue.height - MainMenuMediator.PADDING;
        }

        var tweens:Array = [];
        var delay:Number = 0.05;
        var factorDelay:int = 0;

        tweens.push(new TweenLite(label, 0.5, {alpha: 1}));
        if (isPause) {
            tweens.push(new TweenLite(bContinue, 0.5, {x:bContinue.x, delay: factorDelay++ * delay, ease:Back.easeOut}));
            tweens.push(new TweenLite(bFinish, 0.5, {x:bFinish.x, delay: factorDelay++ * delay, ease:Back.easeOut}));
        } else {
            tweens.push(new TweenLite(bNewGame, 0.5, {x:bNewGame.x, delay: factorDelay++ * delay, ease:Back.easeOut}));
        }
        tweens.push(new TweenLite(bRecords, 0.5, {x:bRecords.x, delay: factorDelay++ * delay, ease:Back.easeOut}));
        tweens.push(new TweenLite(bAbout, 0.5, {x:bAbout.x, delay: factorDelay++ * delay, ease:Back.easeOut}));
        tweens.push(new TweenLite(bExit, 0.5, {x:bExit.x, delay: factorDelay++ * delay, ease:Back.easeOut}));

        label.alpha = 0;
        if (isPause) {
            bContinue.x = _container.stage.stageWidth;
            bFinish.x = _container.stage.stageWidth;
        } else {
            bNewGame.x = _container.stage.stageWidth;
        }
        bRecords.x = _container.stage.stageWidth;
        bAbout.x = _container.stage.stageWidth;
        bExit.x = _container.stage.stageWidth;

        for each (var tween:TweenLite in tweens) {
            tween.play();
        }
    }

    public function hide():void {
        label.visible = false;
        bContinue.visible = false;
        bFinish.visible = false;
        bNewGame.visible = false;
        bRecords.visible = false;
        bAbout.visible = false;
        bExit.visible = false;
    }

    public function get container():Sprite {
        return _container;
    }
}
}
