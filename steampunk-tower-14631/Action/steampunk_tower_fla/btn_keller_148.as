package steampunk_tower_fla
{
    import flash.display.*;
    import flash.events.*;

    dynamic public class btn_keller_148 extends MovieClip
    {

        public function btn_keller_148()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function mouseOverHandler(event:MouseEvent) : void
        {
            if (currentFrame == 1)
            {
                gotoAndStop(2);
            }
            if (currentFrame == 3)
            {
                gotoAndStop(4);
            }
            return;
        }// end function

        public function mouseOutHandler(event:MouseEvent) : void
        {
            if (currentFrame == 2)
            {
                gotoAndStop(1);
            }
            if (currentFrame == 4)
            {
                gotoAndStop(3);
            }
            return;
        }// end function

        function frame1()
        {
            stop();
            addEventListener(MouseEvent.MOUSE_OVER, this.mouseOverHandler);
            addEventListener(MouseEvent.MOUSE_OUT, this.mouseOutHandler);
            return;
        }// end function

    }
}
