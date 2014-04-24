package steampunk_tower_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    dynamic public class enemy_info_panel_179 extends MovieClip
    {
        public var txtHealth:TextField;
        public var mcHealth:MovieClip;
        public var hint:MovieClip;
        public var mcOverSpeed:MovieClip;
        public var txtArmor:TextField;
        public var txtName:TextField;
        public var txtAttack:TextField;
        public var txtSpeed:TextField;
        public var mcOverArmor:MovieClip;
        public var mcOverAttack:MovieClip;
        public var mcOverHealth:MovieClip;

        public function enemy_info_panel_179()
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
            if (event.target == this.mcOverHealth)
            {
                this.hint.x = 54;
                if (this.mcHealth.currentFrame == 1)
                {
                    this.hint.gotoAndStop("health");
                }
                else
                {
                    this.hint.gotoAndStop("strength");
                }
            }
            else if (event.target == this.mcOverAttack)
            {
                this.hint.x = 143;
                this.hint.gotoAndStop("attack");
            }
            else if (event.target == this.mcOverArmor)
            {
                this.hint.x = 215;
                this.hint.gotoAndStop("armor");
            }
            else if (event.target == this.mcOverSpeed)
            {
                this.hint.x = 295;
                this.hint.gotoAndStop("speed");
            }
            return;
        }// end function

        function frame1()
        {
            this.mcHealth.mouseEnabled = false;
            this.hint.stop();
            this.hint.visible = false;
            this.hint.mouseEnabled = false;
            this.mcOverHealth.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.mcOverAttack.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.mcOverArmor.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.mcOverSpeed.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint);
            this.mcOverHealth.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            this.mcOverAttack.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            this.mcOverArmor.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            this.mcOverSpeed.addEventListener(MouseEvent.MOUSE_OVER, this.showHint);
            return;
        }// end function

    }
}
