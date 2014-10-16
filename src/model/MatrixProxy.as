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

import flash.utils.Dictionary;

import model.utils.Index;

import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.proxy.Proxy;

public class MatrixProxy extends Proxy implements IProxy {

    public static const NAME:String = "matrixProxy";

    private var map:Dictionary;

    public function MatrixProxy(data:Dictionary) {
        super(NAME, data);

        map = this.getData() as Dictionary;
    }

    public function put(key:String, value:*):void {
        map[key] = value;
    }

    public function removeByKey(key:String):* {
        var value:* = map[key];
        delete map[key];
        return value;
    }

    public function getValue(key:String):* {
        return map[key];
    }

    public function getValueByIndex(indx:Index):* {
        return map[indx.index];
    }

    public function getKey(value:*):String {
        for (var k:String in map) {
            if (map[k] == value) return k;
        }
        return null;
    }

    public function getIndex(value:*):Index {
        var k:String = getKey(value);
        var indx:Index;

        if (k != null) {
            indx = new Index(k);
        }
        return indx;
    }

    public function size():int {
        var n:int = 0;
        for (var v:String in map) {
            n++;
        }
        return n;
    }

    public function isEmpty():Boolean {
        return size() == 0;
    }

    public function containsKey(key:String):Boolean {
        return map[key] != null;
    }

    public function clear():void {
        map = new Dictionary();
    }

    public function values():Dictionary {
        var values:Dictionary = new Dictionary();
        for (var k:String in map) {
            values[k] = getValue(k);
        }
        return values;
    }

    public function swap(val1:*, val2:*):void {
        var key1:* = getKey(val1);
        var key2:* = getKey(val2);
        put(key1, val2);
        put(key2, val1);
    }
}
}


