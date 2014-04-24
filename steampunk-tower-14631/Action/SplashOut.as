package 
{
    import flash.display.*;

    dynamic public class SplashOut extends MovieClip
    {

        public function SplashOut()
        {
            addFrameScript(13, this.frame14);
            return;
        }// end function

        function frame14()
        {
            parent.removeChild(this);
            stop();
            return;
        }// end function

    }
}
