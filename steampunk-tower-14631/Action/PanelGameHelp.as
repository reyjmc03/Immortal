package 
{
    import flash.display.*;

    dynamic public class PanelGameHelp extends MovieClip
    {
        public var poster:MovieClip;
        public var help_txt:MovieClip;

        public function PanelGameHelp()
        {
            addFrameScript(15, this.frame16);
            return;
        }// end function

        function frame16()
        {
            stop();
            this.poster.movie.play();
            return;
        }// end function

    }
}
