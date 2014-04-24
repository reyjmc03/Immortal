package 
{
    import flash.display.*;
    import flash.events.*;

    public class AutoRemoveObject extends Object
    {
        private var mc:MovieClip;
        public var onComplete:Function;

        public function AutoRemoveObject(param1:MovieClip, param2:Function = null)
        {
            this.mc = param1;
            this.onComplete = param2;
            param1.addEventListener(Event.ENTER_FRAME, this.update);
            return;
        }// end function

        private function update(event:Event) : void
        {
            if (this.mc.currentFrame == this.mc.totalFrames)
            {
                this.mc.removeEventListener(Event.ENTER_FRAME, this.update);
                if (this.mc.parent)
                {
                    this.mc.parent.removeChild(this.mc);
                    if (this.onComplete != null)
                    {
                        this.onComplete.call();
                    }
                }
            }
            return;
        }// end function

    }
}
