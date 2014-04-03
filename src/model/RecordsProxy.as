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

import flash.net.SharedObject;

import model.vo.ResultVO;

import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.proxy.Proxy;

public class RecordsProxy extends Proxy implements IProxy {

	public static const NAME = "recordsProxy";
	// Coefficient of importance of the steps in the calculation of results
	private const FACTOR_STEPS:Number = 80 / 100;
	private const FACTOR_TIME:Number = 20 / 100;
	private const MAX_RECORDS:int = 10;

	private var recordsVO:Array;

	private var localStorage:SharedObject;

	public function RecordsProxy() {

		localStorage = SharedObject.getLocal("records");

	   	if (localStorage.data.records != null ) {
			recordsVO = localStorage.data.records;
		} else {
			recordsVO = new Array();
			localStorage.data.records = recordsVO;
			localStorage.flush();
		}

		super(NAME, recordsVO);
	}

	public function setResult(newResult:ResultVO):void {
		var max:int = recordsVO.length;

		if (max == 0) {
			recordsVO.push(newResult);
		} else {
			var factorNewResult:Number = newResult.steps * FACTOR_STEPS + newResult.time * FACTOR_TIME;
			for (var i:int = 0; i <= max; i++) {
				var factorCurrentResult:Number =  recordsVO[i].steps * FACTOR_STEPS + recordsVO[i].time * FACTOR_TIME;
				if (factorNewResult < factorCurrentResult) {
					recordsVO.splice(i, 0, newResult);
					break;
				}
			}
		}

		while (recordsVO.length > MAX_RECORDS) {
			recordsVO.pop();
		}

		localStorage.data.records = recordsVO;
		localStorage.flush();
	}

	public function get records():Array {
		return recordsVO;
	}

}
}
