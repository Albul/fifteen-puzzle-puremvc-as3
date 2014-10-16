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

import flash.events.IEventDispatcher;

import model.PuzzlesProxy;
import model.StageProxy;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

import view.components.IBoard;
import view.events.BoardEvent;

public class BoardMediator extends Mediator implements IMediator {

    public static const NAME:String = "boardMediator";

    public static const DURATION:Number = 0.3; // Duration moving puzzle

    public function BoardMediator(viewComponent:Object) {
        super(NAME, viewComponent);
        boardDispatcher.addEventListener(BoardEvent.PUZZLE_CLICKED, onPuzzleClicked);
        boardDispatcher.addEventListener(BoardEvent.FINISH_CLICKED, onFinishClicked);
    }

    public function showBoard():void {
        board.show();
    }

    public function hideBoard():void {
        board.hide();
    }

    /**
     * List of events which will react this mediator
     * @return
     */
    override public function listNotificationInterests():Array {
        return [
            ApplicationFacade.PUZZLES_CREATED,
            ApplicationFacade.PUZZLES_CHANGED,
            ApplicationFacade.TIME_UPDATED,
            ApplicationFacade.STAGE_RESIZE
        ];
    }

    /**
     * Handler of all events that are of interest to this mediator
     * @param notification
     */
    override public function handleNotification(notification:INotification):void {
        switch (notification.getName()) {

            case ApplicationFacade.PUZZLES_CREATED:
                board.startGame(notification.getBody() as PuzzlesProxy);
                break;

            case ApplicationFacade.PUZZLES_CHANGED:
                var params:Object = notification.getBody();
                board.updatePuzzles(params.number, params.index, params.steps);
                break;

            case ApplicationFacade.TIME_UPDATED:
                board.updateTime(notification.getBody() as String);
                break;

            case ApplicationFacade.STAGE_RESIZE:
                var stage:StageProxy = notification.getBody() as StageProxy;
                board.container.x = (stage.stageWidth - board.container.width) / 2;
                board.container.y = (stage.stageHeight -board.container.height) / 2;
                break;

            default:
                break;
        }
    }

    private function get board():IBoard {
        return viewComponent as IBoard;
    }

    private function get boardDispatcher():IEventDispatcher {
        return viewComponent as IEventDispatcher;
    }

    private function onPuzzleClicked(e:BoardEvent):void {
        sendNotification(ApplicationFacade.CMD_PUZZLE_CLICK, e.number);
    }

    private function onFinishClicked(e:BoardEvent):void {
        sendNotification(ApplicationFacade.CMD_FINISH);
    }
}
}
