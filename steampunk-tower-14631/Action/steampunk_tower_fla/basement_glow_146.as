package steampunk_tower_fla
{
    import flash.display.*;

    dynamic public class basement_glow_146 extends MovieClip
    {

        public function basement_glow_146()
        {
            addFrameScript(0, this.frame1, 1, this.frame2);
            return;
        }// end function

        function frame1()
        {
            stop();
            visible = false;
            return;
        }// end function

        function frame2()
        {
            visible = true;
            return;
        }// end function

    }
}
