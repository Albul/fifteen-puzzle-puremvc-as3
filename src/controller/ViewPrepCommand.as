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
package controller {

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

import view.AboutMenuMediator;

import view.ApplicationMediator;
import view.ChoiceGameMenuMediator;
import view.MainMenuMediator;
import view.RecordsMenuMediator;
import view.ResultMenuMediator;
import view.components.AboutMenu;
import view.components.ChoiceGameMenu;
import view.components.MainMenu;
import view.components.RecordsMenu;
import view.components.ResultMenu;

public class ViewPrepCommand extends SimpleCommand {

    override public function execute(notification:INotification):void {
        var application:Main = notification.getBody() as Main;
        facade.registerMediator(new ApplicationMediator(application));

        var mainMenu:MainMenu = new MainMenu();
        application.addChild(mainMenu.container);

        var mainMenuMediator = new MainMenuMediator(mainMenu);
        facade.registerMediator(mainMenuMediator);

        var choiceGameMenu:ChoiceGameMenu = new ChoiceGameMenu();
        mainMenu.container.addChild(choiceGameMenu);
        facade.registerMediator(new ChoiceGameMenuMediator(choiceGameMenu));

        var aboutMenu:AboutMenu = new AboutMenu();
        mainMenu.container.addChild(aboutMenu);
        facade.registerMediator(new AboutMenuMediator(aboutMenu));

        var recordsMenu:RecordsMenu = new RecordsMenu();
        mainMenu.container.addChild(recordsMenu);
        facade.registerMediator(new RecordsMenuMediator(recordsMenu));

        var resultMenu:ResultMenu = new ResultMenu();
        mainMenu.container.addChild(resultMenu);
        facade.registerMediator(new ResultMenuMediator(resultMenu));

        sendNotification(ApplicationFacade.SHOW_MAIN_MENU);
        /*
         mainMenuMediator.showContainer();
         var stageProxy:StageProxy = facade.retrieveProxy(StageProxy.NAME) as StageProxy;
         stageProxy.sendResize();
         mainMenuMediator.showMenu(false);
         */
    }
}
}
