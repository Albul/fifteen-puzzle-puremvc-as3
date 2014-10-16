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

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.patterns.mediator.Mediator;

import view.components.ResultMenu;
import view.gui.Button;

public class ResultMenuMediator extends Mediator implements IMediator {

    public static const NAME:String = "resultMenuMediator";

    private var menu:ResultMenu;

    public function ResultMenuMediator(viewComponent:Object) {
        super(NAME, viewComponent);

        menu = viewComponent as ResultMenu;
        menu.addEventListener(MouseEvent.CLICK, onMenuClick);
    }

    public function showMenu():void {
        menu.show();
    }

    public function hideMenu():void {
        menu.hide();
    }

    private function onMenuClick(e:MouseEvent):void {
        if (e.target is SimpleButton) {
            switch (Button(e.target.parent).title) {
                case "Назад":
                    sendNotification(ApplicationFacade.SHOW_MAIN_MENU, this);
                    break;

                default :
                    break;
            }
        }
    }
}
}
