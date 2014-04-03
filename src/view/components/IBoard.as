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

public interface IBoard {

	function startGame(puzzlesProxy:PuzzlesProxy):void;
	function updateTime(time:String):void;
	function updatePuzzles(numPuzzle:int, indexPuzzle:Index, steps:int);

	function show():void;
	function hide():void;

	function get container():Sprite;

}
}
