package fl.motion
{
    import flash.geom.*;

    public class MatrixTransformer extends Object
    {

        public function MatrixTransformer()
        {
            return;
        }// end function

        public static function getScaleX(param1:Matrix) : Number
        {
            return Math.sqrt(param1.a * param1.a + param1.b * param1.b);
        }// end function

        public static function setScaleX(param1:Matrix, param2:Number) : void
        {
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_3:* = getScaleX(param1);
            if (_loc_3)
            {
                _loc_4 = param2 / _loc_3;
                param1.a = param1.a * _loc_4;
                param1.b = param1.b * _loc_4;
            }
            else
            {
                _loc_5 = getSkewYRadians(param1);
                param1.a = Math.cos(_loc_5) * param2;
                param1.b = Math.sin(_loc_5) * param2;
            }
            return;
        }// end function

        public static function getScaleY(param1:Matrix) : Number
        {
            return Math.sqrt(param1.c * param1.c + param1.d * param1.d);
        }// end function

        public static function setScaleY(param1:Matrix, param2:Number) : void
        {
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_3:* = getScaleY(param1);
            if (_loc_3)
            {
                _loc_4 = param2 / _loc_3;
                param1.c = param1.c * _loc_4;
                param1.d = param1.d * _loc_4;
            }
            else
            {
                _loc_5 = getSkewXRadians(param1);
                param1.c = (-Math.sin(_loc_5)) * param2;
                param1.d = Math.cos(_loc_5) * param2;
            }
            return;
        }// end function

        public static function getSkewXRadians(param1:Matrix) : Number
        {
            return Math.atan2(-param1.c, param1.d);
        }// end function

        public static function setSkewXRadians(param1:Matrix, param2:Number) : void
        {
            var _loc_3:* = getScaleY(param1);
            param1.c = (-_loc_3) * Math.sin(param2);
            param1.d = _loc_3 * Math.cos(param2);
            return;
        }// end function

        public static function getSkewYRadians(param1:Matrix) : Number
        {
            return Math.atan2(param1.b, param1.a);
        }// end function

        public static function setSkewYRadians(param1:Matrix, param2:Number) : void
        {
            var _loc_3:* = getScaleX(param1);
            param1.a = _loc_3 * Math.cos(param2);
            param1.b = _loc_3 * Math.sin(param2);
            return;
        }// end function

        public static function getSkewX(param1:Matrix) : Number
        {
            return Math.atan2(-param1.c, param1.d) * (180 / Math.PI);
        }// end function

        public static function setSkewX(param1:Matrix, param2:Number) : void
        {
            setSkewXRadians(param1, param2 * (Math.PI / 180));
            return;
        }// end function

        public static function getSkewY(param1:Matrix) : Number
        {
            return Math.atan2(param1.b, param1.a) * (180 / Math.PI);
        }// end function

        public static function setSkewY(param1:Matrix, param2:Number) : void
        {
            setSkewYRadians(param1, param2 * (Math.PI / 180));
            return;
        }// end function

        public static function getRotationRadians(param1:Matrix) : Number
        {
            return getSkewYRadians(param1);
        }// end function

        public static function setRotationRadians(param1:Matrix, param2:Number) : void
        {
            var _loc_3:* = getRotationRadians(param1);
            var _loc_4:* = getSkewXRadians(param1);
            setSkewXRadians(param1, _loc_4 + param2 - _loc_3);
            setSkewYRadians(param1, param2);
            return;
        }// end function

        public static function getRotation(param1:Matrix) : Number
        {
            return getRotationRadians(param1) * (180 / Math.PI);
        }// end function

        public static function setRotation(param1:Matrix, param2:Number) : void
        {
            setRotationRadians(param1, param2 * (Math.PI / 180));
            return;
        }// end function

        public static function rotateAroundInternalPoint(param1:Matrix, param2:Number, param3:Number, param4:Number) : void
        {
            var _loc_5:* = new Point(param2, param3);
            _loc_5 = param1.transformPoint(_loc_5);
            param1.tx = param1.tx - _loc_5.x;
            param1.ty = param1.ty - _loc_5.y;
            param1.rotate(param4 * (Math.PI / 180));
            param1.tx = param1.tx + _loc_5.x;
            param1.ty = param1.ty + _loc_5.y;
            return;
        }// end function

        public static function rotateAroundExternalPoint(param1:Matrix, param2:Number, param3:Number, param4:Number) : void
        {
            param1.tx = param1.tx - param2;
            param1.ty = param1.ty - param3;
            param1.rotate(param4 * (Math.PI / 180));
            param1.tx = param1.tx + param2;
            param1.ty = param1.ty + param3;
            return;
        }// end function

        public static function matchInternalPointWithExternal(param1:Matrix, param2:Point, param3:Point) : void
        {
            var _loc_4:* = param1.transformPoint(param2);
            var _loc_5:* = param3.x - _loc_4.x;
            var _loc_6:* = param3.y - _loc_4.y;
            param1.tx = param1.tx + _loc_5;
            param1.ty = param1.ty + _loc_6;
            return;
        }// end function

    }
}
