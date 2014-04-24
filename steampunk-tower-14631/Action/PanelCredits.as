package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class PanelCredits extends MovieClip
    {
        public var btMenu:SimpleButton;
        public var btLogo:SimpleButton;

        public function PanelCredits()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function gotoDgSite(event:MouseEvent) : void
        {
            navigateToURL(new URLRequest("http://dg-company.com/"), "_blank");
            return;
        }// end function

        function frame1()
        {
            this.btLogo.addEventListener(MouseEvent.CLICK, this.gotoDgSite);
            return;
        }// end function

    }
}
