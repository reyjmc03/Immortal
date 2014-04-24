package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class AutoRemoveText extends Sprite
    {
        public var txt:TextField;
        private var time:Number;
        private var totalTime:Number;
        public var textField:TextField;

        public function AutoRemoveText(param1:String, param2:Number)
        {
            this.totalTime = param2;
            this.time = param2;
            this.txt.text = param1;
            this.txt.x = (-this.txt.textWidth) / 2;
            this.txt.y = (-this.txt.textHeight) / 2;
            this.txt.autoSize = TextFieldAutoSize.LEFT;
            addEventListener(Event.ENTER_FRAME, this.update);
            this.textField = getChildByName("txt") as TextField;
            return;
        }// end function

        public function set color(param1:uint) : void
        {
            this.txt.textColor = param1;
            return;
        }// end function

        private function update(event:Event) : void
        {
            this.time = this.time - Level.deltaTime;
            alpha = this.time / this.totalTime;
            y = y - 0.025 * Level.deltaTime;
            if (this.time <= 0)
            {
                if (parent)
                {
                    parent.removeChild(this);
                }
                removeEventListener(Event.ENTER_FRAME, this.update);
            }
            return;
        }// end function

    }
}
