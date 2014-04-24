package steampunk_tower_fla
{
    import flash.display.*;
    import flash.events.*;

    dynamic public class black_ani_198 extends MovieClip
    {
        public var btPause:SimpleButton;
        public var hint:MovieClip;
        public var btMenu:SimpleButton;
        public var btPlus:SimpleButton;
        public var btEnc:SimpleButton;

        public function black_ani_198()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function hideHint(event:MouseEvent) : void
        {
            this.hint.visible = false;
            return;
        }// end function

        public function showHint(event:MouseEvent) : void
        {
            this.hint.visible = true;
            if (event.target == this.btPlus)
            {
                this.hint.x = 34;
                this.hint.gotoAndStop("more games");
            }
            else if (event.target == this.btPause)
            {
                this.hint.x = 76;
                this.hint.gotoAndStop("pause");
            }
            else if (event.target == this.btEnc)
            {
                this.hint.x = 118;
                this.hint.gotoAndStop("enciclopedia");
            }
            return;
        }// end function

        function frame1()
        {
            this.hint.stop();
            this.hint.visible = false;
            this.hint.mouseEnabled = false;
            this.btPlus.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.btPause.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.btEnc.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.btPlus.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            this.btPause.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            this.btEnc.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            return;
        }// end function

    }
}
