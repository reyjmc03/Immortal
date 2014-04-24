package 
{
    import flash.display.*;

    public class UnitInfo extends Object
    {
        private static var color1:uint = 6736896;
        private static var color2:uint = 16777062;
        private static var color3:uint = 16763904;
        private static var color4:uint = 16737792;
        private static var color5:uint = 16711680;
        private static var aerostat:Array = [color1, color1, "Low", color3, "Slow", color3, "короткое описание\n", "Battle zeppelin. Very vulnerable, but carrying heavy machineguns. Don\'t let it near the tower!"];
        private static var airplane:Array = [color1, color1, "Low", color3, "Fast", color5, "короткое описание", "First battleplane. Jet plane, but with soft structure. Build lightning in case of airstrike! "];
        private static var airship:Array = [color4, color4, "High", color5, "Slow", color3, "короткое описание", "Enormous flying fortress! Flying battleship with outstanding combat power. Pride of the Empire!"];
        private static var ballon:Array = [color1, color1, "Low", color3, "Fast", color5, "короткое описание", "Slow balloon, not intended for battle action. Serves only for distraction of your guns from the enemy."];
        private static var car:Array = [color2, color2, "Medium", color4, "Fast", color5, "Высокая скорость\n Средняя броня", "Fast armored car with built-in mortar. Destroy them first of all!"];
        private static var helicopter:Array = [color2, color1, "Medium", color4, "Average", color4, "короткое описание", "Prototype of battle helicopter! Very dexterous and deadly. Enchained in extra armor."];
        private static var tank1:Array = [color2, color3, "Medium", color4, "Average", color4, "короткое описание", "First series \"Land Ship\". Tank \"Mark 1 - Male\""];
        private static var tank2:Array = [color2, color3, "Medium", color4, "Average", color4, "короткое описание", "Modification of \"Mark 1 - Female\". Has heavier armor and improved design."];
        private static var tank3:Array = [color3, color5, "High", color5, "Slow", color3, "короткое описание", "Secret project of the Empire – huge heavy tank equipped with large-caliber artillery cannon!"];
        private static var tank4:Array = [color5, color5, "High", color5, "Slow", color3, "короткое описание", "The Boss. Huge Self-moving Base with outstanding fire power. Pride of the Empire!"];
        private static var tanket:Array = [color1, color1, "Medium", color4, "Average", color4, "Защита от молний", "First prototype of tank. Wooden base, weak gun."];
        private static var unit1:Array = [color1, color1, "Low", color1, "Fast", color5, "Мало жизней\n Нет защиты", "Private soldier of the Empire army. Very weak, but fast. Pride of the Empire!"];
        private static var unit2:Array = [color1, color1, "Medium", color4, "Average", color4, "Мало жизней\n Средняя броня\n Средняя скорость", "Armored soldier of the Empire. Armadillo suit is equipped with miniature steam generator and built-in gun."];
        private static var walker1:Array = [color3, color4, "High", color5, "Slow", color3, "короткое описание", "Prototype of new battle \"Walking\" unit. Has big radius of fire, but low speed."];
        private static var walker2:Array = [color4, color5, "High", color5, "Slow", color3, "короткое описание", "Huge walking battle machine bringing fear and destruction to enemies. Pride of the Empire!!"];
        private static var wheel:Array = [color1, color2, "Low", color1, "Fast", color5, "Камикадзе!", "Unmanned monocycle with loaded bomb. Always keep in store some machineguns or lightning for monocycles"];
        private static var parashut:Array = [color1, color1, "Low", color1, "Fast", color5, "В воздухе, по нему сложнее попасть.", "Trooper – is airlanded onto enemy’s territory. Difficult to shoot him in the air."];

        public function UnitInfo()
        {
            return;
        }// end function

        public static function writeUnitInfo(param1:Enemy, param2:MovieClip, param3:Boolean = false) : void
        {
            var _loc_5:Array = null;
            var _loc_4:Boolean = false;
            if (param1 is Aerostat)
            {
                _loc_5 = aerostat;
            }
            else if (param1 is Airplane)
            {
                _loc_5 = airplane;
            }
            else if (param1 is Airship)
            {
                _loc_5 = airship;
            }
            else if (param1 is Balloon)
            {
                _loc_5 = ballon;
            }
            else if (param1 is Car)
            {
                _loc_5 = car;
            }
            else if (param1 is Helicopter)
            {
                _loc_5 = helicopter;
            }
            else if (param1 is Tank1)
            {
                _loc_5 = tank1;
            }
            else if (param1 is Tank2)
            {
                _loc_5 = tank2;
            }
            else if (param1 is Tank3)
            {
                _loc_5 = tank3;
            }
            else if (param1 is Tank4)
            {
                _loc_5 = tank4;
            }
            else if (param1 is Tanket)
            {
                _loc_5 = tanket;
            }
            else if (param1 is Unit1)
            {
                _loc_4 = true;
                _loc_5 = unit1;
            }
            else if (param1 is Unit2)
            {
                _loc_4 = true;
                _loc_5 = unit2;
            }
            else if (param1 is Walker1)
            {
                _loc_5 = walker1;
            }
            else if (param1 is Walker2)
            {
                _loc_5 = walker2;
            }
            else if (param1 is Wheel)
            {
                _loc_5 = wheel;
            }
            else if (param1 is Parashutist)
            {
                _loc_4 = true;
                _loc_5 = parashut;
            }
            param2.txtHealth.textColor = _loc_5[0];
            param2.txtAttack.textColor = _loc_5[1];
            param2.txtArmor.textColor = _loc_5[3];
            param2.txtSpeed.textColor = _loc_5[5];
            if (param3)
            {
                param2.txtDescription.text = _loc_5[7];
                param2.txtHealth.text = param1.health;
            }
            else
            {
                param2.txtName.text = param1.infoName;
                param2.txtHealth.text = param1.health + "/" + param1.maxHealth;
            }
            param2.txtArmor.text = _loc_5[2];
            param2.txtAttack.text = param1.minDamage + "-" + param1.maxDamage;
            param2.txtSpeed.text = _loc_5[4];
            if (param2.mcHealth != undefined)
            {
                if (_loc_4)
                {
                    param2.mcHealth.gotoAndStop(1);
                }
                else
                {
                    param2.mcHealth.gotoAndStop(2);
                }
            }
            return;
        }// end function

    }
}
