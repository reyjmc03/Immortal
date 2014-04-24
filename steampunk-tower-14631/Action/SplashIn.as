package 
{
    import flash.display.*;

    dynamic public class SplashIn extends MovieClip
    {

        public function SplashIn()
        {
            addFrameScript(10, this.frame11);
            return;
        }// end function

        function frame11()
        {
            parent.removeChild(this);
            stop();
            return;
        }// end function

    }
}
