package 
{
    import com.greensock.*;
    import flash.display.*;
    import flash.events.*;

    public class Radio extends MovieClip
    {
        public var radio_next:SimpleButton;
        public var radio_prev:SimpleButton;
        public var radio_off:SimpleButton;
        public var line:SimpleButton;
        public var radio_on:SimpleButton;
        private var curSound:DGSound;
        private var soundPhh:DGSound;
        private var curWave:int = 1;
        private var curPhh:int = 1;
        private var totalWaves:int = 7;
        private var lineMinX:Number = 15;
        private var lineMaxX:Number = 55;
        private static var firstLoad:Boolean = true;

        public function Radio()
        {
            return;
        }// end function

        public function initialize() : void
        {
            this.radio_on.addEventListener(MouseEvent.CLICK, this.radioTurnOff);
            this.radio_off.addEventListener(MouseEvent.CLICK, this.radioTurnOn);
            this.radio_off.visible = false;
            if (firstLoad)
            {
                firstLoad = false;
                this.curWave = 6;
            }
            else
            {
                this.curWave = 1 + Math.random() * this.totalWaves;
            }
            this.line.x = this.lineMinX + Math.random() * (this.lineMaxX - this.lineMinX);
            this.moveWaveTo(this.curWave, false);
            this.radio_next.addEventListener(MouseEvent.CLICK, this.nextWave);
            this.radio_prev.addEventListener(MouseEvent.CLICK, this.prevWave);
            if (SoundManager.enableMusic)
            {
                this.radioTurnOn(null);
            }
            else
            {
                this.radioTurnOff(null);
            }
            return;
        }// end function

        private function radioTurnOff(event:MouseEvent) : void
        {
            SoundManager.enableMusic = false;
            this.radio_on.visible = false;
            this.radio_off.visible = true;
            return;
        }// end function

        private function radioTurnOn(event:MouseEvent) : void
        {
            SoundManager.enableMusic = true;
            this.radio_on.visible = true;
            this.radio_off.visible = false;
            return;
        }// end function

        private function nextWave(event:MouseEvent) : void
        {
            var _loc_2:String = this;
            var _loc_3:* = this.curWave + 1;
            _loc_2.curWave = _loc_3;
            if (this.curWave > this.totalWaves)
            {
                this.curWave = 1;
            }
            this.moveWaveTo(this.curWave);
            return;
        }// end function

        private function prevWave(event:MouseEvent) : void
        {
            var _loc_2:String = this;
            var _loc_3:* = this.curWave - 1;
            _loc_2.curWave = _loc_3;
            if (this.curWave < 1)
            {
                this.curWave = this.totalWaves;
            }
            this.moveWaveTo(this.curWave);
            return;
        }// end function

        private function moveWaveTo(param1:int, param2:Boolean = true) : void
        {
            this.curWave = param1;
            var _loc_3:* = this.lineMinX + (this.lineMaxX - this.lineMinX) / (this.totalWaves - 1) * (param1 - 1);
            TweenLite.to(this.line, 1, {x:_loc_3});
            if (this.curSound)
            {
                this.curSound.stop();
                this.curSound.channel.removeEventListener(Event.SOUND_COMPLETE, this.moveNext);
            }
            if (param2)
            {
                this.soundPhh = SoundManager.playOnce("radio_tuning_" + this.curPhh + ".wav", 0.5);
                TweenLite.delayedCall(1, this.playMelody);
                var _loc_4:String = this;
                var _loc_5:* = this.curPhh + 1;
                _loc_4.curPhh = _loc_5;
                if (this.curPhh > 3)
                {
                    this.curPhh = 1;
                }
            }
            else
            {
                this.playMelody();
            }
            return;
        }// end function

        private function playMelody() : void
        {
            if (this.soundPhh)
            {
                this.soundPhh.muteSmooth();
            }
            this.curSound = SoundManager.playOnce("snd_radio" + this.curWave, 0.8);
            this.curSound.channel.addEventListener(Event.SOUND_COMPLETE, this.moveNext);
            return;
        }// end function

        private function moveNext(event:Event) : void
        {
            this.nextWave(null);
            return;
        }// end function

        public function dispose() : void
        {
            if (this.curSound)
            {
                this.curSound.stop();
                this.curSound.channel.removeEventListener(Event.SOUND_COMPLETE, this.moveNext);
            }
            this.radio_next.removeEventListener(MouseEvent.CLICK, this.nextWave);
            this.radio_prev.removeEventListener(MouseEvent.CLICK, this.prevWave);
            this.radio_on.removeEventListener(MouseEvent.CLICK, this.radioTurnOff);
            this.radio_off.removeEventListener(MouseEvent.CLICK, this.radioTurnOn);
            return;
        }// end function

    }
}
