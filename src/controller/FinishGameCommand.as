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

import view.BoardMediator;

import view.MainMenuMediator;
import view.ResultMenuMediator;

public class FinishGameCommand extends SimpleCommand {

	override public function execute(notification:INotification):void {
		var boardMediator:BoardMediator = facade.retrieveMediator(BoardMediator.NAME) as BoardMediator;
		var mainMenuMediator:MainMenuMediator = facade.retrieveMediator(MainMenuMediator.NAME) as MainMenuMediator;
		var resultMenuMediator:ResultMenuMediator = facade.retrieveMediator(ResultMenuMediator.NAME) as ResultMenuMediator;

		boardMediator.hideBoard();
		mainMenuMediator.showContainer();
		mainMenuMediator.hideMenu();
//		sendNotification(ApplicationFacade.STAGE_RESIZE);
		resultMenuMediator.showMenu();
	}
}
}
