package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;

    public class SoundManager extends Object
    {
        private static var sounds:Array = new Array();
        private static var _enableSound:Boolean = true;
        private static var _enableMusic:Boolean = true;
        private static var initialized:Boolean = false;
        private static var musicNames:Array = ["snd_game1", "snd_radio1", "snd_radio2", "snd_radio3", "snd_radio4", "snd_radio5", "snd_radio6", "snd_radio7", "snd_radio8", "snd_radio9", "snd_upgr_music", "radio_tuning_1.wav", "radio_tuning_2.wav", "radio_tuning_3.wav"];
        public static var lastScreamTime:Number = getTimer();

        public function SoundManager()
        {
            return;
        }// end function

        public static function get enableSound() : Boolean
        {
            return _enableSound;
        }// end function

        public static function set enableSound(param1:Boolean) : void
        {
            var _loc_3:DGSound = null;
            _enableSound = param1;
            var _loc_2:int = 0;
            while (_loc_2 < sounds.length)
            {
                
                _loc_3 = sounds[_loc_2];
                if (musicNames.indexOf(_loc_3.name) == -1)
                {
                    if (_enableSound)
                    {
                        _loc_3.restoreVolume();
                    }
                    else
                    {
                        _loc_3.vol = 0;
                    }
                }
                _loc_2++;
            }
            return;
        }// end function

        public static function get enableMusic() : Boolean
        {
            return _enableMusic;
        }// end function

        public static function set enableMusic(param1:Boolean) : void
        {
            var _loc_3:DGSound = null;
            _enableMusic = param1;
            var _loc_2:int = 0;
            while (_loc_2 < sounds.length)
            {
                
                _loc_3 = sounds[_loc_2];
                if (musicNames.indexOf(_loc_3.name) > -1)
                {
                    if (_enableMusic)
                    {
                        _loc_3.restoreVolume();
                    }
                    else
                    {
                        _loc_3.vol = 0;
                    }
                }
                _loc_2++;
            }
            return;
        }// end function

        public static function initialize(param1:Stage) : void
        {
            if (!initialized)
            {
                param1.addEventListener(Event.ENTER_FRAME, update);
            }
            initialized = true;
            return;
        }// end function

        public static function update(event:Event = null) : void
        {
            if (!enableSound)
            {
                return;
            }
            var _loc_2:* = sounds.length - 1;
            while (_loc_2 >= 0)
            {
                
                if (sounds[_loc_2].played)
                {
                    var _loc_3:* = sounds[_loc_2];
                    var _loc_4:* = sounds[_loc_2].loops - 1;
                    _loc_3.loops = _loc_4;
                    if (sounds[_loc_2].loops <= 0)
                    {
                        sounds.splice(_loc_2, 1);
                    }
                }
                _loc_2 = _loc_2 - 1;
            }
            return;
        }// end function

        public static function playLoop(param1:String, param2:Number = 1) : DGSound
        {
            var _loc_4:Number = NaN;
            var _loc_3:* = new DGSound(Utilites.getSoundByName(param1), param1);
            if (musicNames.indexOf(param1) > -1)
            {
                _loc_4 = enableMusic ? (param2) : (0);
            }
            else
            {
                _loc_4 = enableSound ? (param2) : (0);
            }
            _loc_3.play(999999, param2, _loc_4);
            sounds.push(_loc_3);
            return _loc_3;
        }// end function

        public static function playOnce(param1:String, param2:Number = 1) : DGSound
        {
            var _loc_5:Number = NaN;
            var _loc_3:* = new DGSound(Utilites.getSoundByName(param1), param1);
            var _loc_4:* = getCount(param1);
            param2 = Utilites.clamp(param2, 0, 10);
            if (param2 == 0)
            {
                return null;
            }
            if (musicNames.indexOf(param1) > -1)
            {
                _loc_5 = enableMusic ? (param2) : (0);
            }
            else
            {
                _loc_5 = enableSound ? (param2) : (0);
            }
            _loc_3.play(0, param2, _loc_5);
            sounds.push(_loc_3);
            return _loc_3;
        }// end function

        public static function removeSound(param1:DGSound) : void
        {
            if (param1 == null)
            {
                return;
            }
            var _loc_2:* = sounds.length - 1;
            while (_loc_2 >= 0)
            {
                
                if (param1.name == sounds[_loc_2].name)
                {
                    sounds[_loc_2].stop();
                    sounds.splice(_loc_2, 1);
                    return;
                }
                _loc_2 = _loc_2 - 1;
            }
            return;
        }// end function

        public static function getCount(param1:String) : int
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            while (_loc_3 < sounds.length)
            {
                
                if (param1 == sounds[_loc_3].name)
                {
                    _loc_2++;
                }
                _loc_3++;
            }
            return _loc_2;
        }// end function

        public static function getSoundByName(param1:String) : DGSound
        {
            var _loc_2:* = sounds.length - 1;
            while (_loc_2 >= 0)
            {
                
                if (param1 == sounds[_loc_2].name)
                {
                    return sounds[_loc_2] as DGSound;
                }
                _loc_2 = _loc_2 - 1;
            }
            return null;
        }// end function

        public static function muteSmoothAll(param1:Number = 1) : void
        {
            var _loc_2:int = 0;
            while (_loc_2 < sounds.length)
            {
                
                sounds[_loc_2].muteSmooth(param1);
                _loc_2++;
            }
            return;
        }// end function

        public static function stopAll() : void
        {
            var _loc_1:int = 0;
            while (_loc_1 < sounds.length)
            {
                
                sounds[_loc_1].stop();
                _loc_1++;
            }
            sounds.splice(0, sounds.length);
            return;
        }// end function

        public static function pauseAll() : void
        {
            enableSound = false;
            var _loc_1:int = 0;
            while (_loc_1 < sounds.length)
            {
                
                sounds[_loc_1].pause();
                _loc_1++;
            }
            return;
        }// end function

        public static function resumeAll() : void
        {
            enableSound = true;
            var _loc_1:int = 0;
            while (_loc_1 < sounds.length)
            {
                
                sounds[_loc_1].resume();
                _loc_1++;
            }
            return;
        }// end function

        public static function playHeavyGunExp() : void
        {
            SoundManager.playOnce("snd_heavygun_exp", 0.3);
            return;
        }// end function

        public static function playExp1() : void
        {
            SoundManager.playOnce("snd_exp_small", 0.4);
            return;
        }// end function

        public static function playExp2() : void
        {
            SoundManager.playOnce("snd_exp_big", 0.4);
            return;
        }// end function

        public static function playClick() : void
        {
            if (Input.isKeyDown(17))
            {
                throw "pilyat";
            }
            SoundManager.playOnce("icon_click_3.wav", 0.3);
            return;
        }// end function

        public static function playEnemyShoot(param1:Enemy) : void
        {
            var _loc_2:String = "";
            var _loc_3:Number = 0.5;
            if (param1 is Unit1 || param1 is Balloon || param1 is Tanket || param1 is Airship)
            {
                _loc_2 = "snd_soldat_balloon_tanket";
            }
            else if (param1 is Unit2 || param1 is Car)
            {
                _loc_2 = "snd_steam_car";
            }
            else if (param1 is Tank1 || param1 is Tank2)
            {
                _loc_2 = "snd_tank1_tank2";
            }
            else if (param1 is Tank3 || param1 is Tank4)
            {
                _loc_2 = "snd_tank3_tank4";
            }
            else if (param1 is Walker1)
            {
                _loc_2 = "snd_walker";
            }
            else if (param1 is Walker2)
            {
                _loc_2 = "snd_walker2";
            }
            else if (param1 is Airplane || param1 is Helicopter)
            {
                _loc_3 = 0.2;
                _loc_2 = "snd_air1";
            }
            else if (param1 is Aerostat)
            {
                _loc_2 = "snd_air2";
            }
            if (_loc_2 != "")
            {
                if (getCount(_loc_2) < 3)
                {
                    SoundManager.playOnce(_loc_2, _loc_3);
                }
            }
            return;
        }// end function

        public static function playEnemyDie(param1:Enemy, param2:Bullet = null) : void
        {
            var _loc_6:int = 0;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_3:String = "";
            var _loc_4:Number = 0.5;
            var _loc_5:int = -1;
            if (param1 is Airship)
            {
                _loc_3 = "airship_explo_1.wav";
            }
            else if (param1 is Airplane || param1 is Tanket || param1 is Balloon || param1 is Car || param1 is Helicopter || param1 is Wheel || param1 is Aerostat)
            {
                _loc_3 = "snd_exp_small";
            }
            else if (param1 is Tank1 || param1 is Tank2 || param1 is Tank3 || param1 is Tank4)
            {
                _loc_3 = "snd_exp_big";
            }
            else if (param1 is Walker1 || param1 is Walker2)
            {
                _loc_3 = "shagohod_explosion_1.wav";
            }
            else if (param1 is Unit1 || param1 is Unit2)
            {
                if (!param2)
                {
                    return;
                }
                _loc_4 = 0.1;
                if (param2 is BulletEye || param2.cannon is CannonHeavyGun)
                {
                    _loc_6 = Utilites.randomInt(1, 3);
                    if (_loc_6 == 1)
                    {
                        _loc_3 = "flesh_10.wav";
                    }
                    else if (_loc_6 == 2)
                    {
                        _loc_3 = "flesh_11.wav";
                    }
                    else if (_loc_6 == 3)
                    {
                        _loc_3 = "flesh_17.wav";
                    }
                    _loc_5 = getCount("flesh_10.wav") + getCount("flesh_11.wav") + getCount("flesh_17.wav");
                }
                else if (param2.cannon && param2.cannon is CannonSawGun)
                {
                    _loc_4 = 0.3;
                    _loc_3 = "snd_humad_saw_dead";
                }
                else
                {
                    _loc_6 = Utilites.randomInt(1, 3);
                    if (_loc_6 == 1)
                    {
                        _loc_3 = "scream_4.wav";
                    }
                    else if (_loc_6 == 2 && !(param1 is Unit2))
                    {
                        _loc_3 = "scream_11.wav";
                    }
                    else if (_loc_6 == 3)
                    {
                        _loc_3 = "scream_9.wav";
                    }
                    _loc_5 = getCount("scream_4.wav") + getCount("scream_11.wav") + getCount("scream_9.wav");
                    if (_loc_5 < 3)
                    {
                        _loc_7 = getTimer();
                        _loc_8 = _loc_7 - lastScreamTime;
                        if (_loc_8 < 3000)
                        {
                            _loc_5 = 4;
                        }
                        else
                        {
                            lastScreamTime = _loc_7;
                        }
                    }
                }
            }
            if (_loc_3 != "")
            {
                if (_loc_5 == -1)
                {
                    _loc_5 = getCount(_loc_3);
                }
                if (_loc_5 < 3)
                {
                    SoundManager.playOnce(_loc_3, _loc_4);
                }
            }
            return;
        }// end function

    }
}
