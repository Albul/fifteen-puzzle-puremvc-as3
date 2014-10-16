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

import com.greensock.TweenMax;

import flash.display.Sprite;

import flash.events.EventDispatcher;
import flash.events.MouseEvent;

import model.PuzzlesProxy;
import model.utils.Index;

import view.BoardMediator;
import view.events.BoardEvent;
import view.gui.Button;
import view.gui.StyledText;
import view.gui.StyledTextField;
import view.gui.Styles;

public class Board2D extends EventDispatcher implements IBoard {

    public static const GAP:uint = 5; // Gap between puzzles
    public static const PADDING_LEFT:uint = 38;
    public static const PADDING_TOP:uint = 44;

    public var board:Board_design;
    private var puzzles:Array;
    private var tfTime:StyledTextField; // Displays the time
    private var tfSteps:StyledTextField; // Displays the amount of steps
    private var bFinish:Button;

    private var application:Main;

    public function Board2D(application:Main) {
        this.application = application;
        createBoard();
        createPuzzles();
    }

    /**
     * @private
     * Create a game board, text fields and buttons
     */
    private function createBoard():void {
        board = new Board_design();

        var labelSteps:StyledText = StyledText.Create("Ходов:", 22, Styles.ORANGE_TEXT);
        labelSteps.x = 530;
        labelSteps.y = 100;
        board.addChild(labelSteps);

        tfSteps = StyledTextField.Create(0, 0, Styles.TEXT_FIELD_VIEW2D);
        tfSteps.x =  labelSteps.x;
        tfSteps.y = labelSteps.y + labelSteps.height + GAP;
        tfSteps.text = "0";
        board.addChild(tfSteps);

        var labelTime:StyledText = StyledText.Create("Времени:", 22, Styles.ORANGE_TEXT);
        labelTime.x = labelSteps.x;
        labelTime.y = tfSteps.y + tfSteps.height + 4 * GAP;
        board.addChild(labelTime);

        tfTime = StyledTextField.Create(0, 0, Styles.TEXT_FIELD_VIEW2D);
        tfTime.x =  labelSteps.x;
        tfTime.y = labelTime.y + labelTime.height + GAP;
        tfTime.text = "00:00";
        board.addChild(tfTime);

        bFinish = Button.Create("Завершить", Styles.MENU_BUTTON, Styles.SMALL_ORANGE_TEXT);
        bFinish.x = labelSteps.x + 60;
        bFinish.y = tfTime.y + tfTime.height + 9 * GAP;
        bFinish.addEventListener(MouseEvent.CLICK, bFinish_onMouseClick);
        board.addChild(bFinish);
    }

    /**
     * @private
     *
     */
    private function createPuzzles():void {
        puzzles = new Array();

        puzzles.push(0);
        puzzles.push(new Puzzle(new Box01_design(), 1));
        puzzles.push(new Puzzle(new Box02_design(), 2));
        puzzles.push(new Puzzle(new Box03_design(), 3));
        puzzles.push(new Puzzle(new Box04_design(), 4));
        puzzles.push(new Puzzle(new Box05_design(), 5));
        puzzles.push(new Puzzle(new Box06_design(), 6));
        puzzles.push(new Puzzle(new Box07_design(), 7));
        puzzles.push(new Puzzle(new Box08_design(), 8));
        puzzles.push(new Puzzle(new Box09_design(), 9));
        puzzles.push(new Puzzle(new Box10_design(), 10));
        puzzles.push(new Puzzle(new Box11_design(), 11));
        puzzles.push(new Puzzle(new Box12_design(), 12));
        puzzles.push(new Puzzle(new Box13_design(), 13));
        puzzles.push(new Puzzle(new Box14_design(), 14));
        puzzles.push(new Puzzle(new Box15_design(), 15));
    }

    public function startGame(puzzlesProxy:PuzzlesProxy):void {
        arrangePuzzles(puzzlesProxy);
        application.addChild(board);
    }

    public function updateTime(time:String):void {
        tfTime.text = time;
    }

    public function updatePuzzles(number:int, index:Index, steps:int) {
        tfSteps.text = steps.toString();
        var puzzle:Puzzle = puzzles[number];
        movePuzzle(puzzle, index);
    }

    public function get container():Sprite {
        return board;
    }


    private function movePuzzle(puzzle:Puzzle, index:Index, animate:Boolean = true):void {
        var toX:int = PADDING_LEFT + (index.j - 1) * (puzzle.width + GAP);
        var toY:int = PADDING_TOP + (index.i - 1) * (puzzle.height + GAP);

        board.addChild(puzzle); // Raise it to the top layer

        if (animate) {
            TweenMax.to(puzzle, BoardMediator.DURATION, { x:toX, y: toY } );
//			soundStep.play();
        } else {
            puzzle.x = toX;
            puzzle.y = toY;
        }
    }

    /**
     * @private
     * Arrange all puzzles in accordance with the model
     */
    private function arrangePuzzles(puzzlesProxy:PuzzlesProxy):void {
        var puzzle:Puzzle;
        var index:Index;

        for (var i:int = 1; i <= puzzlesProxy.number; i++) {
            index = puzzlesProxy.matrixProxy.getIndex(i);
            puzzle = puzzles[i];
            puzzle.x = PADDING_LEFT + (index.j - 1) * (puzzle.width + GAP);
            puzzle.y = PADDING_TOP + (index.i - 1) * (puzzle.height + GAP);
            puzzle.addEventListener(MouseEvent.CLICK, puzzle_onMouseClick);
            board.addChild(puzzle);
        }
    }

    public function show():void {
        application.addChild(board);
    }

    public function hide():void {
        if (application.contains(board)) {
            application.removeChild(board);
        }
    }

    private function puzzle_onMouseClick(e:MouseEvent):void {
        this.dispatchEvent(new BoardEvent(BoardEvent.PUZZLE_CLICKED, (e.target as Puzzle).number));
    }

    private function bFinish_onMouseClick(e:MouseEvent):void {
        this.dispatchEvent(new BoardEvent(BoardEvent.FINISH_CLICKED));
    }
}
}