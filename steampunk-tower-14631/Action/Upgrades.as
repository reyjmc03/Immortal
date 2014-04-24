package 
{
    import __AS3__.vec.*;

    public class Upgrades extends Object
    {
        private static var upgrTower:Vector.<Upgrade> = new Vector.<Upgrade>;
        private static var upgrMachineGun:Vector.<Upgrade> = new Vector.<Upgrade>;
        private static var upgrHeavyGun:Vector.<Upgrade> = new Vector.<Upgrade>;
        private static var upgrSaws:Vector.<Upgrade> = new Vector.<Upgrade>;
        private static var upgrLightning:Vector.<Upgrade> = new Vector.<Upgrade>;
        public static var tower:Object = {moneyStart:0, reloadTime:0, moneyEnemy:0, experience:0, speed:0};
        public static var machineGun:Object = {dist:0, critical:0, fireUp:0, damage:0, speed:0};
        public static var heavyGun:Object = {bullets:0, dist:0, splash:0, fireUp:0, damage:0};
        public static var saws:Object = {price:0, bullets:0, speed:0, critical:0, damage:0};
        public static var lightning:Object = {damage:0, speed:0, shock:0, chain:0};
        public static var towerInd:int = 0;
        public static var machineGunInd:int = 0;
        public static var heavyGunInd:int = 0;
        public static var sawsInd:int = 0;
        public static var lightningInd:int = 0;
        public static var starsCount:int = 0;

        public function Upgrades()
        {
            return;
        }// end function

        public static function getTowerUpgrade(param1:int) : Upgrade
        {
            return upgrTower[param1];
        }// end function

        public static function getMachineGunUpgrade(param1:int) : Upgrade
        {
            return upgrMachineGun[param1];
        }// end function

        public static function getHeavyGunUpgrade(param1:int) : Upgrade
        {
            return upgrHeavyGun[param1];
        }// end function

        public static function getSawsUpgrade(param1:int) : Upgrade
        {
            return upgrSaws[param1];
        }// end function

        public static function getLightningUpgrade(param1:int) : Upgrade
        {
            return upgrLightning[param1];
        }// end function

        public static function setTowerUpgr(param1:int) : void
        {
            towerInd = param1;
            copyParams(upgrTower, tower, param1);
            return;
        }// end function

        public static function setMachineGunUpgr(param1:int) : void
        {
            machineGunInd = param1;
            copyParams(upgrMachineGun, machineGun, param1);
            return;
        }// end function

        public static function setHeavyGunUpgr(param1:int) : void
        {
            heavyGunInd = param1;
            copyParams(upgrHeavyGun, heavyGun, param1);
            return;
        }// end function

        public static function setSawsUpgr(param1:int) : void
        {
            sawsInd = param1;
            copyParams(upgrSaws, saws, param1);
            return;
        }// end function

        public static function setLightningUpgr(param1:int) : void
        {
            lightningInd = param1;
            copyParams(upgrLightning, lightning, param1);
            return;
        }// end function

        private static function copyParams(param1:Vector.<Upgrade>, param2:Object, param3:int) : void
        {
            var _loc_4:String = null;
            var _loc_5:int = 0;
            var _loc_6:Object = null;
            for (_loc_4 in param2)
            {
                
                param2[_loc_4] = 0;
            }
            _loc_5 = 0;
            while (_loc_5 < param3)
            {
                
                _loc_6 = param1[_loc_5].modifer;
                for (_loc_4 in _loc_6)
                {
                    
                    param2[_loc_4] = _loc_6[_loc_4];
                }
                _loc_5++;
            }
            return;
        }// end function

        public static function initialize() : void
        {
            upgrTower.push(new Upgrade(2, {moneyStart:1000}, "Economy", "Improvement of the tower’s steam engines.  Some money is saved due to less consumption of coal.", "+ $1000 at the beginning"));
            upgrTower.push(new Upgrade(2, {reloadTime:0.2}, "Reloading speed", "Increase the ammunition’s feeding system, and the tower’s bands and conveyors by means of a new type of implementation.", "20% less time reloading cannons"));
            upgrTower.push(new Upgrade(2, {experience:0.1}, "Soldiers training", "Recruitment of new commanders and mercenaries for training private staff of the tower.", "10% more exp. for cannons"));
            upgrTower.push(new Upgrade(4, {moneyEnemy:0.1}, "Rebels funding", "Support of new group of rebels, funding insurgency campaigns all over the world.", "10% more money from enemies"));
            upgrTower.push(new Upgrade(4, {eyeReload:0.2}, "“The Eye”", "Allows the main weapon of the tower to accumulate critical volumes of steam faster.", "20% less recharge time of ”Eye”"));
            upgrMachineGun.push(new Upgrade(1, {dist:10}, "Ballistics", "Change the bullet’s shape.  The new, more streamlined bullet hits at long distances without losing momentum.", "+10 Firing range"));
            upgrMachineGun.push(new Upgrade(2, {critical:0.02}, "Steel heart", "Armor-piercing bullets with steel heat-treated core in lead shell.", "+2% Chance of Critical hit"));
            upgrMachineGun.push(new Upgrade(3, {fireUp:0.03}, "Fire heart", "Armor-piercing incendiary bullets contain extra charge of phosphorus for ignition of light-armored targets.", "+3% Chance of fire-setting"));
            upgrMachineGun.push(new Upgrade(4, {damage:0.2}, "New bullets", "Increase of caliber of bullets for all modifications of large-caliber machineguns.", "+20% Damage"));
            upgrMachineGun.push(new Upgrade(4, {speed:-0.2}, "Max. firing speed", "Improvement of breech mechanism and ammunition feeding system.", "+20% Firing speed"));
            upgrHeavyGun.push(new Upgrade(1, {bullets:5}, "Capacity", "Increase of capacity for shells and improvement of ammunition feeding system.", "+5 Shells "));
            upgrHeavyGun.push(new Upgrade(2, {dist:10}, "New shape", "Change the shell’s shape. The new, more streamlined shell hits at long distances without losing momentum.", "+10 Firing range"));
            upgrHeavyGun.push(new Upgrade(3, {splash:0.2}, "Shrapnel", "Adding shrapnel to standard high-explosive incendiary shell.", "+20% Splash damage"));
            upgrHeavyGun.push(new Upgrade(4, {fireUp:0.1}, "Thermite", "Exchange the phosphoric composition of the thermite for a more powerful incendiary mixture with a burning temperature.", "+10% Chance of fire-setting"));
            upgrHeavyGun.push(new Upgrade(4, {damage:0.15}, "Trotyl", "Increase of quantity of trotyl in blast charge.", "+15% Damage"));
            upgrSaws.push(new Upgrade(2, {price:-0.1}, "Serial production", "Development of new gun prototype to serial production.", "-10% Cost to buy the first Saw"));
            upgrSaws.push(new Upgrade(2, {bullets:5}, "More saws", "Improve the saw’s feeding mechanism by decreasing the saw’s thickness.", "+5 Shells"));
            upgrSaws.push(new Upgrade(3, {speed:-0.2}, "New mechanisms", "Improvement of system of steam feeding to starting mechanism and providing bigger critical mass of steam for saw launch.", "+20% Firing speed"));
            upgrSaws.push(new Upgrade(3, {critical:0.05}, "Sharpening", "Use the updated saw to provide outstanding sharpness.", "+5% Chance of Critical hit"));
            upgrSaws.push(new Upgrade(4, {damage:0.15}, "New saw", "Using new saw shape and new material – harder and heat-treated.", "+15% Damage"));
            upgrLightning.push(new Upgrade(2, {damage:0.1}, "Current intensity", "Improvement of generator prototype for creating bigger current intensity.", "+10% Damage"));
            upgrLightning.push(new Upgrade(2, {speed:-0.2}, "Calibration", "Improvement of cooling system of the gun and decrease of the time of generator reloading.", "+20% Firing speed"));
            upgrLightning.push(new Upgrade(3, {shock:0.05}, "Electric shock", "Increase of energy and current intensity of discharge of electric gun. ", "+5% Shock"));
            upgrLightning.push(new Upgrade(3, {chain:1}, "Death to many", "Strengthening of chain lightnings by creating new kinds of generators. ", "+1 chains in lightning"));
            upgrLightning.push(new Upgrade(4, {chain:2}, "Death to all", "Improvement of chain lightning generator by consumption of energy from the main generator of the tower.", "+1 more chains in lightning"));
            return;
        }// end function

    }
}
