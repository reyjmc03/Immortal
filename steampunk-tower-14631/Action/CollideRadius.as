package 
{
    import flash.display.*;
    import flash.geom.*;

    public class CollideRadius extends Object
    {
        public var obj:Enemy;
        public var localPos:Point;
        public var radius:Number;
        public var levelX:Number = 0;
        public var levelY:Number = 0;
        public var isSensor:Boolean = false;

        public function CollideRadius(param1:Enemy, param2:Number, param3:Number, param4:Number, param5:Boolean = false)
        {
            this.localPos = new Point();
            this.obj = param1;
            this.localPos = new Point(param2, param3);
            this.radius = param4;
            this.isSensor = param5;
            return;
        }// end function

        public function dispose() : void
        {
            this.obj = null;
            this.localPos = null;
            return;
        }// end function

        public function calcLevelCoords() : void
        {
            this.levelX = this.obj.levelX + this.localPos.x * this.obj.scaleX;
            this.levelY = this.obj.levelY + this.localPos.y;
            return;
        }// end function

        public function overlap(param1:CollideRadius) : Boolean
        {
            this.calcLevelCoords();
            param1.calcLevelCoords();
            var _loc_2:* = this.levelX - param1.levelX;
            var _loc_3:* = this.levelY - param1.levelY;
            var _loc_4:* = this.radius + param1.radius;
            return _loc_2 * _loc_2 + _loc_3 * _loc_3 < _loc_4 * _loc_4;
        }// end function

        public function overlap2(param1:Number, param2:Number, param3:Number) : Boolean
        {
            this.calcLevelCoords();
            var _loc_4:* = this.levelX - param1;
            var _loc_5:* = this.levelY - param2;
            var _loc_6:* = this.radius + param3;
            return _loc_4 * _loc_4 + _loc_5 * _loc_5 < _loc_6 * _loc_6;
        }// end function

        public function containPoint(param1:Number, param2:Number) : Boolean
        {
            this.calcLevelCoords();
            var _loc_3:* = this.levelX - param1;
            var _loc_4:* = this.levelY - param2;
            var _loc_5:* = this.radius;
            return _loc_3 * _loc_3 + _loc_4 * _loc_4 < _loc_5 * _loc_5;
        }// end function

        public function draw() : void
        {
            this.calcLevelCoords();
            var _loc_1:* = this.obj.level.canvas.graphics;
            if (this.isSensor)
            {
                _loc_1.beginFill(16776960, 0.2);
            }
            else
            {
                _loc_1.beginFill(65280, 0.2);
            }
            _loc_1.drawCircle(this.levelX, this.levelY, this.radius);
            return;
        }// end function

    }
}
