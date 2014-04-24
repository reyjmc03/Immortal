package 
{
    import flash.display.*;

    public class CannonInfo extends Object
    {
        private static var color1:uint = 6736896;
        private static var color2:uint = 16777062;
        private static var color3:uint = 16763904;
        private static var color4:uint = 16737792;
        private static var color5:uint = 16711680;
        private static var machineGun1:Array = [color1, "Fast", color5, color5, "Short", color3, "Machinegun \"Wasp\"", "", "Large-caliber machinegun "];
        private static var machineGun2:Array = [color1, "Fast", color5, color5, "Short", color3, "Machinegun \"Wasp 2\"", "", "Large-caliber machinegun with improved characteristics"];
        private static var machineGun3_1:Array = [color1, "Fast", color5, color5, "Short", color3, "Machinegun \"Locust\"", "High Firing speed", "Double-barreled machinegun"];
        private static var machineGun4_1:Array = [color2, "Fast", color5, color5, "Short", color3, "Machinegun \"Desert Locust\"", "Max Firing speed", "Double-barreled machinegun with improved system recoil"];
        private static var machineGun3_2:Array = [color2, "Fast", color5, color5, "Average", color4, "Machinegun \"Hornet\"", "High damage & fire-setting", "Heavy machinegun with incendiary bullets"];
        private static var machineGun4_2:Array = [color3, "Fast", color5, color5, "Average", color4, "Machinegun \"Red Hornet\"", "High damage & fire-setting", "Heavy machinegun with explosive bullets"];
        private static var heavyGun1:Array = [color2, "Slow", color3, color1, "Short", color3, "Heavy gun \"Axe\"", "", "75mm. Smoothbore cannon"];
        private static var heavyGun2:Array = [color3, "Slow", color3, color2, "Short", color3, "Heavy gun \"War Axe\"", "", "114мм. Heavy Smoothbore cannon"];
        private static var heavyGun3_1:Array = [color4, "Slow", color3, color3, "Average", color4, "Heavy gun \"Arrow\"", "High damage", "Long-barreled artillery cannon"];
        private static var heavyGun4_1:Array = [color5, "Average", color4, color4, "Long", color5, "Heavy gun \"Lance\"", "High damage at Long range", "Heavy long-barreled artillery cannon"];
        private static var heavyGun3_2:Array = [color4, "Average", color4, color3, "Average", color4, "Heavy gun \"Mace\"", "Blast wave", "Heavy automatic mortar with incendiary shells"];
        private static var heavyGun4_2:Array = [color4, "Average", color4, color4, "Long", color5, "Heavy gun \"Hammer\"", "Deadly blast wave", "Ultraheavy automatic mortar with incendiary shells"];
        private static var sawGun1:Array = [color2, "Slow", color3, color1, "Average", color4, "Saws \"Claw\"", "", "Special shells (Circular saws) launcher"];
        private static var sawGun2:Array = [color3, "Slow", color3, color1, "Long", color5, "Saws \"Fang\"", "", "Circular saws launcher with new acceleration mechanism"];
        private static var sawGun3_1:Array = [color4, "Slow", color3, color3, "Long", color5, "Saws \"Leopard\"", "High firing speed", "Circular saws launcher with improved system recoil"];
        private static var sawGun4_1:Array = [color5, "Average", color4, color3, "Long", color5, "Saws \"Guepard\"", "Very high firing speed", "Maximum fast circular saws launcher"];
        private static var sawGun3_2:Array = [color5, "Slow", color3, color3, "Long", color5, "Saws \"Tiger\"", "High damage", "Special very sharp shells launcher"];
        private static var sawGun4_2:Array = [color5, "Slow", color3, color3, "Long", color5, "Saws \"Lion\"", "Max Damage", "Special shells launcher with additional magnetic acceleration"];
        private static var electroGun1:Array = [color1, "Average", color4, color1, "Average", color3, "Lightning \"Thunder\"", "", "Nicola Tesla cannon prototype"];
        private static var electroGun2:Array = [color2, "Average", color4, color2, "Average", color3, "Lightning \"Thunderstorm\"", "", "Improved Tesla cannon prototype"];
        private static var electroGun3_1:Array = [color3, "Average", color4, color3, "Average", color3, "Lightning \"Hurricane\"", "More Chains", "Chain lightning generator"];
        private static var electroGun4_1:Array = [color4, "Average", color4, color4, "Average", color3, "Lightning \"Tornado\"", "More Chains", "Modification of Chain lightning generator"];
        private static var electroGun3_2:Array = [color3, "Average", color4, color3, "Average", color3, "Lightning \"Tempest\"", "Chance of shock", "Ball lightning generator"];
        private static var electroGun4_2:Array = [color4, "Average", color4, color3, "Average", color3, "Lightning \"Blizzard\"", "High chance of shock", "Modification of Ball lightning generator"];

        public function CannonInfo()
        {
            return;
        }// end function

        public static function writeCannonInfo(param1:int, param2:int, param3:MovieClip, param4:Boolean = false) : void
        {
            var _loc_5:Array = null;
            if (param1 == 1)
            {
                if (param2 == 0)
                {
                    _loc_5 = machineGun1;
                }
                else if (param2 == 1)
                {
                    _loc_5 = machineGun2;
                }
                else if (param2 == 2)
                {
                    _loc_5 = machineGun3_1;
                }
                else if (param2 == 3)
                {
                    _loc_5 = machineGun4_1;
                }
                else if (param2 == 4)
                {
                    _loc_5 = machineGun3_2;
                }
                else if (param2 == 5)
                {
                    _loc_5 = machineGun4_2;
                }
            }
            else if (param1 == 2)
            {
                if (param2 == 0)
                {
                    _loc_5 = heavyGun1;
                }
                else if (param2 == 1)
                {
                    _loc_5 = heavyGun2;
                }
                else if (param2 == 2)
                {
                    _loc_5 = heavyGun3_1;
                }
                else if (param2 == 3)
                {
                    _loc_5 = heavyGun4_1;
                }
                else if (param2 == 4)
                {
                    _loc_5 = heavyGun3_2;
                }
                else if (param2 == 5)
                {
                    _loc_5 = heavyGun4_2;
                }
            }
            else if (param1 == 3)
            {
                if (param2 == 0)
                {
                    _loc_5 = sawGun1;
                }
                else if (param2 == 1)
                {
                    _loc_5 = sawGun2;
                }
                else if (param2 == 2)
                {
                    _loc_5 = sawGun3_1;
                }
                else if (param2 == 3)
                {
                    _loc_5 = sawGun4_1;
                }
                else if (param2 == 4)
                {
                    _loc_5 = sawGun3_2;
                }
                else if (param2 == 5)
                {
                    _loc_5 = sawGun4_2;
                }
            }
            else if (param1 == 4)
            {
                if (param2 == 0)
                {
                    _loc_5 = electroGun1;
                }
                else if (param2 == 1)
                {
                    _loc_5 = electroGun2;
                }
                else if (param2 == 2)
                {
                    _loc_5 = electroGun3_1;
                }
                else if (param2 == 3)
                {
                    _loc_5 = electroGun4_1;
                }
                else if (param2 == 4)
                {
                    _loc_5 = electroGun3_2;
                }
                else if (param2 == 5)
                {
                    _loc_5 = electroGun4_2;
                }
            }
            param3.txtAttack.textColor = _loc_5[0];
            param3.txtFireSpeed.textColor = _loc_5[2];
            param3.txtAmmo.textColor = _loc_5[3];
            param3.txtDistance.textColor = _loc_5[5];
            param3.txtAttack.text = _loc_5[9];
            param3.txtFireSpeed.text = _loc_5[1];
            param3.txtAmmo.text = _loc_5[10];
            param3.txtDistance.text = _loc_5[4];
            if (param3.descr != undefined)
            {
                param3.descr.text = _loc_5[9];
            }
            if (param3.txtDescription != undefined)
            {
                param3.txtDescription.text = _loc_5[8];
            }
            if (param3.txtFeature != undefined)
            {
                param3.txtFeature.text = _loc_5[7];
            }
            var _loc_6:* = param3.mcImg != undefined;
            if (param3.mcImg != undefined)
            {
                if (param1 == 1)
                {
                    if (param2 == 0)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("m1");
                    }
                    else if (param2 == 1)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("m2");
                    }
                    else if (param2 == 2)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("m3");
                    }
                    else if (param2 == 3)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("m5");
                    }
                    else if (param2 == 4)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("m4");
                    }
                    else if (param2 == 5)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("m6");
                    }
                }
                else if (param1 == 2)
                {
                    if (param2 == 0)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("h1");
                    }
                    else if (param2 == 1)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("h2");
                    }
                    else if (param2 == 2)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("h3");
                    }
                    else if (param2 == 3)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("h5");
                    }
                    else if (param2 == 4)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("h4");
                    }
                    else if (param2 == 5)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("h6");
                    }
                }
                else if (param1 == 3)
                {
                    if (param2 == 0)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("s1");
                    }
                    else if (param2 == 1)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("s2");
                    }
                    else if (param2 == 2)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("s3");
                    }
                    else if (param2 == 3)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("s5");
                    }
                    else if (param2 == 4)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("s4");
                    }
                    else if (param2 == 5)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("s6");
                    }
                }
                else if (param1 == 4)
                {
                    if (param2 == 0)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("l1");
                    }
                    else if (param2 == 1)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("l2");
                    }
                    else if (param2 == 2)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("l3");
                    }
                    else if (param2 == 3)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("l5");
                    }
                    else if (param2 == 4)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("l4");
                    }
                    else if (param2 == 5)
                    {
                        param3.mcImg.mcImgInside.gotoAndStop("l6");
                    }
                }
                param3.mcName.gotoAndStop(param3.mcImg.mcImgInside.currentFrame);
            }
            else if (param3.txtName != undefined)
            {
                param3.txtName.text = _loc_5[6];
            }
            if (!param4)
            {
                if (param1 == 1)
                {
                    writeUpgrInfo(Upgrades.machineGun, param3, _loc_5[9], _loc_5[10]);
                }
                else if (param1 == 2)
                {
                    writeUpgrInfo(Upgrades.heavyGun, param3, _loc_5[9], _loc_5[10]);
                }
                else if (param1 == 3)
                {
                    writeUpgrInfo(Upgrades.saws, param3, _loc_5[9], _loc_5[10]);
                }
                else if (param1 == 4)
                {
                    writeUpgrInfo(Upgrades.lightning, param3, _loc_5[9], _loc_5[10]);
                }
            }
            return;
        }// end function

        private static function writeUpgrInfo(param1:Object, param2:MovieClip, param3:String, param4:int) : void
        {
            var _loc_5:Array = null;
            var _loc_6:int = 0;
            var _loc_7:int = 0;
            if (param1.damage != undefined && param1.damage != 0)
            {
                _loc_5 = param3.split("-");
                _loc_6 = parseInt(_loc_5[0]);
                _loc_7 = parseInt(_loc_5[1]);
                _loc_6 = _loc_6 + Math.ceil(_loc_6 * param1.damage);
                _loc_7 = _loc_7 + Math.ceil(_loc_7 * param1.damage);
                param2.txtAttack.text = _loc_6 + "-" + _loc_7;
            }
            if (param1.bullets != undefined && param1.bullets != 0)
            {
                param2.txtAmmo.text = (param4 + param1.bullets).toString();
            }
            return;
        }// end function

        public static function initialize() : void
        {
            var _loc_1:Array = null;
            var _loc_2:* = new CannonMachineGun();
            _loc_2.initializeData();
            _loc_1 = _loc_2.getUpgradeParams(0);
            machineGun1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(1);
            machineGun2.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(2);
            machineGun3_1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(3);
            machineGun3_2.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(4);
            machineGun4_1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(5);
            machineGun4_2.push(_loc_1[2], _loc_1[4]);
            _loc_2 = new CannonHeavyGun();
            _loc_2.initializeData();
            _loc_1 = _loc_2.getUpgradeParams(0);
            heavyGun1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(1);
            heavyGun2.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(2);
            heavyGun3_1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(3);
            heavyGun3_2.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(4);
            heavyGun4_1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(5);
            heavyGun4_2.push(_loc_1[2], _loc_1[4]);
            _loc_2 = new CannonSawGun();
            _loc_2.initializeData();
            _loc_1 = _loc_2.getUpgradeParams(0);
            sawGun1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(1);
            sawGun2.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(2);
            sawGun3_1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(3);
            sawGun3_2.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(4);
            sawGun4_1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(5);
            sawGun4_2.push(_loc_1[2], _loc_1[4]);
            _loc_2 = new CannonElectroGun();
            _loc_2.initializeData();
            _loc_1 = _loc_2.getUpgradeParams(0);
            electroGun1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(1);
            electroGun2.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(2);
            electroGun3_1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(3);
            electroGun3_2.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(4);
            electroGun4_1.push(_loc_1[2], _loc_1[4]);
            _loc_1 = _loc_2.getUpgradeParams(5);
            electroGun4_2.push(_loc_1[2], _loc_1[4]);
            return;
        }// end function

    }
}
