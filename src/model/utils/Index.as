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
package model.utils {
/**
 * Index two-dimensional array which is a string 123.222
 */
public class Index {

    private var _i:int;

    private var _j:int;

    private var _index:String;

    public function Index(index:String = null) {
        this.index = index;
    }

    public function put(index:String):void {
        this.index = index;
    }

    public function putIJ(i:int, j:int):void {
        this.i = i;
        this.j = j;
    }

    public function generateIndx(incI:int, incJ:int):Index {
        var result:Index = new Index();
        result.putIJ(this.i + incI, this.j + incJ);
        return result;
    }

    public function get index():String {
        return _index;
    }

    public function set index(value:String):void {
        if (value == null || value == "") return;
        this._index = value;
        this._i = int(value.substring(0, value.indexOf(",")));
        this._j = int(value.substring(value.indexOf(",") + 1, value.length));
    }

    public function get i():int {
        return _i;
    }

    public function get j():int {
        return _j;
    }

    public function set i(value:int):void {
        this.index = value.toString() + "," + j.toString();
    }

    public function set j(value:int):void {
        this.index = i.toString() + "," + value.toString();
    }

    public function isEmpty():Boolean {
        return index == null;
    }
}
}
