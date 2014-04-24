package com.greensock.plugins
{
    import com.greensock.*;
    import flash.display.*;
    import flash.geom.*;

    public class ColorTransformPlugin extends TintPlugin
    {
        public static const API:Number = 1;

        public function ColorTransformPlugin()
        {
            this.propName = "colorTransform";
            return;
        }// end function

        override public function onInitTween(param1:Object, param2, param3:TweenLite) : Boolean
        {
            var _loc_5:String = null;
            var _loc_6:Number = NaN;
            if (!(param1 is DisplayObject))
            {
                return false;
            }
            var _loc_4:* = param1.transform.colorTransform;
            for (_loc_5 in param2)
            {
                
                if (_loc_5 == "tint" || _loc_5 == "color")
                {
                    if (param2[_loc_5] != null)
                    {
                        _loc_4.color = int(param2[_loc_5]);
                    }
                    continue;
                }
                if (_loc_5 == "tintAmount" || _loc_5 == "exposure" || _loc_5 == "brightness")
                {
                    continue;
                }
                _loc_4[_loc_5] = param2[_loc_5];
            }
            if (!isNaN(param2.tintAmount))
            {
                _loc_6 = param2.tintAmount / (1 - (_loc_4.redMultiplier + _loc_4.greenMultiplier + _loc_4.blueMultiplier) / 3);
                _loc_4.redOffset = _loc_4.redOffset * _loc_6;
                _loc_4.greenOffset = _loc_4.greenOffset * _loc_6;
                _loc_4.blueOffset = _loc_4.blueOffset * _loc_6;
                var _loc_7:* = 1 - param2.tintAmount;
                _loc_4.blueMultiplier = 1 - param2.tintAmount;
                var _loc_7:* = _loc_7;
                _loc_4.greenMultiplier = _loc_7;
                _loc_4.redMultiplier = _loc_7;
            }
            else if (!isNaN(param2.exposure))
            {
                var _loc_7:* = 255 * (param2.exposure - 1);
                _loc_4.blueOffset = 255 * (param2.exposure - 1);
                var _loc_7:* = _loc_7;
                _loc_4.greenOffset = _loc_7;
                _loc_4.redOffset = _loc_7;
                var _loc_7:int = 1;
                _loc_4.blueMultiplier = 1;
                var _loc_7:* = _loc_7;
                _loc_4.greenMultiplier = _loc_7;
                _loc_4.redMultiplier = _loc_7;
            }
            else if (!isNaN(param2.brightness))
            {
                var _loc_7:* = Math.max(0, (param2.brightness - 1) * 255);
                _loc_4.blueOffset = Math.max(0, (param2.brightness - 1) * 255);
                var _loc_7:* = _loc_7;
                _loc_4.greenOffset = _loc_7;
                _loc_4.redOffset = _loc_7;
                var _loc_7:* = 1 - Math.abs((param2.brightness - 1));
                _loc_4.blueMultiplier = 1 - Math.abs((param2.brightness - 1));
                var _loc_7:* = _loc_7;
                _loc_4.greenMultiplier = _loc_7;
                _loc_4.redMultiplier = _loc_7;
            }
            _ignoreAlpha = Boolean(param3.vars.alpha != undefined && param2.alphaMultiplier == undefined);
            init(param1 as DisplayObject, _loc_4);
            return true;
        }// end function

    }
}
