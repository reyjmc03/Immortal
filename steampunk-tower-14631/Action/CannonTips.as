package 
{
    import com.greensock.*;
    import com.greensock.easing.*;
    import flash.display.*;
    import flash.utils.*;

    public class CannonTips extends MovieClip
    {
        private static var py:int = -165;
        private static var time:int = 0;

        public function CannonTips(param1:Level, param2:int)
        {
            param1.addChild(this);
            gotoAndStop(param2);
            y = py;
            x = -595;
            var _loc_3:* = getTimer();
            var _loc_4:Number = 0;
            if (_loc_3 - time < 7000)
            {
                _loc_4 = (_loc_3 - time) / 1000;
            }
            time = _loc_3;
            TweenLite.to(this, 1, {x:-395, ease:Back.easeOut, delay:_loc_4});
            TweenLite.delayedCall(5 + _loc_4, this.hide);
            return;
        }// end function

        private function hide() : void
        {
            TweenLite.to(this, 1, {x:-595, onComplete:this.dispose});
            return;
        }// end function

        private function dispose() : void
        {
            if (parent)
            {
                parent.removeChild(this);
            }
            return;
        }// end function

    }
}
