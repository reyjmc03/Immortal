package 
{
    import __AS3__.vec.*;
    import flash.display.*;

    public class CollisionObject extends MovieClip
    {
        public var collideRadiuses:Vector.<CollideRadius>;

        public function CollisionObject()
        {
            this.collideRadiuses = new Vector.<CollideRadius>;
            return;
        }// end function

        public function collisionToRadius(param1:Number, param2:Number, param3:Number, param4:Boolean = false) : Boolean
        {
            var _loc_6:CollideRadius = null;
            var _loc_5:int = 0;
            while (_loc_5 < this.collideRadiuses.length)
            {
                
                _loc_6 = this.collideRadiuses[_loc_5];
                if ((!_loc_6.isSensor || param4) && _loc_6.overlap2(param1, param2, param3))
                {
                    return true;
                }
                _loc_5++;
            }
            return false;
        }// end function

    }
}
