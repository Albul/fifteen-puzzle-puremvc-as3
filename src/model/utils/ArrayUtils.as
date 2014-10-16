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
public class ArrayUtils {

    public static function shuffle(arr:Array):Array {
        var max = arr.length - 1;
        for (var j, x, i = max; i >= 0;
             j = MathUtils.getRandomInt(0, max), x = arr[i], arr[i] = arr[j], arr[j] = x, i--);
        return arr;
    }

    public static function getRandomArray(start:int, end:int):Array {
        var arr = new Array(end - start);

        for (var i:int = 0; i + start <= end; i++) {
            arr[i] = i + start;
        }
        shuffle(arr);
        return shuffle(arr);
    }
}
}
