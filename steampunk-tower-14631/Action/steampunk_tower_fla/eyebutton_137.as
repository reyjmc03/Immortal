package steampunk_tower_fla
{
    import flash.display.*;
    import flash.events.*;

    dynamic public class eyebutton_137 extends MovieClip
    {
        public var st_button:MovieClip;
        public var st_button_selected:Boolean;

        public function eyebutton_137()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function st_button_selected_ani(event:Event)
        {
            if (this.st_button_selected == true)
            {
                if (this.st_button.sel_btss.alpha < 1)
                {
                    this.st_button.sel_btss.alpha = this.st_button.sel_btss.alpha + 0.1;
                }
            }
            else if (this.st_button.sel_btss.alpha > 0)
            {
                this.st_button.sel_btss.alpha = this.st_button.sel_btss.alpha - 0.1;
            }
            return;
        }// end function

        public function ssbt_over(event:MouseEvent)
        {
            this.st_button_selected = true;
            return;
        }// end function

        public function ssbt_out(event:MouseEvent)
        {
            this.st_button_selected = false;
            return;
        }// end function

        function frame1()
        {
            this.st_button.sel_btss.alpha = 0;
            this.st_button.buttonMode = true;
            addEventListener(Event.ENTER_FRAME, this.st_button_selected_ani);
            this.st_button.addEventListener(MouseEvent.MOUSE_OVER, this.ssbt_over);
            this.st_button.addEventListener(MouseEvent.MOUSE_OUT, this.ssbt_out);
            return;
        }// end function

    }
}
