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
package view {
import flash.display.SimpleButton;
import flash.events.MouseEvent;

import model.StageProxy;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

import view.components.MainMenu;
import view.gui.Button;

public class MainMenuMediator extends Mediator implements IMediator {

    public static const NAME:String = "mainMenuMediator";

    public static const PADDING:int = 15;
    public static var panelWidth:Number;

    private var menu:MainMenu;

    public function MainMenuMediator(viewComponent:Object) {
        super(NAME, viewComponent);

        menu = viewComponent as MainMenu;
        panelWidth = menu.container.width;
        menu.container.addEventListener(MouseEvent.CLICK, onMenuClick);
    }

    override public function listNotificationInterests():Array {
        return [
            ApplicationFacade.STAGE_RESIZE
        ];
    }

    override public function handleNotification(notification:INotification):void {
        switch (notification.getName()) {

            case ApplicationFacade.STAGE_RESIZE:
                var stage:StageProxy = notification.getBody() as StageProxy;
                menu.container.x = (stage.stageWidth - panelWidth) / 2;
                menu.container.y = (stage.stageHeight - menu.container.height) / 2;
                break;

            default:
                break;
        }
    }

    public function showMenu(isPause:Boolean):void {
        menu.show(isPause);
    }

    public function hideMenu():void {
        menu.hide();
    }

    public function showContainer():void {
        menu.container.visible = true;
    }

    public function hideContainer():void {
        menu.container.visible = false;
    }

    private function onMenuClick(e:MouseEvent):void {

        if (e.target is SimpleButton) {
            switch (Button(e.target.parent).title) {
                case "Завершить":
                    sendNotification(ApplicationFacade.CMD_FINISH, null);
                    break;
                case "Новая игра":
                    sendNotification(ApplicationFacade.SHOW_CHOICE_GAME, null);
                    break;
                case "Рекорды":
                    sendNotification(ApplicationFacade.SHOW_RECORDS, null);
                    break;
                case "Об игре":
                    sendNotification(ApplicationFacade.SHOW_ABOUT, null);
                    break;
                case "Выход":
                    sendNotification(ApplicationFacade.CMD_EXIT, null);
                    break;
            }
        }
    }
}
}
