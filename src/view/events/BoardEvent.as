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
package view.events {

import flash.events.Event;

public class BoardEvent extends Event {

    public static const PUZZLE_CLICKED:String = "puzzleClicked";
    public static const PAUSE_CLICKED:String = "pauseClicked";
    public static const FINISH_CLICKED:String = "finishClicked";

    private var _number:int;

    public function BoardEvent(type:String, number:int = NaN, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
        this._number = number;
    }

    public override function clone():Event {
        return new BoardEvent(type, number, bubbles, cancelable);
    }


    public override function toString():String {
        return formatToString("EventModel", "data", "step", "bubbles", "cancelable", "eventPhase");
    }

    public function get number():int {
        return _number;
    }
}
}
