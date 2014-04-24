package steampunk_tower_fla
{
    import flash.display.*;
    import flash.events.*;

    dynamic public class AddictingGamesLogocopy_70 extends MovieClip
    {

        public function AddictingGamesLogocopy_70()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function mouseOverFunc(event:MouseEvent) : void
        {
            gotoAndStop(2);
            return;
        }// end function

        public function mouseOutFunc(event:MouseEvent) : void
        {
            gotoAndStop(1);
            return;
        }// end function

        public function mouseDownFunc(event:MouseEvent) : void
        {
            gotoAndStop(3);
            return;
        }// end function

        public function mouseUpFunc(event:MouseEvent) : void
        {
            gotoAndStop(2);
            return;
        }// end function

        public function mouseClickFunc(event:MouseEvent) : void
        {
            Main.main.goMoreGames();
            return;
        }// end function

        function frame1()
        {
            stop();
            buttonMode = true;
            addEventListener(MouseEvent.MOUSE_OVER, this.mouseOverFunc, false, 0, true);
            addEventListener(MouseEvent.MOUSE_OUT, this.mouseOutFunc, false, 0, true);
            addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownFunc, false, 0, true);
            addEventListener(MouseEvent.MOUSE_UP, this.mouseUpFunc, false, 0, true);
            addEventListener(MouseEvent.CLICK, this.mouseClickFunc, false, 0, true);
            return;
        }// end function

    }
}
