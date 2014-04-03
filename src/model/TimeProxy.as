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

import flash.events.TimerEvent;
import flash.utils.Timer;

import model.vo.TimeVO;

import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.proxy.Proxy;

/**
 * Proxy manages time games
 */
public class TimeProxy extends Proxy implements IProxy  {

    public static const NAME:String = "timeProxy";

    private var timer:Timer;
    private var time:TimeVO;

    public function TimeProxy(data:TimeVO) {
        super(NAME, data);
    }

    public function init():void {
        time = this.getData() as TimeVO;
        time.value = 0;
        timer = new Timer(1000);
        timer.addEventListener(TimerEvent.TIMER, onTimer);
        timer.start();
    }

	public function set pause(value:Boolean):void {
		if (value) {
			timer.stop();
		} else {
			timer.start();
		}
	}

	public function get pause():Boolean {
		if (timer == null) {
			return false;
		} else {
			return !timer.running;
		}
	}

	/**
	 * @private
	 * Update game time
	 */
    private function onTimer(e:TimerEvent):void {
        time.value++;
        var min:int = time.value / 60;
        var sec:int = time.value % 60;

		// Format the minutes
		if (min >= 10) {
			time.valueStr = min.toString();
		} else {
			time.valueStr = "0" + min.toString();
		}
		time.valueStr += ":";

		// Format the second
		if (sec >= 10) {
			time.valueStr += sec.toString();
		} else {
			time.valueStr += "0" + sec.toString();
		}

        sendNotification(ApplicationFacade.TIME_UPDATED, time.valueStr);
		trace(time.valueStr);
    }
}
}