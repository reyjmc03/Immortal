package steampunk_tower_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class btFb_72 extends MovieClip
    {

        public function btFb_72()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function goFb(event:MouseEvent) : void
        {
            navigateToURL(new URLRequest("http://www.facebook.com/ArmorGames"), "_blank");
            return;
        }// end function

        function frame1()
        {
            buttonMode = true;
            addEventListener(MouseEvent.CLICK, this.goFb);
            return;
        }// end function

    }
}
