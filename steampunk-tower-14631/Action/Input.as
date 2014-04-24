package 
{
    import flash.display.*;
    import flash.events.*;

    public class Input extends Object
    {
        private static var stage:Stage;
        private static var pressedKeys:Array = new Array();
        private static var prevPressedKeys:Array = new Array();
        private static var initialized:Boolean;
        public static var isMouseDown:Boolean;
        private static var skipFrame:Boolean = false;
        private static var prevMouseX:int;
        private static var prevMouseY:int;
        public static var dtMouseX:int = 0;
        public static var dtMouseY:int = 0;

        public function Input()
        {
            return;
        }// end function

        public static function initialize(param1:Stage)
        {
            if (initialized)
            {
                return;
            }
            initialized = true;
            stage = param1;
            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
            stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
            stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
            stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
            stage.addEventListener(Event.ENTER_FRAME, update);
            stage.addEventListener(Event.DEACTIVATE, clearKeys);
            return;
        }// end function

        private static function clearKeys(event:Event) : void
        {
            pressedKeys.splice(0, pressedKeys.length);
            prevPressedKeys.splice(0, prevPressedKeys.length);
            return;
        }// end function

        private static function update(event:Event) : void
        {
            if (!skipFrame)
            {
                prevPressedKeys = pressedKeys.slice();
            }
            skipFrame = false;
            dtMouseX = stage.mouseX - prevMouseX;
            dtMouseY = stage.mouseY - prevMouseY;
            prevMouseX = stage.mouseX;
            prevMouseY = stage.mouseY;
            return;
        }// end function

        private static function keyDown(event:KeyboardEvent) : void
        {
            skipFrame = true;
            var _loc_2:* = pressedKeys.indexOf(event.keyCode);
            if (_loc_2 == -1)
            {
                pressedKeys.push(event.keyCode);
            }
            return;
        }// end function

        private static function keyUp(event:KeyboardEvent) : void
        {
            var _loc_2:* = pressedKeys.indexOf(event.keyCode);
            if (_loc_2 > -1)
            {
                pressedKeys.splice(_loc_2, 1);
            }
            return;
        }// end function

        private static function mouseDown(event:MouseEvent) : void
        {
            isMouseDown = true;
            return;
        }// end function

        private static function mouseUp(event:MouseEvent) : void
        {
            isMouseDown = false;
            return;
        }// end function

        public static function isKeyDown(param1:int) : Boolean
        {
            var _loc_2:* = pressedKeys.indexOf(param1);
            return _loc_2 > -1;
        }// end function

        public static function isKeyDownOnce(param1:int) : Boolean
        {
            var _loc_2:* = pressedKeys.indexOf(param1);
            var _loc_3:* = prevPressedKeys.indexOf(param1);
            return _loc_2 > -1 && _loc_3 == -1;
        }// end function

    }
}
