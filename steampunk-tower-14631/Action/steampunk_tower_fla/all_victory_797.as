package steampunk_tower_fla
{
    import flash.display.*;
    import flash.text.*;

    dynamic public class all_victory_797 extends MovieClip
    {
        public var txtMon:TextField;
        public var btOk:SimpleButton;
        public var txtHe:TextField;
        public var txtTotalScore:TextField;
        public var btRestart:SimpleButton;
        public var txtExtr:TextField;
        public var txtExtraScore:TextField;
        public var txtHealthScore:TextField;
        public var txtMoneyScore:TextField;
        public var txtSc:TextField;

        public function all_victory_797()
        {
            addFrameScript(18, this.frame19, 27, this.frame28, 35, this.frame36);
            return;
        }// end function

        function frame19()
        {
            if (Level(parent.parent.parent).starsCount == 1)
            {
                stop();
            }
            return;
        }// end function

        function frame28()
        {
            if (Level(parent.parent.parent).starsCount == 2)
            {
                stop();
            }
            return;
        }// end function

        function frame36()
        {
            stop();
            return;
        }// end function

    }
}
