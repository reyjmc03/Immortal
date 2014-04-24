package 
{
    import flash.display.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.utils.*;

    public class Utilites extends Object
    {
        public static const PI2:Number = Math.PI * 2;
        public static const DEG_TO_RAD:Object = 180 / Math.PI;
        public static const RAD_TO_DEG:Object = Math.PI / 180;
        public static const ZERO_POINT:Point = new Point();

        public function Utilites()
        {
            return;
        }// end function

        public static function randBool() : Boolean
        {
            return Math.random() > 0.5;
        }// end function

        public static function randomInt(param1, param2:Number) : int
        {
            if (param1 == param2)
            {
                return param1;
            }
            return Math.round(Math.random() * (param2 - param1) + param1);
        }// end function

        public static function randomNumber(param1, param2:Number) : Number
        {
            if (param1 == param2)
            {
                return param1;
            }
            return Math.random() * (param2 - param1) + param1;
        }// end function

        public static function inRange(param1, param2, param3:Number) : Boolean
        {
            return param1 >= param2 && param1 <= param3;
        }// end function

        public static function clamp(param1, param2, param3:Number) : Number
        {
            if (param1 < param2)
            {
                param1 = param2;
            }
            if (param1 > param3)
            {
                param1 = param3;
            }
            return param1;
        }// end function

        public static function arrayToString(param1:Array) : String
        {
            var _loc_3:int = 0;
            var _loc_2:String = "";
            if (param1)
            {
                _loc_3 = 0;
                while (_loc_3 < param1.length)
                {
                    
                    _loc_2 = _loc_2 + (param1[_loc_3].toString() + "; ");
                    _loc_3++;
                }
            }
            return _loc_2;
        }// end function

        public static function hideObject(param1:Sprite) : void
        {
            param1.visible = false;
            return;
        }// end function

        public static function drawSegment(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:uint, param6:Number) : void
        {
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_7:* = param1.graphics;
            param1.graphics.clear();
            _loc_7.beginFill(param5, param6);
            _loc_7.moveTo(0, 0);
            var _loc_8:Number = 0.1;
            var _loc_9:* = param3;
            while (_loc_9 < param4)
            {
                
                _loc_10 = param2 * Math.cos(_loc_9 * Math.PI / 180);
                _loc_11 = (-param2) * Math.sin(_loc_9 * Math.PI / 180);
                _loc_7.lineTo(_loc_10, _loc_11);
                _loc_9 = _loc_9 + _loc_8;
            }
            _loc_7.moveTo(0, 0);
            _loc_7.endFill();
            return;
        }// end function

        public static function DistBetweenPoints(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            var _loc_5:* = param1 - param3;
            var _loc_6:* = param2 - param4;
            var _loc_7:* = Math.sqrt(_loc_5 * _loc_5 + _loc_6 * _loc_6);
            return Math.sqrt(_loc_5 * _loc_5 + _loc_6 * _loc_6);
        }// end function

        public static function AngleBetweenPoints(param1:Point, param2:Point) : Number
        {
            return AngleBetweenPoints3(param1.x, param1.y, param2.x, param2.y);
        }// end function

        public static function AngleBetweenPoints2(param1:Point, param2:Number, param3:Number) : Number
        {
            return AngleBetweenPoints3(param1.x, param1.y, param2, param3);
        }// end function

        public static function AngleBetweenPoints3(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            var _loc_5:* = param1 - param3;
            var _loc_6:* = param2 - param4;
            var _loc_7:* = Math.atan2(_loc_6, _loc_5) / Math.PI * 180;
            return Math.atan2(_loc_6, _loc_5) / Math.PI * 180;
        }// end function

        public static function directionFromAngle(param1:Number) : Point
        {
            param1 = param1 / DEG_TO_RAD;
            return new Point(Math.cos(param1), Math.sin(param1));
        }// end function

        public static function getSoundByName(param1:String) : Sound
        {
            var _loc_2:Sound = null;
            var _loc_3:Class = null;
            switch(param1)
            {
                case "snd_building":
                {
                    _loc_2 = new snd_building();
                    break;
                }
                case "snd_reporting":
                {
                    _loc_2 = new snd_reporting();
                    break;
                }
                case "snd_yessir":
                {
                    _loc_2 = new snd_yessir();
                    break;
                }
                case "snd_lift_up":
                {
                    _loc_2 = new snd_lift_up();
                    break;
                }
                case "snd_lift_down":
                {
                    _loc_2 = new snd_lift_down();
                    break;
                }
                case "snd_tower_up":
                {
                    _loc_2 = new snd_tower_up();
                    break;
                }
                case "snd_steam1":
                {
                    _loc_2 = new snd_steam1();
                    break;
                }
                case "snd_clock_chime":
                {
                    _loc_2 = new snd_clock_chime();
                    break;
                }
                case "snd_game1":
                {
                    _loc_2 = new snd_game1();
                    break;
                }
                case "snd_upgr_music":
                {
                    _loc_2 = new snd_upgr_music();
                    break;
                }
                case "snd_radio1":
                {
                    _loc_2 = new snd_radio1();
                    break;
                }
                case "snd_radio2":
                {
                    _loc_2 = new snd_radio2();
                    break;
                }
                case "snd_radio3":
                {
                    _loc_2 = new snd_radio3();
                    break;
                }
                case "snd_radio4":
                {
                    _loc_2 = new snd_radio4();
                    break;
                }
                case "snd_radio5":
                {
                    _loc_2 = new snd_radio5();
                    break;
                }
                case "snd_radio6":
                {
                    _loc_2 = new snd_radio6();
                    break;
                }
                case "snd_radio7":
                {
                    _loc_2 = new snd_radio7();
                    break;
                }
                case "snd_heavygun1_shoot1":
                {
                    _loc_2 = new snd_heavygun1_shoot1();
                    break;
                }
                case "snd_heavygun2_shoot1":
                {
                    _loc_2 = new snd_heavygun2_shoot1();
                    break;
                }
                case "snd_heavygun2_shoot2":
                {
                    _loc_2 = new snd_heavygun2_shoot2();
                    break;
                }
                case "snd_lightning1_shoot1":
                {
                    _loc_2 = new snd_lightning1_shoot1();
                    break;
                }
                case "snd_lightning1_shoot2":
                {
                    _loc_2 = new snd_lightning1_shoot2();
                    break;
                }
                case "snd_lightning2_shoot1":
                {
                    _loc_2 = new snd_lightning2_shoot1();
                    break;
                }
                case "snd_machinegun_shoot_3":
                {
                    _loc_2 = new snd_machinegun_shoot_3();
                    break;
                }
                case "snd_machinegun_shoot_2":
                {
                    _loc_2 = new snd_machinegun_shoot_2();
                    break;
                }
                case "snd_machinegun_shoot_1":
                {
                    _loc_2 = new snd_machinegun_shoot_1();
                    break;
                }
                case "snd_machinegun2_shoot_1":
                {
                    _loc_2 = new snd_machinegun2_shoot_1();
                    break;
                }
                case "snd_machinegun2_shoot_2":
                {
                    _loc_2 = new snd_machinegun2_shoot_2();
                    break;
                }
                case "snd_saw1_shoot1":
                {
                    _loc_2 = new snd_saw1_shoot1();
                    break;
                }
                case "snd_saw1_shoot2":
                {
                    _loc_2 = new snd_saw1_shoot2();
                    break;
                }
                case "snd_saw1_shoot3":
                {
                    _loc_2 = new snd_saw1_shoot3();
                    break;
                }
                case "snd_saw_rotate":
                {
                    _loc_2 = new snd_saw_rotate();
                    break;
                }
                case "snd_walker2":
                {
                    _loc_2 = new snd_walker2();
                    break;
                }
                case "snd_walker":
                {
                    _loc_2 = new snd_walker();
                    break;
                }
                case "snd_tank3_tank4":
                {
                    _loc_2 = new snd_tank3_tank4();
                    break;
                }
                case "snd_tank1_tank2":
                {
                    _loc_2 = new snd_tank1_tank2();
                    break;
                }
                case "snd_steam_car":
                {
                    _loc_2 = new snd_steam_car();
                    break;
                }
                case "snd_soldat_balloon_tanket":
                {
                    _loc_2 = new snd_soldat_balloon_tanket();
                    break;
                }
                case "snd_air2":
                {
                    _loc_2 = new snd_air2();
                    break;
                }
                case "snd_air1":
                {
                    _loc_2 = new snd_air1();
                    break;
                }
                case "snd_heavygun_exp":
                {
                    _loc_2 = new snd_heavygun_exp();
                    break;
                }
                case "snd_exp_small":
                {
                    _loc_2 = new snd_exp_small();
                    break;
                }
                case "snd_exp_big":
                {
                    _loc_2 = new snd_exp_big();
                    break;
                }
                case "snd_humad_saw_dead":
                {
                    _loc_2 = new snd_humad_saw_dead();
                    break;
                }
                case "snd_step":
                {
                    _loc_2 = new snd_step();
                    break;
                }
                case "snd_airplane_fly":
                {
                    _loc_2 = new snd_airplane_fly();
                    break;
                }
                case "snd_heli_fly":
                {
                    _loc_2 = new snd_heli_fly();
                    break;
                }
                case "snd_car_engine":
                {
                    _loc_2 = new snd_car_engine();
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (!_loc_2)
            {
                _loc_3 = getDefinitionByName(param1) as Class;
                if (_loc_3)
                {
                    _loc_2 = new _loc_3 as Sound;
                }
            }
            return _loc_2;
        }// end function

        public static function getUnitInfoName(param1:String) : String
        {
            var _loc_2:String = "";
            switch(param1)
            {
                case "airplane":
                {
                    _loc_2 = "Airplane";
                    break;
                }
                case "car":
                {
                    _loc_2 = "Armored Car";
                    break;
                }
                case "heli":
                {
                    _loc_2 = "Helicopter";
                    break;
                }
                case "tank1":
                {
                    _loc_2 = "Tank";
                    break;
                }
                case "tank2":
                {
                    _loc_2 = "Armored Tank";
                    break;
                }
                case "tank3":
                {
                    _loc_2 = "Grand Tank";
                    break;
                }
                case "tank4":
                {
                    _loc_2 = "The Boss";
                    break;
                }
                case "unit1":
                {
                    _loc_2 = "Soldier";
                    break;
                }
                case "unit2":
                {
                    _loc_2 = "Steam Soldier";
                    break;
                }
                case "wheel":
                {
                    _loc_2 = "Monocycle";
                    break;
                }
                case "walker1":
                {
                    _loc_2 = "Walker";
                    break;
                }
                case "walker2":
                {
                    _loc_2 = "Grand Walker";
                    break;
                }
                case "aerostat":
                {
                    _loc_2 = "Airship";
                    break;
                }
                case "airship":
                {
                    _loc_2 = "Grand Airship";
                    break;
                }
                case "parashut":
                {
                    _loc_2 = "Parachutist";
                    break;
                }
                case "tanket":
                {
                    _loc_2 = "Tanket";
                    break;
                }
                case "balloon":
                {
                    _loc_2 = "Balloon";
                    break;
                }
                default:
                {
                    break;
                }
            }
            return _loc_2;
        }// end function

    }
}
