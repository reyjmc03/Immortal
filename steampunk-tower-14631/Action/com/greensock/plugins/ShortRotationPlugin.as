package com.greensock.plugins
{
    import com.greensock.*;

    public class ShortRotationPlugin extends TweenPlugin
    {
        public static const API:Number = 1;

        public function ShortRotationPlugin()
        {
            this.propName = "shortRotation";
            this.overwriteProps = [];
            return;
        }// end function

        override public function onInitTween(param1:Object, param2, param3:TweenLite) : Boolean
        {
            var _loc_4:String = null;
            if (typeof(param2) == "number")
            {
                return false;
            }
            for (_loc_4 in param2)
            {
                
                this.initRotation(param1, _loc_4, param1[_loc_4], typeof(param2[_loc_4]) == "number" ? (Number(param2[_loc_4])) : (param1[_loc_4] + Number(param2[_loc_4])));
            }
            return true;
        }// end function

        public function initRotation(param1:Object, param2:String, param3:Number, param4:Number) : void
        {
            var _loc_5:* = (param4 - param3) % 360;
            if ((param4 - param3) % 360 != (param4 - param3) % 360 % 180)
            {
                _loc_5 = _loc_5 < 0 ? (_loc_5 + 360) : (_loc_5 - 360);
            }
            addTween(param1, param2, param3, param3 + _loc_5, param2);
            this.overwriteProps[this.overwriteProps.length] = param2;
            return;
        }// end function

    }
}
