package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    public class GameMenu extends MovieClip
    {
        public var panel:MovieClip;
        public var bg:MovieClip;
        private var level:Level;

        public function GameMenu()
        {
            return;
        }// end function

        public function initialize(param1:Level) : void
        {
            this.level = param1;
            this.initButton(this.panel.btMusicOn);
            this.initButton(this.panel.btMusicOff);
            this.panel.btMusicOn.addEventListener(MouseEvent.CLICK, this.btMusicOnClick, false, 0, true);
            this.panel.btMusicOff.addEventListener(MouseEvent.CLICK, this.btMusicOffClick, false, 0, true);
            this.initButton(this.panel.btSoundOn);
            this.initButton(this.panel.btSoundOff);
            this.panel.btSoundOn.addEventListener(MouseEvent.CLICK, this.btSoundOnClick, false, 0, true);
            this.panel.btSoundOff.addEventListener(MouseEvent.CLICK, this.btSoundOffClick, false, 0, true);
            this.initButton(this.panel.btQualityLow);
            this.initButton(this.panel.btQualityMed);
            this.initButton(this.panel.btQualityHigh);
            this.panel.btQualityLow.addEventListener(MouseEvent.CLICK, this.btQualityLowClick, false, 0, true);
            this.panel.btQualityMed.addEventListener(MouseEvent.CLICK, this.btQualityMedClick, false, 0, true);
            this.panel.btQualityHigh.addEventListener(MouseEvent.CLICK, this.btQualityHighClick, false, 0, true);
            this.initButton(this.panel.btPauseOn);
            this.initButton(this.panel.btPauseOff);
            this.panel.btPauseOn.addEventListener(MouseEvent.CLICK, this.btPauseOnClick, false, 0, true);
            this.panel.btPauseOff.addEventListener(MouseEvent.CLICK, this.btPauseOffClick, false, 0, true);
            this.panel.btResume.addEventListener(MouseEvent.CLICK, this.btResumeClick, false, 0, true);
            this.panel.btRestart.addEventListener(MouseEvent.CLICK, this.btRestartClick, false, 0, true);
            this.panel.bgQuit.addEventListener(MouseEvent.CLICK, this.bgQuitClick, false, 0, true);
            if (SoundManager.enableMusic)
            {
                this.btMusicOnClick();
            }
            else
            {
                this.btMusicOffClick();
            }
            if (SoundManager.enableSound)
            {
                this.btSoundOnClick();
            }
            else
            {
                this.btSoundOffClick();
            }
            if (Level.autoPause)
            {
                this.btPauseOnClick();
            }
            else
            {
                this.btPauseOffClick();
            }
            if (stage.quality == "LOW")
            {
                this.btQualityLowClick();
            }
            else if (stage.quality == "MEDIUM")
            {
                this.btQualityMedClick();
            }
            else
            {
                this.btQualityHighClick();
            }
            return;
        }// end function

        private function initButton(param1:MovieClip) : void
        {
            param1.addEventListener(MouseEvent.MOUSE_OVER, this.btMouseOver, false, 0, true);
            param1.addEventListener(MouseEvent.MOUSE_OUT, this.btMouseOut, false, 0, true);
            return;
        }// end function

        private function btMouseOver(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 1)
            {
                event.currentTarget.gotoAndStop(2);
            }
            return;
        }// end function

        private function btMouseOut(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 2)
            {
                event.currentTarget.gotoAndStop(1);
            }
            return;
        }// end function

        private function btMusicOnClick(event:MouseEvent = null) : void
        {
            SoundManager.enableMusic = true;
            this.panel.btMusicOn.buttonMode = false;
            this.panel.btMusicOff.buttonMode = true;
            this.panel.btMusicOn.gotoAndStop(3);
            this.panel.btMusicOff.gotoAndStop(1);
            return;
        }// end function

        private function btMusicOffClick(event:MouseEvent = null) : void
        {
            SoundManager.enableMusic = false;
            this.panel.btMusicOn.buttonMode = true;
            this.panel.btMusicOff.buttonMode = false;
            this.panel.btMusicOn.gotoAndStop(1);
            this.panel.btMusicOff.gotoAndStop(3);
            return;
        }// end function

        private function btSoundOnClick(event:MouseEvent = null) : void
        {
            SoundManager.enableSound = true;
            this.panel.btSoundOn.buttonMode = false;
            this.panel.btSoundOff.buttonMode = true;
            this.panel.btSoundOn.gotoAndStop(3);
            this.panel.btSoundOff.gotoAndStop(1);
            return;
        }// end function

        private function btSoundOffClick(event:MouseEvent = null) : void
        {
            SoundManager.enableSound = false;
            this.panel.btSoundOn.buttonMode = true;
            this.panel.btSoundOff.buttonMode = false;
            this.panel.btSoundOn.gotoAndStop(1);
            this.panel.btSoundOff.gotoAndStop(3);
            return;
        }// end function

        private function btQualityLowClick(event:MouseEvent = null) : void
        {
            stage.quality = "LOW";
            this.panel.btQualityLow.buttonMode = false;
            this.panel.btQualityMed.buttonMode = true;
            this.panel.btQualityHigh.buttonMode = true;
            this.panel.btQualityLow.gotoAndStop(3);
            this.panel.btQualityMed.gotoAndStop(1);
            this.panel.btQualityHigh.gotoAndStop(1);
            return;
        }// end function

        private function btQualityMedClick(event:MouseEvent = null) : void
        {
            stage.quality = "MEDIUM";
            this.panel.btQualityLow.buttonMode = true;
            this.panel.btQualityMed.buttonMode = false;
            this.panel.btQualityHigh.buttonMode = true;
            this.panel.btQualityLow.gotoAndStop(1);
            this.panel.btQualityMed.gotoAndStop(3);
            this.panel.btQualityHigh.gotoAndStop(1);
            return;
        }// end function

        private function btQualityHighClick(event:MouseEvent = null) : void
        {
            stage.quality = "HIGH";
            this.panel.btQualityLow.buttonMode = true;
            this.panel.btQualityMed.buttonMode = true;
            this.panel.btQualityHigh.buttonMode = false;
            this.panel.btQualityLow.gotoAndStop(1);
            this.panel.btQualityMed.gotoAndStop(1);
            this.panel.btQualityHigh.gotoAndStop(3);
            return;
        }// end function

        private function btPauseOnClick(event:MouseEvent = null) : void
        {
            Level.autoPause = true;
            this.panel.btPauseOn.buttonMode = false;
            this.panel.btPauseOff.buttonMode = true;
            this.panel.btPauseOn.gotoAndStop(3);
            this.panel.btPauseOff.gotoAndStop(1);
            return;
        }// end function

        private function btPauseOffClick(event:MouseEvent = null) : void
        {
            Level.autoPause = false;
            this.panel.btPauseOn.buttonMode = true;
            this.panel.btPauseOff.buttonMode = false;
            this.panel.btPauseOn.gotoAndStop(1);
            this.panel.btPauseOff.gotoAndStop(3);
            return;
        }// end function

        private function btResumeClick(event:MouseEvent = null) : void
        {
            this.level.hideMenu();
            return;
        }// end function

        private function btRestartClick(event:MouseEvent = null) : void
        {
            this.level.restartLevel();
            return;
        }// end function

        private function btWalkthroughClick(event:MouseEvent = null) : void
        {
            navigateToURL(new URLRequest("http://blog.addictinggames.com/2012/07/walkthrough-steampunk-tower-defense/"), "_blank");
            return;
        }// end function

        private function bgQuitClick(event:MouseEvent = null) : void
        {
            this.level.quit();
            return;
        }// end function

        public function dispose() : void
        {
            this.disposeButton(this.panel.btMusicOn);
            this.disposeButton(this.panel.btMusicOff);
            this.panel.btMusicOn.removeEventListener(MouseEvent.CLICK, this.btMusicOnClick);
            this.panel.btMusicOff.removeEventListener(MouseEvent.CLICK, this.btMusicOffClick);
            this.disposeButton(this.panel.btSoundOn);
            this.disposeButton(this.panel.btSoundOff);
            this.panel.btSoundOn.removeEventListener(MouseEvent.CLICK, this.btSoundOnClick);
            this.panel.btSoundOff.removeEventListener(MouseEvent.CLICK, this.btSoundOffClick);
            this.disposeButton(this.panel.btQualityLow);
            this.disposeButton(this.panel.btQualityMed);
            this.disposeButton(this.panel.btQualityHigh);
            this.panel.btQualityLow.removeEventListener(MouseEvent.CLICK, this.btQualityLowClick);
            this.panel.btQualityMed.removeEventListener(MouseEvent.CLICK, this.btQualityMedClick);
            this.panel.btQualityHigh.removeEventListener(MouseEvent.CLICK, this.btQualityHighClick);
            this.disposeButton(this.panel.btPauseOn);
            this.disposeButton(this.panel.btPauseOff);
            this.panel.btPauseOn.removeEventListener(MouseEvent.CLICK, this.btPauseOnClick);
            this.panel.btPauseOff.removeEventListener(MouseEvent.CLICK, this.btPauseOffClick);
            this.panel.btResume.removeEventListener(MouseEvent.CLICK, this.btResumeClick);
            this.panel.btRestart.removeEventListener(MouseEvent.CLICK, this.btRestartClick);
            this.panel.bgQuit.removeEventListener(MouseEvent.CLICK, this.bgQuitClick);
            if (parent)
            {
                parent.removeChild(this);
            }
            this.level = null;
            return;
        }// end function

        private function disposeButton(param1:MovieClip) : void
        {
            param1.removeEventListener(MouseEvent.MOUSE_OVER, this.btMouseOver);
            param1.removeEventListener(MouseEvent.MOUSE_OUT, this.btMouseOut);
            return;
        }// end function

    }
}
