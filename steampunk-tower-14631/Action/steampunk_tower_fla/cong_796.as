package steampunk_tower_fla
{
    import flash.display.*;

    dynamic public class cong_796 extends MovieClip
    {
        public var cont:MovieClip;

        public function cong_796()
        {
            addFrameScript(0, this.frame1, 11, this.frame12);
            return;
        }// end function

        function frame1()
        {
            this.cont.stop();
            return;
        }// end function

        function frame12()
        {
            stop();
            this.cont.play();
            return;
        }// end function

    }
}
