package 
{
    import com.greensock.*;
    import flash.events.*;
    import flash.media.*;

    public class DGSound extends Object
    {
        public var sound:Sound;
        public var channel:SoundChannel;
        private var volume:Number = 1;
        private var position:Number = 0;
        public var loops:int = 1;
        public var played:Boolean;
        public var name:String;

        public function DGSound(param1:Sound, param2:String)
        {
            this.sound = param1;
            this.name = param2;
            return;
        }// end function

        public function get vol() : Number
        {
            return this.channel.soundTransform.volume;
        }// end function

        public function set vol(param1:Number) : void
        {
            this.channel.soundTransform = new SoundTransform(param1);
            return;
        }// end function

        public function get transform() : SoundTransform
        {
            return this.channel.soundTransform;
        }// end function

        public function set transform(param1:SoundTransform) : void
        {
            this.channel.soundTransform = param1;
            return;
        }// end function

        public function play(param1:int, param2:Number, param3:Number) : void
        {
            this.volume = param2;
            this.loops = param1;
            this.channel = this.sound.play(this.position, param1, new SoundTransform(param3));
            this.channel.addEventListener(Event.SOUND_COMPLETE, this.soundCompleteHandler);
            this.played = false;
            return;
        }// end function

        private function soundCompleteHandler(event:Event) : void
        {
            this.channel.removeEventListener(Event.SOUND_COMPLETE, this.soundCompleteHandler);
            this.played = true;
            return;
        }// end function

        public function stop() : void
        {
            if (this.channel != null)
            {
                this.channel.stop();
                this.channel.removeEventListener(Event.SOUND_COMPLETE, this.soundCompleteHandler);
            }
            this.position = 0;
            this.loops = -1;
            this.played = true;
            return;
        }// end function

        public function pause() : void
        {
            this.position = this.channel.position;
            this.channel.stop();
            this.channel.removeEventListener(Event.SOUND_COMPLETE, this.soundCompleteHandler);
            return;
        }// end function

        public function restoreVolume() : void
        {
            this.vol = this.volume;
            return;
        }// end function

        public function resume() : void
        {
            if (this.position >= this.sound.length || this.loops > 1)
            {
                this.position = 0;
            }
            this.channel = this.sound.play(this.position, this.loops, new SoundTransform(this.volume));
            this.channel.addEventListener(Event.SOUND_COMPLETE, this.soundCompleteHandler);
            return;
        }// end function

        public function muteSmooth(param1:Number = 1) : void
        {
            TweenLite.to(this, param1, {vol:0, onComplete:this.stop});
            return;
        }// end function

    }
}
