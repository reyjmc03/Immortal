package 
{
    import com.greensock.*;
    import flash.events.*;

    public class RadioGame extends Object
    {
        private var curSound:DGSound;
        private var soundPhh:DGSound;
        private var curWave:int = 1;
        private var curPhh:int = 1;
        private var totalWaves:int = 3;

        public function RadioGame()
        {
            return;
        }// end function

        public function initialize() : void
        {
            this.curWave = 1 + Math.random() * this.totalWaves;
            this.play(this.curWave, true);
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
            this.play(this.curWave);
            return;
        }// end function

        private function play(param1:int, param2:Boolean = true) : void
        {
            this.curWave = param1;
            if (this.curSound)
            {
                this.curSound.stop();
                this.curSound.channel.removeEventListener(Event.SOUND_COMPLETE, this.moveNext);
            }
            if (param2)
            {
                this.soundPhh = SoundManager.playOnce("radio_tuning_" + this.curPhh + ".wav", 0.2);
                TweenLite.delayedCall(1, this.playMelody);
                var _loc_3:String = this;
                var _loc_4:* = this.curPhh + 1;
                _loc_3.curPhh = _loc_4;
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
            if (this.curSound && this.curSound.channel)
            {
                this.curSound.channel.addEventListener(Event.SOUND_COMPLETE, this.moveNext, false, 0, true);
            }
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
                this.curSound.muteSmooth();
                this.curSound.channel.removeEventListener(Event.SOUND_COMPLETE, this.moveNext);
                this.curSound = null;
            }
            TweenLite.killDelayedCallsTo(this.playMelody);
            return;
        }// end function

    }
}
