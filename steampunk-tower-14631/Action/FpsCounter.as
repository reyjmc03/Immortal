package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.filters.*;
    import flash.system.*;
    import flash.text.*;
    import flash.utils.*;

    public class FpsCounter extends Object
    {
        public static var fps:int;
        private static var initialized:Boolean;
        private static var _stage:Stage;
        private static var timeCounter:int;
        private static var fpsCounter:int;
        private static var lastTime:Number;
        private static var txtInfo:TextField;

        public function FpsCounter()
        {
            return;
        }// end function

        public static function initialize(param1:Stage)
        {
            if (initialized)
            {
                return;
            }
            _stage = param1;
            param1.addEventListener(Event.ENTER_FRAME, update);
            initialized = true;
            txtInfo = new TextField();
            txtInfo.textColor = 16777215;
            txtInfo.x = 15;
            txtInfo.y = 95;
            txtInfo.mouseEnabled = false;
            txtInfo.selectable = false;
            txtInfo.filters = [new GlowFilter(0)];
            return;
        }// end function

        private static function update(event:Event) : void
        {
            var _loc_2:* = getTimer();
            var _loc_3:* = _loc_2 - lastTime;
            lastTime = _loc_2;
            (fpsCounter + 1);
            timeCounter = timeCounter + _loc_3;
            if (timeCounter > 1000)
            {
                timeCounter = timeCounter - 1000;
                fps = fpsCounter;
                fpsCounter = 0;
                txtInfo.text = "fps: " + fps;
                txtInfo.appendText("\nMem: " + (System.totalMemory / 1024 / 1024).toFixed(1));
            }
            return;
        }// end function

        public static function dispose() : void
        {
            if (initialized)
            {
                _stage.removeEventListener(Event.ENTER_FRAME, update);
                initialized = false;
            }
            return;
        }// end function

    }
}
