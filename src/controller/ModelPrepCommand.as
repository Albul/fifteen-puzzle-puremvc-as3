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

import flash.utils.Dictionary;

import model.MatrixProxy;
import model.PuzzlesProxy;
import model.RecordsProxy;
import model.StageProxy;
import model.TimeProxy;
import model.vo.PuzzlesVO;
import model.vo.TimeVO;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class ModelPrepCommand extends SimpleCommand {

    override public function execute(notification:INotification):void {
        var root:Main = (notification.getBody() as Main);

        var puzzlesVO:PuzzlesVO = new PuzzlesVO();
        puzzlesVO.time = new TimeVO();
        puzzlesVO.matrix = new Dictionary();

        facade.registerProxy(new PuzzlesProxy(puzzlesVO));
        facade.registerProxy(new TimeProxy(puzzlesVO.time));
        facade.registerProxy(new MatrixProxy(puzzlesVO.matrix));
        facade.registerProxy(new StageProxy(root.stage));
        facade.registerProxy(new RecordsProxy());
    }
}
}
