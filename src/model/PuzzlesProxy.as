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
package model {

import model.utils.ArrayUtils;
import model.utils.Index;
import model.vo.PuzzlesVO;

import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.proxy.Proxy;

public class PuzzlesProxy extends Proxy implements IProxy {

    public static const NAME = "puzzlesProxy";

    private var _puzzlesVO:PuzzlesVO;

    private var _matrixProxy:MatrixProxy;

    public function PuzzlesProxy(data:PuzzlesVO) {
        super(NAME, data);

        _puzzlesVO = this.getData() as PuzzlesVO;
    }

    public function init():void {
        _matrixProxy = facade.retrieveProxy(MatrixProxy.NAME) as MatrixProxy;

        _puzzlesVO.number = 15;
        _puzzlesVO.rows = 4;
        _puzzlesVO.cols = 4;
        _puzzlesVO.steps = 0;

        var randArray:Array = ArrayUtils.getRandomArray(0, _puzzlesVO.number);
        var index:int = 0;

        for (var i:int = 1; i <= _puzzlesVO.rows; i++) {
            for (var j:int = 1; j <= _puzzlesVO.cols; j++) {
                _matrixProxy.put(i.toString() + "," + j.toString(), randArray[index]) ;
                index++;
            }
        }

        sendNotification(ApplicationFacade.PUZZLES_CREATED, this);
    }

    /**
     * Try to move the box
     * @param numPuzzle
     */
    public function tryChange(numPuzzle:int):void {
//		var index:String = getKey(numPuzzle);

        if (nearEmpty(numPuzzle)) {
            _matrixProxy.swap(0, numPuzzle);
            _puzzlesVO.steps++;

            sendNotification(ApplicationFacade.PUZZLES_CHANGED,
                    {number: numPuzzle, index: matrixProxy.getIndex(numPuzzle), steps: _puzzlesVO.steps});


            if (boxInPlace(numPuzzle)) {
//				this.dispatchEvent(new EventModel(EventModel.GAME_COMPLETE, NaN));		// If all the boxes in place to notify the end of the game
            }
        }
    }

    /**
     * @private
     * Searching for an empty place near the box
     */
    private function nearEmpty(numPuzzle:int):Boolean
    {
        var indx:Index = _matrixProxy.getIndex(numPuzzle);

        if ((_matrixProxy.getValue(indx.generateIndx(1, 0).index) == 0) // bottom
                || (_matrixProxy.getValue(indx.generateIndx(-1, 0).index) == 0) // top
                || (_matrixProxy.getValue(indx.generateIndx(0, 1).index) == 0) // right
                || (_matrixProxy.getValue(indx.generateIndx(0, -1).index) == 0)) { // left
            return true;
        } else {
            return false;
        }
    }

    /**
     * @private
     * Checking the completion of the game
     */
    private function boxInPlace(numBox:int):Boolean {
        var curI:int = _matrixProxy.getIndex(numBox).i;
        var curJ:int = _matrixProxy.getIndex(numBox).j;
        var origI:int = (numBox % 4 > 0? Math.floor(numBox / 4) + 1 : (numBox / 4) as int);
        var origJ:int = (numBox % 4 != 0)? (numBox % 4) : 4;
        if (curI == origI && curJ == origJ) { // If the current box is in place, then check all the boxes
            for (var i:int = 1; i <= _puzzlesVO.number; i++) {
                curI = _matrixProxy.getIndex(i).i;
                curJ = _matrixProxy.getIndex(i).j;
                origI = (i % 4 > 0? Math.floor(i / 4) + 1 : (i / 4) as int);
                origJ = (i % 4 != 0)? (i % 4) : 4;
                if (curI != origI && curJ != origJ) { // If any out of place
                    return false;
                }
            }
        }
        else {
            return false;
        }

        return true; // Returns true if everything in its place
    }

    public function get number():int {
        return _puzzlesVO.number;
    }

    public function get steps():int {
        return _puzzlesVO.steps;
    }

    public function get puzzlesVO():PuzzlesVO {
        return _puzzlesVO;
    }

    public function get matrixProxy():MatrixProxy {
        return _matrixProxy;
    }
}
}
