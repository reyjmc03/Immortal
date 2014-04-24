package steampunk_tower_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    dynamic public class cannon_info_2_184 extends MovieClip
    {
        public var txtFireSpeed:TextField;
        public var mcOverDistance:MovieClip;
        public var hint:MovieClip;
        public var txtAmmo:TextField;
        public var mcOverFireRate:MovieClip;
        public var txtName:TextField;
        public var txtDistance:TextField;
        public var txtAttack:TextField;
        public var mcOverAmmo:MovieClip;
        public var mcOverAttack:MovieClip;

        public function cannon_info_2_184()
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
            if (event.target == this.mcOverAttack)
            {
                this.hint.x = 44;
                this.hint.gotoAndStop("attack");
            }
            else if (event.target == this.mcOverFireRate)
            {
                this.hint.x = 128;
                this.hint.gotoAndStop("fire rate");
            }
            else if (event.target == this.mcOverAmmo)
            {
                this.hint.x = 210;
                this.hint.gotoAndStop("ammo");
            }
            else if (event.target == this.mcOverDistance)
            {
                this.hint.x = 294;
                this.hint.gotoAndStop("distance");
            }
            return;
        }// end function

        function frame1()
        {
            this.hint.stop();
            this.hint.visible = false;
            this.hint.mouseEnabled = false;
            this.mcOverAttack.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.mcOverFireRate.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.mcOverAmmo.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.mcOverDistance.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.mcOverAttack.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            this.mcOverFireRate.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            this.mcOverAmmo.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            this.mcOverDistance.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            return;
        }// end function

    }
}
