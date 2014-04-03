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
import flash.display.Sprite;

import model.PuzzlesProxy;
import model.utils.Index;

public class Board3D implements IBoard {

    public function Board3D(application:Main) {
        trace("game 3d started")
    }

    public function setSize(stageWidth:Number, stageHeight:Number):void {
    }

    public function updateTime(time:String):void {
    }

	public function startGame(puzzlesProxy:PuzzlesProxy):void {
	}

	public function updatePuzzles(number:int, index:Index, steps:int) {
	}

	public function show():void {
	}

	public function hide():void {
	}

	public function get container():Sprite {
		return new Sprite();
	}
}
}
