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

import model.PuzzlesProxy;
import model.StageProxy;
import model.TimeProxy;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

import view.ApplicationMediator;
import view.BoardMediator;
import view.ChoiceGameMenuMediator;
import view.MainMenuMediator;
import view.components.Board2D;
import view.components.Board3D;
import view.components.IBoard;

public class NewGameCommand extends SimpleCommand {

	override public function execute(notification:INotification):void {
		var param:Object = notification.getBody();

		var puzzleProxy:PuzzlesProxy = facade.retrieveProxy(PuzzlesProxy.NAME) as PuzzlesProxy;
		var timeProxy:TimeProxy = facade.retrieveProxy(TimeProxy.NAME) as TimeProxy;
		var stageProxy:StageProxy = facade.retrieveProxy(StageProxy.NAME) as StageProxy;

		var mainMenuMediator:MainMenuMediator = facade.retrieveMediator(MainMenuMediator.NAME) as MainMenuMediator;
		mainMenuMediator.hideContainer();

		var choiceGameMenuMediator:ChoiceGameMenuMediator =
				facade.retrieveMediator(ChoiceGameMenuMediator.NAME) as ChoiceGameMenuMediator;
		choiceGameMenuMediator.hideMenu();

		var applicationMediator:ApplicationMediator
				= facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;

		var board:IBoard = (param.type == "2d"? new Board2D(applicationMediator.application)
				: new Board3D(applicationMediator.application));


		facade.registerMediator(new BoardMediator(board));

		puzzleProxy.init();
		timeProxy.init();
		stageProxy.sendResize();
	}
}
}
