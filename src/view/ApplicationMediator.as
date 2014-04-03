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

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

public class ApplicationMediator extends Mediator implements IMediator {

	public static const NAME:String = "applicationMediator";

	public function ApplicationMediator(viewComponent:Object) {
		super(NAME, viewComponent);
	}

	public function get application():Main {
		return viewComponent as Main;
	}

	override public function listNotificationInterests():Array {
		return [
//            ApplicationFacade.STAGE_RESIZE
		];
	}

	override public function handleNotification(notification:INotification):void {
		switch (notification.getName()) {

			case ApplicationFacade.STAGE_RESIZE:
//                var stage:StageProxy = notification.getBody() as StageProxy;
				application.x = (application.stage.stageWidth - application.width) / 2;
				application.y = (application.stage.stageHeight - application.height) / 2;
				break;

			default:
				break;
		}
	}

}
}
