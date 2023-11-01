import Toybox.Lang;
import Toybox.System;

class DataStatistics {

    private const UNSET as Number = 0x80000000;

    private var array as Array<Number>;

    private var position as Number;

    private var sum as Long;

    private var count as Long;

    private var max as Number or Null;

    public function initialize() {
        array = new Array<Number>[120];
        for (var i = 0; i < 120; i++) {
            array[i] = UNSET;
        }

        position = 0;
        sum = 0L;
        count = 0L;
        max = null;
    }


    public function accept(num as Number) as Void {
        array[position] = num;
        sum += num;
        count++;
        if (max == null) {
            max = num;
        } else {
            max = num > max ? num : max;
        }
        position++;
        if (position >= array.size()) {
            position = 0;
        }
    }


    public function getAverage() as Double or Null {
        if (count == null) {
            return null;
        }
        return sum.toDouble() / count;
    }


    public function getMax() as Number or Null {
        return max;
    }


    public function getRangeAverage(start as Number, end as Number) as Double or Null {
        var i = position > 0 ? position - 1 : array.size() - 1;
        var j = 0;
        while (j < start) {
            i = i > 0 ? i - 1 : array.size() - 1;
            j++;
        }

        var s = 0;
        var c = 0;
        j = 0;
        while (j < end - start) {
            if (array[i] != UNSET) {
                s += array[i];
                c++;
            }
            i = i > 0 ? i - 1 : array.size() - 1;
            j++;
        }

        if (c == 0) {
            return null;
        }

        return s.toDouble() / c;
    }


    public function getCurrent() as Number or Null {
        var v = array[position > 0 ? position - 1 : array.size() - 1];
        return v != UNSET ? v : null;
    }

}