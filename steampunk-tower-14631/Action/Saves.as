package 
{
    import flash.net.*;
    import flash.utils.*;

    public class Saves extends Object
    {
        public static var curSaves:SavesProfile;
        private static var saveName:String = "steampunk_tower_game_by_dgcompany";
        public static var profile1:SavesProfile = new SavesProfile();
        public static var profile2:SavesProfile = new SavesProfile();
        public static var profile3:SavesProfile = new SavesProfile();

        public function Saves()
        {
            return;
        }// end function

        public static function clear() : void
        {
            var _loc_1:* = SharedObject.getLocal(saveName);
            _loc_1.clear();
            _loc_1.flush();
            profile1.clear();
            profile2.clear();
            profile3.clear();
            return;
        }// end function

        public static function save(param1:Boolean = true) : void
        {
            if (param1)
            {
                Upgrades.starsCount = curSaves.totalStars;
                curSaves.upgrTowerIndex = Upgrades.towerInd;
                curSaves.upgrMachineGunIndex = Upgrades.machineGunInd;
                curSaves.upgrHeavyGunIndex = Upgrades.heavyGunInd;
                curSaves.upgrLightningIndex = Upgrades.lightningInd;
                curSaves.upgrSawsIndex = Upgrades.sawsInd;
            }
            var _loc_2:* = new ByteArray();
            _loc_2.writeObject(profile1);
            _loc_2.writeObject(profile2);
            _loc_2.writeObject(profile3);
            var _loc_3:* = SharedObject.getLocal(saveName);
            _loc_3.data.allSaves = _loc_2;
            _loc_3.flush();
            return;
        }// end function

        public static function load() : void
        {
            var ba:ByteArray;
            var savesObject:* = SharedObject.getLocal(saveName);
            if (savesObject.data.allSaves != undefined && savesObject.data.allSaves is ByteArray)
            {
                ba = savesObject.data.allSaves;
                ba.position = 0;
                try
                {
                    profile1.loadFromObject(ba.readObject());
                }
                catch (err:Error)
                {
                    try
                    {
                    }
                    profile2.loadFromObject(ba.readObject());
                }
                catch (err:Error)
                {
                    try
                    {
                    }
                    profile3.loadFromObject(ba.readObject());
                }
                catch (err:Error)
                {
                }
            }
            if (profile2.active)
            {
                curSaves = profile2;
            }
            else if (profile3.active)
            {
                curSaves = profile3;
            }
            else
            {
                profile1.active = true;
                curSaves = profile1;
            }
            Upgrades.setTowerUpgr(curSaves.upgrTowerIndex);
            Upgrades.setMachineGunUpgr(curSaves.upgrMachineGunIndex);
            Upgrades.setHeavyGunUpgr(curSaves.upgrHeavyGunIndex);
            Upgrades.setSawsUpgr(curSaves.upgrSawsIndex);
            Upgrades.setLightningUpgr(curSaves.upgrLightningIndex);
            Upgrades.starsCount = curSaves.totalStars;
            return;
        }// end function

    }
}
